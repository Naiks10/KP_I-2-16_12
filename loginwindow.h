#ifndef LOGINWINDOW_H
#define LOGINWINDOW_H

#include <QObject>
#include "login.h"

class LoginWindow : public QObject
{
    Q_OBJECT
public:
    QObject *viewer;
    QObject *Login = viewer->findChild<QObject*>("Login");
    QObject *Password = viewer->findChild<QObject*>("Password");
    LoginWindow(QObject *QMLObject) : viewer(QMLObject) {}
    public slots:
        bool login(QString login, QString password);
};

#endif // LOGINWINDOW_H
