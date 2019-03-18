import QtQuick 2.0

Item {
    id: root
    property string borderColor: "#34495e"
    property string source: ""
    property string label: "Текст"
    width: 250
    height: 140
    FontLoader {
        id: roboto
        source: "resources/fonts/Roboto-Regular.ttf"
    }
    Rectangle {
        id: rec
        color: "#00000000"
        anchors.fill: parent
        radius: 5
        border.width: 3
        border.color: borderColor
        Image {
            id: picture
            width: 50
            height: 50
            source: root.source
            sourceSize.height: height
            sourceSize.width: width
            x: root.width/2 - width/2
            y: root.height/2 - height/2 - 7
        }
        Text {
            id: label
            text: root.label
            x: root.width/2 - width/2
            y: picture.y + picture.height + 10
            font.pointSize: 12
            color: "#34495e"
            font.family: roboto.name
            wrapMode: Text.WordWrap;
        }

    }
    states: [
        State {
            name: "off"
            PropertyChanges {
                target: picture
                opacity: 1
            }
            PropertyChanges {
                target: label
                font.pointSize: 12

            }
        },
        State {
            name: "on"
            PropertyChanges {
                target: rec
                color: "#34495e"
            }
            PropertyChanges {
                target: picture
                opacity: 0
                y: y - 20
            }
            PropertyChanges {
                target: label
                y: root.height/2 - height/2
                font.pointSize: 12
                color: "white"

            }
        }
    ]
    transitions: [
        Transition {
            PropertyAnimation { target: picture; properties: "y, opacity"; duration: 200; easing: Easing.InOutQuad}
            PropertyAnimation { target: rec; properties: "color"; duration: 200; easing: Easing.InOutQuad }
            PropertyAnimation { target: label; properties: "y, font.pointSize, color"; duration: 200; easing: Easing.InOutQuad}
        }
    ]
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.state = "on"
        onExited: root.state = "off"
    }

}

/*##^## Designer {
    D{i:2;anchors_height:100;anchors_width:100}
}
 ##^##*/
