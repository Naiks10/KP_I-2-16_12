#include "login.h"
#include <QString>
#include <qtinyaes.h>
#include "main.h"

    //QDatabaseModels q;

bool Login::login(QString login, QString password)
{
    QSqlQuery queryLogin;
    queryLogin.prepare("SELECT COUNT(*) FROM ACCOUNT "
                               "WHERE ACCOUNT_LOGIN = :LOGIN "
                               "AND ACCOUNT_PASSWORD = :PASSWORD");
    queryLogin.bindValue(":LOGIN", login);
    queryLogin.bindValue(":PASSWORD", password);
    queryLogin.exec();
    queryLogin.first();
    if  (queryLogin.value(0).toString() == "1")
    {
        return true;
    }
    else {
        return false;
    }
}
