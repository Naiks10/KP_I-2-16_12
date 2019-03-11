#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlQuery>
#include <QDebug>
#include <QObject>
#include <connection.h>
#include <login.h>
#include "qdatabasemodels.h"
#include "main.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQuickStyle::setStyle("Universal");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QObject* root = engine.rootObjects()[0];
    Connection mainConnection;
    mainConnection.connect(
                "localhost",
                "wbase",
                "postgres",
                "09102000"
             );
    Login::login("admin", "123");
    engine.rootContext()->setContextProperty("_model", q->orders);
    return app.exec();
}
