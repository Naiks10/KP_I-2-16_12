import QtQuick 2.0

Item {
    id: root
    width: label.width + 20
    height: 35
    Rectangle {
        id: bottomPanel
        width: parent.width
        height: 2
        anchors.bottom: parent.bottom
        color: '#FF666666'
    }
    Text {
        id: label
        text: "Text Here"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 13
        color: "#FF666666"
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.state = "isMouseOver=true"
        onExited: root.state = "isMouseOver=false"
    }
    states: [
    State {
            name: "isChoosed=true"
            PropertyChanges { target: bottomPanel; height: root.height; color: "#FF4D4D4D" }
            PropertyChanges { target: label; color: 'White'}
        },
    State {
            name: "isMouseOver=true"
            PropertyChanges { target: bottomPanel; height: 4; color: '#FF4D4D4D'}
            PropertyChanges { target: label; color: '#FF4D4D4D'}
        },
    State {
           name: "isMouseOver=false"
        }

    ]
    transitions: [
    Transition {
            PropertyAnimation { targets: [bottomPanel, label]; properties: "height, color"; duration: 50; easing: Easing.InOutQuad }
        }

    ]
}
