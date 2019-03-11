import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3

Item {
    visible: true
    width: 1307
    height: 827
    scale: 1
    //title: qsTr("Авторизация")
    SwipeView {
        id: stack
        x: 91
        height: parent.height
        interactive: false
        width: parent.width - 90
        currentIndex: 0
        orientation: Qt.Vertical
        wheelEnabled: false

        Item {
            id: market
            Rectangle {
                color: 'white'
                anchors.fill: parent
                Text {
                    text: 'МАГАЗИН'
                    font.pointSize: 20
                    x: 20
                    y: 10
                }
                SearchButton {
                x: 145
                y: 50
                }

                Rectangle {
                    border.color: '#00000000'
                    x:145
                    y: 100
                    width: stack.width*12/14
                    height: stack.height*12/14
                    Row {
                        width: parent.width
                        height: 40
                        x: 0
                        TabControlButton {
                            text: "Первая вкладка"
                            MouseArea {
                                anchors.fill: parent;
                                onClicked: {
                                    loader.source = "ordersTable.qml"
                                }
                                }
                        }
                        TabControlButton {
                            text: "Вторая вкладка"
                            MouseArea {
                                anchors.fill: parent;
                                onClicked: {
                                    loader.source = "customersTable.qml"
                                }
                                }
                        }
                        TabControlButton {
                            text: "Третья вкладка"
                        }
                        TabControlButton {
                            text: "Четвертая"
                        }
                        TabControlButton {
                            text: "---"
                        }
                    }
                    Rectangle
                    {
                        width: 2
                        height: 30
                        x: 0
                        y: 40
                        color: "#FF4D4D4D"
                    }

                    Loader {
                        id: loader
                        anchors.fill: parent
                        anchors.topMargin: 40
                        clip: true
                        source: "ordersTable.qml"
                        onLoaded: {
                            bs.visible = false;
                        }
                        onSourceChanged: {

                                //root.showMaximized();
                                bs.visible = true;


                        }
                        //source: ".qml"

//                        Component
//                        {
//                            id: columnComponent
//                            TableViewColumn{width: 100 }
//                        }
//                        TableView {
//                            id: tableView
//                                anchors.fill: parent
                                
//                                TableViewColumn
//                                {
//                                    title: role
//                                    role: 'код'
//                                }
//								TableViewColumn
//                                {
//                                  id: fstCol
//                                  title: role
//                                  role: 'страна'
//                                }
//                                TableViewColumn
//                                {
//                                    id: scndCol
//                                    title: 'Пароль'
//                                    //role: 'Pass'
//                                }
//                                model: _myFirstModel


//                                style: TableViewStyle {

//                                            headerDelegate: Rectangle {
//                                                height: textItem.implicitHeight * 1.8
//                                                //width: textItem.implicitWidth
//                                                color: "#34495e"

//                                                Text {
//                                                    id: textItem
//                                                    anchors.fill: parent
//                                                    verticalAlignment: Text.AlignVCenter
//                                                    horizontalAlignment: styleData.textAlignment
//                                                    anchors.leftMargin: 12
//                                                    text: styleData.value
//                                                    elide: Text.ElideRight
//                                                    color: "White"
//                                                    renderType: Text.NativeRendering
//                                                    font.pointSize: 12
//                                                    font.bold: true

//                                                }
//                                                Rectangle {
//                                                    anchors.right: parent.right
//                                                    anchors.top: parent.top
//                                                    anchors.bottom: parent.bottom
//                                                    anchors.bottomMargin: 1
//                                                    anchors.topMargin: 1
//                                                    width: 1
//                                                    color: "#ccc"
//                                                }

//                                            }
//                                            rowDelegate: Rectangle {
//                                                radius: 30
//                                                height: tht.implicitHeight * 1.8
//                                                width: tht.implicitWidth
//                                                color: styleData.selected ? Material.color(Material.Orange) : (styleData.alternate ? 'Whitesmoke' : 'White')

//                                                Text {
//                                                    id: tht
//                                                    //anchors.fill: parent
//                                                    verticalAlignment: Text.AlignVCenter
//                                                    horizontalAlignment: styleData.textAlignment
//                                                    //anchors.leftMargin: 12
//                                                    //text: "styleData.value"
//                                                    elide: Text.ElideRight
//                                                    color: "red"
//                                                    renderType: Text.NativeRendering
//                                                    font.pointSize: 12
//                                                }
////                                                Rectangle {
////                                                    height: 1
////                                                    anchors.bottom: parent.bottom
////                                                    color: "#FF4D4D4D"
////                                                    width: parent.width
////                                                }

//                                        }
//                                            itemDelegate: Text {
//                                                id: th
//                                                anchors.fill: parent
//                                                verticalAlignment: Text.AlignVCenter
//                                                horizontalAlignment: styleData.textAlignment
//                                                anchors.leftMargin: 12
//                                                text: styleData.value
//                                                elide: Text.ElideRight
//                                                color: "#34495e"
//                                                renderType: Text.NativeRendering
//                                                font.pointSize: 12

//                                            }
//}


//                        }
                    }
                    BusyIndicator {
                        id: bs
                      width: 100
                      height: 100
                      x: (loader.width - width)/2
                      y: (loader.height - height)/2

                    }

                }
            }
        }
        Item {
            id: sklad
            Rectangle {
                color: 'white'
                anchors.fill: parent
                Text {
                    text: 'СКЛАД'
                    font.pointSize: 20
                    x: 20
                    y: 10
                }
            }
        }
        Item {
            id: pesronal
            Rectangle {
                color: 'white'
                anchors.fill: parent
                Text {
                    text: 'ПЕРСОНАЛ'
                    font.pointSize: 20
                    x: 20
                    y: 10
                }
            }
        }
}
    Rectangle {
        scale: 1
        width: 50
        x: 93
        anchors.verticalCenter: parent.verticalCenter
        height: col.height
        radius: 8
        color: '#00666666'
        Column {
            id: col
            spacing: 3
            width: parent.width
            SideToolButton {
                width: parent.width
                height: parent.width
                source_1: 'resources/images/add.png'
                source_2: 'resources/images/icons8_Add_64px_1.png'
            }
            SideToolButton {
                width: parent.width
                height: parent.width
                source_1: "resources/images/edit.png"
                source_2: "resources/images/icons8_Edit_64px_1.png"
            }


            Rectangle {
                id: del
                width: parent.width
                height: parent.width
                color: '#34495e'
                radius: 4
            Image {

                source: "images/images/icons8_Cancel_64px.png"
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }
            }
            Rectangle {
                id: copy
                width: parent.width
                height: parent.width
                color: '#34495e'
                radius: 4
            Image {

                source: "images/images/icons8_Copy_64px.png"
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }
            }
            Rectangle {
                id: stop
                width: parent.width
                height: parent.width
                color: '#34495e'
                radius: 4
                Image {

                    source: "images/images/icons8_Minus_64px.png"
                    anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }
            }
            Rectangle {
                id: addUser
                width: parent.width
                height: parent.width
                color: '#34495e'
                radius: 4
            Image {

                source: "images/images/icons8_Add_User_Male_64px.png"
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }
            }
            Rectangle {
                id: rect_editUser
                width: parent.width
                height: parent.width
                color: '#34495e'
                radius: 4
            Image {
                id: editUser
                source: "images/images/icons8_Registration_64px.png"
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }
            }
            Rectangle {
                id: delUser
                width: parent.width
                height: parent.width
                color: '#34495e'
                radius: 4
            Image {

                source: "images/images/icons8_Denied_64px.png"
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
            }
            }

        }
}


    Rectangle {
        id: panel
        color: '#34495e'
        width: 90
        height: parent.height
        scale: 1


            Rectangle {
                id: menuIcon
                anchors.topMargin: 20
                width: parent.width
                height: 29
                color: '#00000000'
                anchors.horizontalCenter: panel.horizontalCenter
                y: 20
                Rectangle
                {
                    color: '#00000000'
                    width: 39
                    height: 29
                    anchors.horizontalCenter: parent.horizontalCenter
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: menuIcon.state = "true"
                        onExited: menuIcon.state = "false"
                    }

                    Rectangle {
                        id: r1
                        width: 20
                        radius: 1
                        height: 5
                    }
                    Rectangle {
                        id: r2
                        width: 33
                        radius: 1
                        height: 5
                        y: 9
                        x: 4
                }
                    Rectangle {
                        id: r3
                        width: 33
                        radius: 1
                        height: 5
                        y: 18
                    }
                    Rectangle {
                        id: r4
                        width: 20
                        radius: 1
                        height: 5
                        y: 27
                        x: 17
                    }
                }
                states: [
                    State {
                        name: "true"
                        PropertyChanges { target: r1; width: 39; x: 0}
                        PropertyChanges { target: r2; width: 39; x: 0}
                        PropertyChanges { target: r3; width: 39; x: 0}
                        PropertyChanges { target: r4; width: 39; x: 0}
                    },
                    State {
                        name: "false"
                    }

                ]
                transitions: [
                    Transition {
                        PropertyAnimation { targets: [r1,r2,r3,r4]; properties: "width, x"; duration: 100; easing: Easing.InOutQuad }
                    }
                ]

            }
}

    SideMenuButton {
        y: 75
        height: panel.width
        source: "resources/images/market.png"
        label: "Касса"
        scale: 1
        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                 stack.setCurrentIndex(0);
                 rect_editUser.visible = false;
                   rect_edit.visible = false
            }

        }
    }
    SideMenuButton {
        y: 165
        height: panel.width
        label: "Склад"
        source: "resources/images/box.png"
        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                stack.setCurrentIndex(1);
                rect_editUser.visible = true;
                rect_edit.visible = true
            }
        }
    }
    SideMenuButton {
        y: 255
        height: panel.width
        source: "resources/images/social.png"
        label: "Персонал"
        MouseArea {
            anchors.fill: parent
            onClicked: stack.setCurrentIndex(2)
        }
    }

    SideMenuButton {
        y: 345
        height: panel.width
        source: "resources/images/dba.png"
        label: "Контроль"
        MouseArea {
            anchors.fill: parent
            onClicked:
            {
                 stack.setCurrentIndex(0);
                 rect_editUser.visible = false;
                   rect_edit.visible = false
            }

        }
    }
}






