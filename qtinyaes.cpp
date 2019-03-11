#include "qtinyaes.h"

#include <QtMath>
#include <QDebug>
#include <QtEndian>
#if (QT_VERSION >= QT_VERSION_CHECK(5, 10, 0))
#include <QRandomGenerator>
#endif

#include <aes.hpp>
#undef CBC
#undef ECB
#undef CTR

const int QTinyAes::BlockSize(AES_BLOCKLEN);
const int QTinyAes::KeySize(AES_KEYLEN);

class QTinyAesPrivate
{
public:
	QTinyAesPrivate();

	QTinyAes::CipherMode mode;
	QByteArray key;
	QByteArray iv;
};

#if (QT_VERSION >= QT_VERSION_CHECK(5, 10, 0))
QByteArray QTinyAes::generateKey()
{
	static_assert(KeySize >= sizeof(quint64), "Invalid aes keysize?!?");
	QByteArray key(KeySize, Qt::Uninitialized);
	auto rng = QRandomGenerator64::system();
	rng->fillRange((quint64*)key.data(), key.size()/sizeof(quint64));
	return key;
}
#endif

QTinyAes::QTinyAes(QObject *parent) :
	QObject(parent),
	d(new QTinyAesPrivate())
{}

QTinyAes::QTinyAes(QTinyAes::CipherMode mode, const QByteArray &key, const QByteArray &iv, QObject *parent) :
	QTinyAes(parent)
{
	d->mode = mode;
	d->key = key;
	d->iv = iv;
}

QTinyAes::~QTinyAes()
{
	memset(d->key.data(), 0, d->key.size());
	memset(d->iv.data(), 0, d->iv.size());
}

QTinyAes::CipherMode QTinyAes::mode() const
{
	return d->mode;
}

QByteArray QTinyAes::key() const
{
	return d->key;
}

QByteArray QTinyAes::iv() const
{
	return d->iv;
}

void QTinyAes::setMode(QTinyAes::CipherMode mode)
{
	d->mode = mode;
}

void QTinyAes::setKey(const QByteArray &key)
{
	resetKey();
	Q_ASSERT_X(key.size() == KeySize, Q_FUNC_INFO, "The Key-Length is not a valid length! (Check QTinyAes::KEYSIZE)");
	d->key = key;
}

void QTinyAes::resetKey()
{
	memset(d->key.data(), 0, d->key.size());
	d->key.clear();
}

void QTinyAes::setIv(const QByteArray &iv)
{
	resetIv();
	if(!iv.isEmpty()) {
		Q_ASSERT_X(iv.size() >= BlockSize, Q_FUNC_INFO, "The initialisation vector must be at least QTinyAes::BLOCKSIZE bytes long (or empty)");
		if(iv.size() > BlockSize)
			qWarning() << "IV is longer then QTinyAes::BLOCKSIZE - the rest will be truncated";
		d->iv = iv.mid(0, BlockSize);
	}
}

void QTinyAes::resetIv()
{
	memset(d->iv.data(), 0, d->iv.size());
	d->iv.clear();
}

QByteArray QTinyAes::encrypt(const QByteArray &plain) const
{
	auto buffer = plain;
	preparePlainText(buffer);
	return encryptRaw(buffer);
}

QByteArray QTinyAes::decrypt(const QByteArray &cipher) const
{
	auto buffer = decryptRaw(cipher);
	restorePlainText(buffer);
	return buffer;
}

