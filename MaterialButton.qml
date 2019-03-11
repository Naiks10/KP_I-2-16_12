import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4

Item {
    id : component
    property string text: 'Text'
    property string color: '#FF4D4D4D'
    property string bordercolor: '#FF4D4D4D'
    width: 110
    height: 47

    Rectangle {
        id: rect
        border.color: component.bordercolor
        border.width: 2
        radius: 3
        color: '#00000000'
        anchors.fill: parent

        Text {
            id: rectText
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 18
            font.family: "Tahoma"
            color: component.color
            text: component.text
            font.weight: Font.Normal
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: component.state = "true"
            onExited: component.state = "false"
            onClicked: component.state = "click"
        }
    }
    state: "IsMouseOver"
    states: [
        State {
            name: 'false'
        },
        State {
            name: 'true'
            PropertyChanges { target: rect; color: component.color }
            PropertyChanges { target: rectText; color: 'White'; font.pointSize: 16 }
        },
        State {
            name: 'click'
            PropertyChanges { target: rect; color: component.color }
            PropertyChanges { target: rectText; color: 'White'; font.pointSize: 14 }
        }
    ]
        transitions: [
            Transition {
            PropertyAnimation { target: rect; properties: "color"; duration: 200; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: rectText; properties: "color, font.pointSize"; duration: 200; easing.type: Easing.InOutQuad }
            }
        ]

}
