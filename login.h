#ifndef LOGIN_H
#define LOGIN_H
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QSqlRecord>
#include <QSqlDriver>
#include <QDebug>
#include <QString>


class Login
{
public:
    static void login(QString login, QString password);
};

#endif // LOGIN_H
