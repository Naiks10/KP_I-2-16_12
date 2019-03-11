#ifndef QTINYAES
#define QTINYAES

#include <QObject>
#include <QByteArray>
#include <QVector>

class QTinyAesPrivate;
class QTinyAes : public QObject
{
	Q_OBJECT

	Q_PROPERTY(CipherMode mode READ mode WRITE setMode)
	Q_PROPERTY(QByteArray key READ key WRITE setKey RESET resetKey)
	Q_PROPERTY(QByteArray iv READ iv WRITE setIv RESET resetIv)

public:
	enum CipherMode {
		CTR,
		CBC,
		ECB
	};
	Q_ENUM(CipherMode)

	static const int BlockSize;
	static const int KeySize;

#if (QT_VERSION >= QT_VERSION_CHECK(5, 10, 0))
	static QByteArray generateKey();
#endif

	QTinyAes(QObject *parent = nullptr);
	QTinyAes(CipherMode mode, const QByteArray &key, const QByteArray &iv = QByteArray(), QObject *parent = nullptr);
	~QTinyAes();

	CipherMode mode() const;
	QByteArray key() const;
	QByteArray iv() const;

	Q_INVOKABLE QByteArray encrypt(const QByteArray &plain) const;
	Q_INVOKABLE QByteArray decrypt(const QByteArray &cipher) const;

	Q_INVOKABLE QByteArray encryptRaw(const QByteArray &plain) const;
	Q_INVOKABLE QByteArray decryptRaw(const QByteArray &cipher) const;

	static QByteArray ctrEncrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &plain);
	static QByteArray ctrDecrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &cipher);
	static QByteArray cbcEncrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &plain);
	static QByteArray cbcDecrypt(const QByteArray &key, const QByteArray &iv, const QByteArray &cipher);
	static QByteArray ecbEncrypt(const QByteArray &key, const QByteArray &plain);
	static QByteArray ecbDecrypt(const QByteArray &key, const QByteArray &cipher);

public slots:
	void setMode(CipherMode mode);
	void setKey(const QByteArray &key);
	void resetKey();
	void setIv(const QByteArray &iv);
	void resetIv();

private:
	QScopedPointer<QTinyAesPrivate> d;

	static void preparePlainText(QByteArray &data);
	static void restorePlainText(QByteArray &data);
};

#endif // QTINYAES

