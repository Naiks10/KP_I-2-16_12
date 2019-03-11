import QtQuick 2.0

Item {
    id: root
    width: panel.width
    height: panel.height
    MouseArea {
        width: 40
        height: 40
        onClicked: root.state = "opened"
    }

    Rectangle{
        id: panel
        height: 40
        width: 160
        color: "Whitesmoke"
        radius: 8
        border.color: "#FF4D4D4D"
        border.width: 2
        Image {
            id: name
            x: 5
            source: "images/icons8_Search_50px.png"
            height: parent.height
            sourceSize.height: 20
            sourceSize.width: 20
            fillMode: Image.PreserveAspectFit
            width: 15


        }
    }
    state: "Closed?MouseFalse"
    states: [
    State {
            name: "opened"
    },
    State {
            name: "Closed?MouseFalse"
            PropertyChanges { target: panel; width: 40; color: "#FF4D4D4D"; radius: 5}
            PropertyChanges { target: name; source: "images/icons8_Search_50px_1.png"; width: 40; height:25; x: 0; anchors.verticalCenter: panel.verticalCenter; sourceSize.width: 25; sourceSize.height: 20}
        },
        State {
                name: "Closed?MouseTrue"
                PropertyChanges { target: panel; width: 40; color: "#FF4D4D4D" }
                PropertyChanges { target: name; source: "icons8_Search_50px_1.png"; width: 40; height:20; x: 0; anchors.verticalCenter: parent.verticalCenter; sourceSize.width: 25; sourceSize.height: 20}
            }

    ]
    transitions: [
    Transition {
        PropertyAnimation { target: panel; properties: "color, width, radius"; duration: 200; easing: Easing.InOutQuad }
        PropertyAnimation { target: name; properties: "width, height, sourceSize.width, sourceSize.height"; duration: 300; easing: Easing.InOutQuad }
        }
    ]
}
