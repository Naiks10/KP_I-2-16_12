import QtQuick 2.12
import QtQuick.Window 2.12
import QtWinExtras 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Universal 2.3

Window {
    id: root
    visible: true
    width: 1115
    height: 665
    title: qsTr("Приложение баз данных Sirin")
    Universal.accent: '#34495e'
    flags: Qt.Window | Qt.FramelessWindowHint

    TaskbarButton {
            overlay.iconSource: "link to picture"
        }


    Loader {
        id: loader
        anchors.fill: parent
        //anchors.topMargin: 25
        asynchronous: true
        source: "login.qml"
        onLoaded: {
            bs.visible = false;
        }
        onSourceChanged: {
            if (source == 'qrc:/MainWorkSpace.qml')
            {
                root.showMaximized();
                bs.visible = true;
            }

        }
    }


    Row {

        height: 25
        width: 75
        anchors.right: parent.right
        anchors.top: parent.top
        WindowButton {
            height: 25
            width: 20
            sourceOn: "resources/images/min1.png"
            sourceOff: "resources/images/min.png"
            color: '#354a5f'
            MouseArea {
                anchors.fill: parent
                onClicked: root.showMinimized();
            }
        }
        WindowButton {
            height: 25
            width: height
            sourceOn: "resources/images/max1.png"
            sourceOff: "resources/images/max.png"
            color: '#354a5f'
            MouseArea {
                anchors.fill: parent
                onClicked: if (root.visibility !== 4)
                               root.showMaximized(); else {
                               root.showNormal();
                               root.width = 1115;
                               root.height = 640
                           }
            }
        }

        WindowButton {
            height: 25
            width: height
            sourceOn: "resources/images/close1.png"
            sourceOff: "resources/images/close.png"
            MouseArea {
                anchors.fill: parent
                onClicked: root.close();
            }
        }
    }



    BusyIndicator {
        id: bs
      width: 100
      height: 100
      x: (root.width - width)/2
      y: (root.height - height)/2

    }


}
