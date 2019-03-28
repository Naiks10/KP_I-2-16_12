import QtQuick 2.0

Item {
    id: root
    height: 30
    width: 40 +  label.width
    property string text: 'Sample'
    property bool isChecked: false
    Rectangle {
        id: rectangle
        height: 30
        width: 30
        radius: 4
        border.color: '#34495e'
        border.width: 3

        color: '#00FFFFFF'
        Rectangle {
            id: checker
            anchors.centerIn: parent
            height: if (root.isChecked)
                        return 20;
            else
                        return 0;
            width: height
            radius: 2
            color: '#34495e'
        }
        FontLoader {
            id: roboto
            source: "resources/fonts/Roboto-Medium.ttf"
        }

        transitions: [
            Transition {
                PropertyAnimation { target: checker; properties: 'width, height'; duration: 150; easing: Easing.InOutQuad }
            }
        ]

        MouseArea {
        anchors.fill: parent
        onClicked: if (!root.isChecked)
                       root.isChecked = true;
                        else
                       root.isChecked = false;
        }
        Text {
            id: label
            text: root.text
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 12
            font.family: roboto.name
            x: 35
        }
    }
}
