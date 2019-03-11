#ifndef CONNECTION_H
#define CONNECTION_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlDriver>
#include <QDebug>
#include <QSqlQuery>

class Connection
{
public:
   void connect(QString hostName, QString dbName, QString userName, QString password);
   void registryListens();
};

#endif // CONNECTION_H
