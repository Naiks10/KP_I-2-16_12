import QtQuick 2.0

Item {
    id: root
    width: 90
    height: 90
    property string source_1: ''
    property string source_2: ''
    Rectangle {
        id: background
        width: parent.width
        height: parent.width
        color: '#FF666666'
        radius: 4
    Image {
        id: picture
        source: source_1
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: anchors.leftMargin
        anchors.topMargin: anchors.leftMargin
        anchors.bottomMargin: anchors.leftMargin
    }
    }
    states: [
        State {
            name: "true"
            PropertyChanges { target: picture; anchors.leftMargin: 10; source: source_2 }
            PropertyChanges { target: background; color: '#FF4D4D4D'}
        },
        State {
            name: "false"
        }
    ]
    transitions: [
        Transition {
            PropertyAnimation { target: picture; properties: "anchors.leftMargin, anchors.rightMargin, anchors.topMargin, anchors.bottomMargin, source"; duration: 200; easing: Easing.InOutQuad}
            PropertyAnimation { target: background; properties: "color"; duration: 200; easing: Easing.InOutQuad}
        }
    ]
}
