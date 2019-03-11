import QtQuick 2.0

Item {
    id: root
    width: label.width + 20
    height: 42
    property string text: "Вкладка"
    property bool checked: false
    Rectangle {
        id: bottomPanel
        width: parent.width
        height: 2
        radius: 3
        anchors.bottom: parent.bottom
        color: '#34495e'
    }
    Text {
        id: label
        text: root.text
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
        color: "#20354b"
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.state = "isChoosed=true"
        onExited: root.state = "isMouseOver=false"
    }
    states: [
    State {
            name: "isChoosed=true"
            PropertyChanges { target: bottomPanel; height: root.height; color: "#34495e" }
            PropertyChanges { target: label; color: 'White'}
        },
    State {
            name: "isMouseOver=true"
            PropertyChanges { target: bottomPanel; height: 4; color: '#34495e'}
            PropertyChanges { target: label; color: '#34495e'}
        },
    State {
           name: "isMouseOver=false"
        }

    ]
    transitions: [
    Transition {
            PropertyAnimation { targets: [bottomPanel, label]; properties: "height, color"; duration: 200; easing: Easing.InOutQuad }
        }

    ]
}
