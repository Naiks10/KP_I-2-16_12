import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3

Item {
    id: root
    Image {
        anchors.fill: parent
        source: "resources/images/loginWallpaper.jpg"
    }
    Rectangle {
        anchors.fill: parent
        opacity: 0.3
        color: Material.color(Material.Indigo)
    }

    Material.theme: Material.Light
    Material.accent: Material.Orange
    FontLoader {
        id: roboto
        source: "resources/fonts/Roboto-Regular.ttf"
    }
    FontLoader {
        id: robotoLight
        source: "resources/fonts/Roboto-Light.ttf"
    }
    SwipeView {
        id: windowPage
        currentIndex: 0
anchors.fill: parent
    Item {


    Pane {
        id: loginPanel
        topPadding: 12
        anchors.fill: parent
        anchors.leftMargin: root.width/2 - 200
        anchors.rightMargin: root.width/2 - 200
        anchors.topMargin: root.height/2 - 200
        anchors.bottomMargin: root.height/2 - 200
        Material.elevation: 6
        Text {
            id: name
            text: qsTr("АВТОРИЗАЦИЯ")
            x: (parent.width - width)/2
            y: 15
            font.family: robotoLight.name
            font.pointSize:  20
        }

        TextField {
            id: loginField
            x: 40
            y: 123
            width: parent.width - 80
            height: 48
            font.family: roboto.name
            font.pointSize: 14
            placeholderText: "Введите логин"
        }

        TextField {
            id: passwordField
            x: 40
            y: 208
            width: parent.width - 80
            height: 48
            font.family: roboto.name
            font.pointSize: 14
            placeholderText: "Введите пароль"
            echoMode: TextInput.Password
        }

        Button {
            y: 308
            width: 150
            height: 60
            x: (parent.width - width)/2
            highlighted: true
            text: "Войти"
            font.family: roboto.name
            font.pointSize: 16
            onClicked: root.parent.source = "MainWorkSpace.qml"
        }

        RoundButton {
            id: roundButton
            x: 346
            y: 341
            width: 78
            height: 78
            text: "+"
            antialiasing: true
            font.pointSize: 30
            display: AbstractButton.TextOnly
            font.family: roboto.name
            Material.elevation: 6
            highlighted: true
            onClicked: windowPage.setCurrentIndex(1);
        }

    }

    }
    Item {
        id: registr

        Pane {
            anchors.fill: parent
            anchors.leftMargin: 90
            anchors.rightMargin: 90
            anchors.topMargin: 90
            anchors.bottomMargin: 90
            Material.elevation: 6
            RoundButton {
                width: 60
                height: 60
                x: -30
                y: x
                highlighted: true
                antialiasing: true
                //text: "<"
                icon.source: "resources/images/icons8_Back_52px.png"
                font.pointSize: 30
                display: AbstractButton.IconOnly
                font.family: roboto.name
                onClicked: windowPage.setCurrentIndex(0);
            }
            Flow {
                anchors.fill: parent
                anchors.leftMargin: 25
                anchors.rightMargin: 25
                anchors.topMargin: 25
                anchors.bottomMargin: 25
                flow: Grid.TopToBottom
                spacing: 15
                //columns: 3
                TextField {
                    placeholderText: "Фамилия"
                    font.pointSize: 14
                }
                TextField {
                    placeholderText: "Имя"
                    font.pointSize: 14
                }
                TextField {
                    placeholderText: "Отчество"
                    font.pointSize: 14
                }

                    Column{
                        Text {
                            text: "Выберите пол"
                            font.pointSize: 14
                            x: 10
                        }

                    Row {
                        RadioButton {
                            text: "Мужчина"
                            font.pointSize: 10
                        }
                        RadioButton {
                            text: "Женщина"
                            font.pointSize: 10
                        }
                    }
                    }
                       Column {
                           Text {
                               text: "Дата рождения"
                               font.pointSize: 14
                               x: 10
                           }
                               Row {
                                   TextField
                                   {
                                       width: 35
                                       font.pointSize: 10
                                       placeholderText: " ДД"
                                   }
                                   TextField
                                   {
                                       width: 35
                                       font.pointSize: 10
                                       placeholderText:" ММ"
                                   }
                                   TextField
                                   {
                                       width: 40
                                       font.pointSize: 10
                                       placeholderText:" ГГГГ"
                                   }
                               }

                       }


            }
        }

    }

   }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
