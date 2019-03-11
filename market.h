#ifndef MARKET_H
#define MARKET_H
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QSqlRecord>
#include <QSqlDriver>
#include <QObject>
#include <QString>

class Market
{
public:
    static void addCustomer
    (
        QString firstName,
        QString surName,
        QString middleName,
        QString passportSerial,
        QString passportNumber,
        QString dateOfBirth,
        QString sex
     );
   static void removeCustomer(QString idCustomer);
   static void editCustomer
    (
        QString firstName,
        QString surName,
        QString middleName,
        QString passportSerial,
        QString passportNumber,
        QString dateOfBirth,
        QString sex
    );
   static void addCard(QString idCustomer);
   static void addOrder
    (
        QString orderNum,
		QString orderDate,
		QString customer,
		QString worker,
		QString cost
    );
   static void closeOrder(QString idOrder);
   static void abortOrder(QString idOrder);
   static void editOrder
    (
		QString orderNum,
		QString orderDate,
		QString customer,
		QString worker,
		QString cost,
		QString status
    );

};

#endif // MARKET_H
