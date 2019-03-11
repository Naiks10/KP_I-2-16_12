import QtQuick 2.0

Item {
    id: root
    width: 90
    height: 90
    property string label: "Sample"
    property string source: ""
    Rectangle {
        id: field
        color: '#20354B'
        height: parent.height
        width: parent.width
        clip: true
        radius: 3
        Rectangle {
            width: root.width*2
            height: root.height
            color: "#00000000"
            x: root.height

            FontLoader {
                id: roboto
                source: "resources/fonts/Roboto-Regular.ttf"
            }

        Text {
            id: label
            color: "white"
            font.pointSize: 18
            font.family: roboto.name
            text: root.label
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: root.state = "true"
            onExited: root.state = "false"
        }

            Image {
                id: image
                source: root.source
                height: parent.height - 40
                width: height
                sourceSize.height: height
                sourceSize.width: height
                anchors.verticalCenter: parent.verticalCenter
                x: (root.width/2) - (image.width/2)
            }


    Rectangle {
        id: indicator
        color: '#FFF7931E'
        anchors.verticalCenter: parent.verticalCenter
        width: 3
        height: 40
        radius: 30
    }
    }
    state: "false"
    states: [
        State {
            name: "true"
            PropertyChanges { target: field; width: root.width*3 }
            PropertyChanges { target: label; opacity: 1 }
        },
        State {
            name: "false"
            PropertyChanges { target: indicator; height: 0 }
            PropertyChanges { target: label; opacity: 0 }
            PropertyChanges { target: field; color: '#34495e' }
        }

    ]
    transitions: [
        Transition {
        PropertyAnimation { targets: [field, indicator, label]; properties: "width, height, color, opacity"; duration: 200; easing: Easing.InOutQuad }
        }
    ]
}
