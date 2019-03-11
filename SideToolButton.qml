import QtQuick 2.0

Item {
    id: root
    width: 90
    height: 90
    property string source_1
    property string source_2
    Rectangle {
        id: background
        width: parent.width
        height: parent.width
        color: '#34495e'
        radius: 4
    Image {
        id: picture
        sourceSize.height: height
        sourceSize.width: width
        source: source_1
        anchors.fill: parent
        anchors.leftMargin: 9
        anchors.rightMargin: anchors.leftMargin
        anchors.topMargin: anchors.leftMargin
        anchors.bottomMargin: anchors.leftMargin
    }
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.state = "true"
        onExited: root.state = "false"
    }

    state: "false"
    states: [
        State {
            name: "true"
            PropertyChanges { target: picture; anchors.leftMargin: 8; source: source_1 }
            PropertyChanges { target: background; color: '#20354B'}
        },
        State {
            name: "false"
        }
    ]
    transitions: [
        Transition {
            PropertyAnimation { target: picture; properties: "anchors.leftMargin, anchors.rightMargin, anchors.topMargin, anchors.bottomMargin, source"; duration: 150; easing: Easing.InOutQuad}
            PropertyAnimation { target: background; properties: "color"; duration: 200; easing: Easing.InOutQuad}
        }
    ]
}
