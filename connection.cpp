#include "connection.h"
//#include "main.h"

void Connection::connect(QString hostName, QString dbName, QString userName, QString password)
{
  QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
   try
   {
        db.setHostName(hostName);
        db.setDatabaseName(dbName);
        db.setUserName(userName);
        db.setPassword(password);
        db.open();

   }
   catch (const std::exception& e)
   {
       qDebug() << e.what();
   }
  this->registryListens();

}

void Connection::registryListens()
{
    QSqlDatabase::database().driver()->subscribeToNotification("cont");
    QSqlDatabase::database().driver()->subscribeToNotification("cont1");

//    QObject::connect(QSqlDatabase::database().driver(), static_cast<void(QSqlDriver::*)(const QString &, QSqlDriver::NotificationSource, const QVariant &)>(&QSqlDriver::notification),
//                [=](const QString &name, QSqlDriver::NotificationSource source, const QVariant &payload)
//                {
//                    if (name == "cont")
//                    {
//                        QDatabaseModels::updateTableOrders();
//                    }
//                    else
//                    {
//                        q->orders->setQuery("SELECT COUNTRY_NAME AS Страна FROM COUNTRY",0);
//                    }
//                    qDebug() << name;
//                });
//
}

