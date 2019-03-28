QT += quick
QT += quickcontrols2
CONFIG += c++11
QT += sql
QT += winextras
QT += axcontainer

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    connection.cpp \
    authorizwindow.cpp \
    login.cpp \
    register.cpp \
    crypt.cpp \
    qtinyaes.cpp \
    authorizwindow.cpp \
    connection.cpp \
    crypt.cpp \
    login.cpp \
    main.cpp \
    qtinyaes.cpp \
    register.cpp \
    aes.c \
    sqlquerymodel.cpp \
    qdatabasemodels.cpp \
    market.cpp \
    document.cpp \
    loginwindow.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ../DataBaseApplicationSirin/MainWorkSpace.qml \
    ../DataBaseApplicationSirin/MaterialButton.qml \
    ../DataBaseApplicationSirin/MaterialEdit.qml \
    ../DataBaseApplicationSirin/SideMenuButton.qml \
    ../DataBaseApplicationSirin/SideToolButton.qml \
    ../DataBaseApplicationSirin/TabButton.qml \
    ../DataBaseApplicationSirin/TabControlButton.qml \
    info.json

HEADERS += \
    connection.h \
    authorizwindow.h \
    login.h \
    register.h \
    crypt.h \
    qtinyaes.h \
    aes.h \
    aes.hpp \
    authorizwindow.h \
    connection.h \
    crypt.h \
    login.h \
    qtinyaes.h \
    register.h \
    sqlquerymodel.h \
    qdatabasemodels.h \
    main.h \
    market.h \
    document.h \
    loginwindow.h
