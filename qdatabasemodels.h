#ifndef QDATABASEMODELS_H
#define QDATABASEMODELS_H

#include <QObject>
#include "sqlquerymodel.h"
#include "crypt.h"

class QDatabaseModels : public QObject
{
    Q_OBJECT
public:
     QDatabaseModels();
     SqlQueryModel* orders = new SqlQueryModel(0, "SELECT COUNTRY_NAME AS Страна FROM COUNTRY" );
     SqlQueryModel* customer = new SqlQueryModel(0, "SELECT * FROM CUSTOMER" );
public slots:
     static void updateTableOrders();

};



#endif // QDATABASEMODELS_H
