#pragma once
#include <QSqlQueryModel>
#include "crypt.h"

class SqlQueryModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit SqlQueryModel(QObject *parent = 0, QString query = "");

    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const {	return m_roleNames;	}
public slots:
    void setQuery(const QString &query, int a);
    int colCount();
    QString colName(int i);
    QString sqlDecrypt(QString value);
private:
    void generateRoleNames();
    QHash<int, QByteArray> m_roleNames;
};