QByteArray QTinyAes::encryptRaw(const QByteArray &plain) const
{
	Q_ASSERT_X(!d->key.isEmpty(), Q_FUNC_INFO, "The key must not be empty to encrypt data");
	Q_ASSERT_X(plain.size() % BlockSize == 0, Q_FUNC_INFO, "plain must be a multiple of QTinyAes::BlockSize");
	auto buffer = plain;

	AES_ctx ctx;
	if(d->iv.isNull())
		AES_init_ctx(&ctx, (uint8_t*)d->key.constData());
	else
		AES_init_ctx_iv(&ctx, (uint8_t*)d->key.constData(), (uint8_t*)d->iv.constData());

	switch(d->mode) {
	case CTR:
		AES_CTR_xcrypt_buffer(&ctx, (uint8_t*)buffer.data(), (uint32_t)buffer.size());
		break;
	case CBC:
		AES_CBC_encrypt_buffer(&ctx, (uint8_t*)buffer.data(),  (uint32_t)buffer.size());
		break;
	case ECB:
		for(auto i = 0; i < buffer.size(); i += BlockSize) {
			auto ctxCopy = ctx;
			AES_ECB_encrypt(&ctxCopy, (uint8_t*)(buffer.data() + i));
		}
		break;
	default:
		Q_UNREACHABLE();
		break;
	}

	memset(&ctx, 0, sizeof(AES_ctx));

	return buffer;

}

QByteArray QTinyAes::decryptRaw(const QByteArray &cipher) const
{
	Q_ASSERT_X(!d->key.isEmpty(), Q_FUNC_INFO, "The key must not be empty to decrypt data");
	Q_ASSERT_X(cipher.size() % BlockSize == 0, Q_FUNC_INFO, "cipher must be a multiple of QTinyAes::BlockSize");
	auto buffer = cipher;

	AES_ctx ctx;
	if(d->iv.isNull())
		AES_init_ctx(&ctx, (uint8_t*)d->key.constData());
	else
		AES_init_ctx_iv(&ctx, (uint8_t*)d->key.constData(), (uint8_t*)d->iv.constData());

	switch(d->mode) {
	case CTR:
		AES_CTR_xcrypt_buffer(&ctx,
							  (uint8_t*)buffer.data(),
							  (uint32_t)buffer.size());
		break;
	case CBC:
		AES_CBC_decrypt_buffer(&ctx,
							   (uint8_t*)buffer.data(),
							   (uint32_t)buffer.size());
		break;
	case ECB:
		for(auto i = 0; i < buffer.size(); i += BlockSize) {
			auto ctxCopy = ctx;
			AES_ECB_decrypt(&ctxCopy, (uint8_t*)(buffer.data() + i));
		}
		break;
	default:
		Q_UNREACHABLE();
		break;
	}

	return buffer;
}

QByteArray QTinyAes::ctrEncrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &plain)
{
	return QTinyAes(QTinyAes::CTR, key, iv).encrypt(plain);
}

QByteArray QTinyAes::ctrDecrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &cipher)
{
	return QTinyAes(QTinyAes::CTR, key, iv).decrypt(cipher);
}

QByteArray QTinyAes::cbcEncrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &plain)
{
	return QTinyAes(QTinyAes::CBC, key, iv).encrypt(plain);
}

QByteArray QTinyAes::cbcDecrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &cipher)
{
	return QTinyAes(QTinyAes::CBC, key, iv).decrypt(cipher);
}

QByteArray QTinyAes::ecbEncrypt(const QByteArray &key, const QByteArray &plain)
{
	return QTinyAes(QTinyAes::ECB, key).encrypt(plain);
}

QByteArray QTinyAes::ecbDecrypt(const QByteArray &key, const QByteArray &cipher)
{
	return QTinyAes(QTinyAes::ECB, key).decrypt(cipher);
}

void QTinyAes::preparePlainText(QByteArray &data)
{
	auto padding = (BlockSize - (data.size() % BlockSize));
	data.append(QByteArray(padding, (char)padding));
}

void QTinyAes::restorePlainText(QByteArray &data)
{
    Q_ASSERT_X(data.size() >= BlockSize, Q_FUNC_INFO, "Invalid data. Must be at least one block");
	auto padding = data.at(data.size() - 1);
	data.chop((int)padding);
}



QTinyAesPrivate::QTinyAesPrivate() :
	mode(QTinyAes::CTR),
	key(),
	iv()
{}
