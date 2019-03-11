#ifndef CRYPT_H
#define CRYPT_H

#include <QObject>
#include <QtDebug>

class Crypt
{
public:
   static QString crypt(QString string);
   static QString decrypt(QString string);
};

#endif // CRYPT_H
