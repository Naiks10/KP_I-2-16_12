import QtQuick 2.0

Item {
    id: element
    height: 67
    width: 150
    Rectangle {
        id: root
        radius: 30
        height: 47
        width: 47
        x: 10
        y: 10
        border.color: '#FF666666'
        border.width: 2
        Image {
            id: pic
            source: "resources/images/icons8_Left_100px.png"
            height: 30
            width: 30
            anchors.verticalCenter: parent.verticalCenter
            x: 8
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: element.state = "true"
            onExited: element.state = "false"
        }
        Text {
            id: name
            text: qsTr("Назад")
            font.pointSize: 18
            color: "#FF666666"
            x: 42
            anchors.verticalCenter: parent.verticalCenter
            opacity: 0
        }
    }
    state: "isMouseOver"
    states: [
        State {
            name: "true"
            PropertyChanges { target: root; radius: 5; width: element.width - 30; }
            PropertyChanges { target: name; opacity: 1 }
        },
        State {
            name: "false"
        }

    ]
    transitions: [
        Transition {
            PropertyAnimation { target: root; properties: "radius, width"; duration: 200; easing: Easing.InOutQuad}
            PropertyAnimation { target: name; properties: "opacity"; duration: 50; easing: Easing.InOutQuad}
        }
    ]
}
