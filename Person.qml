import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3

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
                    text: "Сотрудники"
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            loaderPesronal.source = "ordersTable.qml"
                        }
                        }
                }
                TabControlButton {
                    text: "Кадровые документы"
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            loaderPesronal.source = "customersTable.qml"
                        }
                        }
                }
                TabControlButton {
                    text: "Заявления"
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            loaderPesronal.source = "ordersTable.qml"
                        }
                        }
                }
                TabControlButton {
                    text: "---"
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            loaderPesronal.source = "ordersTable.qml"
                        }
                        }
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
                id: loaderPesronal
                anchors.fill: parent
                anchors.topMargin: 40
                clip: true
                source: "ordersTable.qml"
                onLoaded: {
                    bsPesronal.visible = false;
                }
                onSourceChanged: {

                        //root.showMaximized();
                        bsPesronal.visible = true;


                }
            }
            BusyIndicator {
                id: bsPesronal
              width: 100
              height: 100
              x: (loader.width - width)/2
              y: (loader.height - height)/2

            }

        }
    }
}
