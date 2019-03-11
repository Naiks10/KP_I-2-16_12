import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
//import "desktopscreenanalyzer.js" as Dsk
//import QtGraphicalEffects 1.0

Item {
    id: here
    StackView {
        id: pageWindow
        anchors.fill: parent
        initialItem: authoriz
        clip: true
        Component {
            id: authoriz
            Rectangle {
                anchors.fill: parent
                MaterialButton {
                    id: btn1
                    x: 860
                    y: 751
                    width: 270
                    text: 'Зарегистрироваться'
                    scale: 1
                    anchors.right: parent.right
                    anchors.rightMargin: 177
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 29
                    color: '#34495e'
                    bordercolor: btn1.color
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            pageWindow.push(registr)
                            console.log(here.parent.parent)
                    }
                    }
                }

                MaterialButton {
                    x: 1149
                    y: 751
                    text: 'Войти'
                    scale: 1
                    anchors.right: parent.right
                    anchors.rightMargin: 48
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 29
                    color: btn1.color
                    bordercolor: btn1.color


                    MouseArea {
                        anchors.fill: parent
                        onClicked:
                        {
                            here.parent.source = "MainWorkSpace.qml"


                        }
                    }
                }
            Rectangle {
                anchors.right: parent.right
                anchors.rightMargin: 201
                x: 758
                y: 360
                width: 338
                height: 180
                anchors.verticalCenter: parent.verticalCenter
                onXChanged:
                    if (x < 510)
                        img.state = "true"
                    else img.state = "false"
                MaterialEdit {
                    id: login
                    objectName: "Login"
                    text: "Логин"
                    textPrompt: "Заполните поле"
                    scale: 1
                    color: btn1.color
                    width: 338
                    height: 78
                    x: 0
                    y: 0
                    }

                MaterialEdit {
                    id: password
                    objectName: "Password"
                    text: "Пароль"
                    scale: 1
                    textPrompt: "Заполните поле"
                    width: 338
                    height: 78
                    color: btn1.color
                    x: 0
                    y: 88
                    }
                }
            Image {
                id: img
                x: 201
                y: 368
                clip: false
                scale: 1
                sourceSize.height: 172
                sourceSize.width: 311
                source: "resources/images/SirinTitle.png"
                anchors.verticalCenter: parent.verticalCenter
                antialiasing: true
                smooth: true
                state: "Near"
                states: [
                    State {
                        name: 'false'
                    },
                    State {
                        name: 'true'
                        PropertyChanges { target: img ; opacity: 0 }
                    }
                ]
                transitions: [
                    Transition {
                        PropertyAnimation { target: img; properties: "opacity"; duration: 100; easing.type: Easing.InOutQuad }
                    }
                ]

            }
            Image {
                x: 560
                y: 74
                source: "resources/images/LightLogo.png"
                height: 98
                sourceSize.height: 98
                sourceSize.width: 128
                width: 128
                anchors.horizontalCenter: parent.horizontalCenter
            }
            }
        }
         Component {
            id: registr
            Rectangle {
            anchors.fill: parent
            ButtonWithGlyph {
                x: 5
                y: 5
                width: 150
                height: 67
                MouseArea {
                    anchors.fill: parent
                    onClicked: pageWindow.pop()
            }
					
        }
            MaterialEdit {
                id: fam
                objectName: "fam"
                text: "Фамилия"
                scale: 1
                textPrompt: "Заполните поле"
                width: 338
                height: 78
                color: '#34495e'
                x: 50
                y: 88+20
                }
            MaterialEdit {
                id: im
                objectName: "im"
                text: "Имя"
                scale: 1
                textPrompt: "Заполните поле"
                width: 338
                height: 78
                color: fam.color
                x: 50
                y: 178+20
                }
            MaterialEdit {
                id: otch
                objectName: "otch"
                text: "Отчество"
                scale: 1
                textPrompt: "Заполните поле (необязательно)"
                width: 338
                height: 78
                color: fam.color
                x: 50
                y: 268+20
                }
            MaterialEdit {
                id: dd
                objectName: "DD"
                text: "ДД"
                scale: 1
                textPrompt: "00"
                width: 40
                height: 78
                color: fam.color
                x: 500+200
                y: 158+20
                }
            MaterialEdit {
                id: mm
                objectName: "MM"
                text: "ММ"
                scale: 1
                textPrompt: "00"
                width: 40
                height: 78
                color: fam.color
                x: 560+200
                y: 158+20
                }
            MaterialEdit {
                id: yyyy
                objectName: "yyyy"
                text: "ГГГГ"
                scale: 1
                textPrompt: "0000"
                width: 60
                height: 78
                color: fam.color
                x: 620+200
                y: 158+20
                }
            MaterialButton {
                x: 1149
                y: 751
                text: 'Далее'
                scale: 1
                anchors.right: parent.right
                anchors.rightMargin: 48
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 29
                color: fam.color
                bordercolor: fam.color
                MouseArea {
                    anchors.fill: parent
                    onClicked:
                    {
//
                        pageWindow.push(reg2);

                    }
                }
                }

        }
         }
         Component {
             id: reg2
             Rectangle {
                 anchors.fill: parent
                 ButtonWithGlyph {
                     x: 5
                     y: 5
                     width: 150
                     height: 67
                     MouseArea {
                         anchors.fill: parent
                         onClicked: pageWindow.pop()
                 }
                 }
                     MaterialEdit {
                         id: ser
                         objectName: "ser"
                         text: "Серия"
                         scale: 1
                         textPrompt: "1234"
                         width: 60
                         height: 78
                         color: '#34495e'
                         x: 50
                         y: 88+20
                         }
                     MaterialEdit {
                         id: nom
                         objectName: "nom"
                         text: "Номер"
                         scale: 1
                         textPrompt: "567890"
                         width: 80
                         height: 78
                         color: '#34495e'
                         x: 145
                         y: 88+20
                         }
                     MaterialButton {
                         x: 1149
                         y: 751
                         text: 'Далее'
                         scale: 1
                         anchors.right: parent.right
                         anchors.rightMargin: 48
                         anchors.bottom: parent.bottom
                         anchors.bottomMargin: 29
                         color: fam.color
                         bordercolor: fam.color
                         MouseArea {
                             anchors.fill: parent
                             onClicked:
                             {
         //
                                 pageWindow.push(reg3);

                             }
                         }
                         }

             }

         }
         Component {
             id: reg3
             Rectangle {
                 anchors.fill: parent
                 ButtonWithGlyph {
                     x: 5
                     y: 5
                     width: 150
                     height: 67
                     MouseArea {
                         anchors.fill: parent
                         onClicked: pageWindow.pop()
                 }
                 }
             }
         }
    }

}

































