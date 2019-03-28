import QtQuick 2.0

Item {
    id: root
    property string sourceOff: ''
    property string sourceOn: ''
    property string color: '#d50000'
    height: 25
    width: height
    Rectangle {
        id: pic
        anchors.fill: parent
        color: '#00FFFFFF'
        Image {
            id: img
            anchors.fill: parent
            sourceSize.height: height
            sourceSize.width: height
            source: root.sourceOff
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: pic.state = "on";
            onExited: pic.state = "off";
        }
        states: [
            State {
                name: "on"
                PropertyChanges { target: pic; color: root.color}
                PropertyChanges { target: img; source: sourceOn}
            },
            State {
                name: "off"
            }
        ]
        transitions: [
            Transition {
                PropertyAnimation {
                    target: pic; properties: 'color'; duration: 125; easing: Easing.InOutQuad
                }
                }

        ]
    }
}
