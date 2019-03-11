import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4

Item {
    id: element
    width: 338
    height: 78
    property string color: "#FF666666"
    property string text: "Text"
    property string textPrompt: "Input Here"
    property string textInto: textInput.text
    Text {
        id: caption
        font.pointSize: 18
        height: panel.anchors.topMargin
        width: parent.width - x
        color: element.color
        text: element.text
        x: 4
    }

    Rectangle {
        id: panel
        radius: 3
        anchors.topMargin: 34
        anchors.top: parent.top
        border.width: 2
        color: 'white'
        border.color: element.color
        height: 44
        width: parent.width
    }
    MouseArea {
        anchors.fill: panel
        hoverEnabled: true
    }

    TextInput {
        id: textInput
        //anchors.bottomMargin: 5
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.verticalCenter: panel.verticalCenter
        //anchors.topMargin: 6
        //anchors.fill: panel
        x: 10
        selectByMouse: true
        text: element.textPrompt
        font.pointSize: 14
        color: element.color
        Keys.onEnterPressed: textInput.activeFocus = false
        onActiveFocusChanged: {
            if (textInput.activeFocus)
            {
                element.state = "onEntered";
                textInput.text = textInput.text === element.textPrompt ? "" : textInput.text
            }
            else
            {
                element.state = "onExited";
                textInput.text = textInput.text === "" ? element.textPrompt : textInput.text
            }
        }
    }

    state: "state"
    states: [
        State {
            name: "onEntered"
            PropertyChanges { target: caption; opacity: 0.7; x: -15; font.pointSize: 14}
            PropertyChanges { target: panel; anchors.topMargin: panel.anchors.topMargin + 1; color: 'Whitesmoke'}
        },
        State {
            name: "onExited"
        }]
    transitions: [
        Transition {
            PropertyAnimation {target: caption; properties: "opacity, x, font.pointSize"; duration: 200; }
            PropertyAnimation {target: panel; properties: "anchors.topMargin, color"; duration: 200; }

        }
    ]

}
