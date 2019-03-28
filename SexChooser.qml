import QtQuick 2.0

Item {
    width: 90
    height: 45
    FontLoader {
        id: roboto
        source: "resources/fonts/Roboto-Regular.ttf"
    }

    Rectangle {
        anchors.fill: parent
        radius: 0
        border.color: '#34495e'
        border.width: 0
        clip: true
        Rectangle {
            id: man
            width: 45
            height: 45
            color: if (choosed) {return '#E0E0E0'} else return 'WhiteSmoke'
            radius: 3
            border.width: 2
            border.color: '#34495e'
            clip: false
            property bool choosed: true
            Text {
                anchors.centerIn: parent
                text: "М"
                font.family: roboto.name
                font.pointSize: 12
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {man.choosed = true; woman.choosed = false}
            }
        }

        Rectangle {
            id: woman
            width: 45
            height: 45
            x: 45
            property bool choosed: false
            color: if (choosed) {return "#E0E0E0"} else return "WhiteSmoke"
            radius: 2
            border.width: 2
            border.color: '#34495e'
            Text {
                anchors.centerIn: parent
                text: "Ж"
                font.family: roboto.name
                font.pointSize: 12
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {man.choosed = false; woman.choosed = true}
            }
        }
    }
}
