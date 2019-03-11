#include "sqlquerymodel.h"
#include <QSqlRecord>
#include <QSqlDriver>
#include <QSqlQuery>
#include <QSqlField>

SqlQueryModel::SqlQueryModel(QObject *parent, QString query) :
    QSqlQueryModel(parent)
{
    //setQuery(query,0);
}


void SqlQueryModel::setQuery(const QString &query, const QSqlDatabase &db)
{
    QSqlQueryModel::setQuery(query, db);
    generateRoleNames();
}

QString SqlQueryModel::sqlDecrypt(QString value)
{
   value = Crypt::decrypt(value);
   return value;
}

void SqlQueryModel::setQuery(const QString &query, int a)
{
    QSqlQueryModel::setQuery(query);
    generateRoleNames();
}

void SqlQueryModel::generateRoleNames()
{
    m_roleNames.clear();
    for( int i = 0; i < record().count(); i ++) {
        m_roleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }
}

QVariant SqlQueryModel::data(const QModelIndex &index, int role) const
{
    QVariant value;

    if(role < Qt::UserRole) {
        value = QSqlQueryModel::data(index, role);
        value = Crypt::decrypt(value.toString());
    }
    else {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
        QString str = value.toString();
         if (str[str.length()-1] == "=")
             return Crypt::decrypt(value.toString());
         else {
             return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
         }
    }

    //return value;

}

int SqlQueryModel::colCount()
{
    qDebug() << "ppp";
    return  this->columnCount() - 1;
}

QString SqlQueryModel::colName(int i)
{
    return this->query().record().fieldName(i);
}
