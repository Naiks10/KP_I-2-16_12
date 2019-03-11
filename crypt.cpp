#include "crypt.h"
#include "qtinyaes.h"
#include "main.h"


QString Crypt::crypt(QString string)
{
    QTinyAes aes;
    aes.setMode(QTinyAes::ECB);
    aes.setKey("9301930498502394");
    aes.setIv("1930219423140321");
    QByteArray encr = string.toUtf8();
    encr = aes.encrypt(encr);
    encr = encr.toBase64();
    return encr;
}

QString Crypt::decrypt(QString string)
{
    QTinyAes aes;
    aes.setMode(QTinyAes::ECB);
    aes.setKey("9301930498502394");
    aes.setIv("1930219423140321");
    QByteArray encr = aes.decrypt(encr.fromBase64(string.toUtf8()));
    return encr;
}
