#include "market.h"
#include <QString>
#include <qtinyaes.h>
#include "main.h"

void Market::addCustomer(QString firstName, QString surName, QString middleName, QString passportSerial, QString passportNumber, QString dateOfBirth, QString sex)
{
    QSqlQuery query;
    query.prepare("CALL ADDCUSTOMER"
                   "("
                        ":FIRSTNAME,"
                        ":SURNAME,"
                        ":MIDDLENAME,"
                        ":PASSWORDSERIAL,"
                        ":PASSWORDNUMBER,"
                        ":DATEOFBIRTH,"
                        ":SEX"
                   ")");
    query.bindValue(":FIRSTNAME", firstName);
    query.bindValue(":SURNAME", surName);
    query.bindValue(":MIDDLENAME", middleName);
    query.bindValue(":PASSWORDSERIAL", passportSerial);
    query.bindValue(":PASSWORDNUMBER", passportNumber);
    query.bindValue(":DATEOFBIRTH", dateOfBirth);
    query.bindValue(":SEX", sex);
    query.exec();
}

void Market::removeCustomer(QString idCustomer)
{
    QSqlQuery query;
    query.prepare("CALL REMOVECUSTOMER(:ID)");
    query.bindValue(":ID", idCustomer);
    query.exec();
}

void Market::editCustomer(QString firstName, QString surName, QString middleName, QString passportSerial, QString passportNumber, QString dateOfBirth, QString sex)
{
    QSqlQuery query;
    query.prepare("CALL EDITCUSTOMER"
        "("
            ":FIRSTNAME,"
            ":SURNAME,"
            ":MIDDLENAME,"
            ":PASSWORDSERIAL,"
            ":PASSWORDNUMBER,"
            ":DATEOFBIRTH,"
            ":SEX"
        ")");
    query.bindValue(":FIRSTNAME", firstName);
    query.bindValue(":SURNAME", surName);
    query.bindValue(":MIDDLENAME", middleName);
    query.bindValue(":PASSWORDSERIAL", passportSerial);
    query.bindValue(":PASSWORDNUMBER", passportNumber);
    query.bindValue(":DATEOFBIRTH", dateOfBirth);
    query.bindValue(":SEX", sex);
    query.exec();
}

void Market::addCard(QString idCustomer)
{
    QSqlQuery query;
    query.prepare("CALL ADDCARD(:ID)");
    query.bindValue(":ID", idCustomer);
    query.exec();
}

void Market::addOrder(QString orderNum, QString orderDate, QString customer, QString worker, QString cost)
{
    QSqlQuery query;
    query.prepare("CALL ADDORDER"
        "("
            ":ORDERNUM,"
            ":ORDERDATE,"
            ":CUSTOMER,"
            ":WORKER,"
            ":COST,"
        ")");
    query.bindValue(":ORDERNUM", orderNum);
    query.bindValue(":ORDERDATE", orderDate);
    query.bindValue(":CUSTOMER", customer);
    query.bindValue(":WORKER", worker);
    query.bindValue(":COST", cost);
    query.exec();
}

void Market::editOrder(QString orderNum, QString orderDate, QString customer, QString worker, QString cost, QString status)
{
    QSqlQuery query;
    query.prepare("CALL ADDORDER"
        "("
            ":ORDERNUM,"
            ":ORDERDATE,"
            ":CUSTOMER,"
            ":WORKER,"
            ":COST,"
            ":STATUS"
        ")");
    query.bindValue(":ORDERNUM", orderNum);
    query.bindValue(":ORDERDATE", orderDate);
    query.bindValue(":CUSTOMER", customer);
    query.bindValue(":WORKER", worker);
    query.bindValue(":COST", cost);
    query.bindValue(":STATUS", status);
    query.exec();
}

void Market::abortOrder(QString idOrder)
{
    QSqlQuery query;
    query.prepare("CALL ABORTORDER(:ID)");
    query.bindValue(":ID", idOrder);
    query.exec();
}

void Market::closeOrder(QString idOrder)
{
    QSqlQuery query;
    query.prepare("CALL CLOSEORDER(:ID)");
    query.bindValue(":ID", idOrder);
    query.exec();
}


