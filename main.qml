import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Universal 2.3

Window {
    id: root
    visible: true
    width: 1115
    height: 640
    title: qsTr("Приложение баз данных Sirin")
    Universal.accent: '#34495e'
    Loader {
        id: loader
        anchors.fill: parent
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
    BusyIndicator {
        id: bs
      width: 100
      height: 100
      x: (root.width - width)/2
      y: (root.height - height)/2

    }

}
