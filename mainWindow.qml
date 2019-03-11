import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3

Item {
    Rectangle {
        width: 220
        height: parent.height
        color: "#37474F"
        Column {
            anchors.fill: parent
            Rectangle {
                height: 60
                width: parent.width
                color: parent.parent.color
                Image {
                    id: icon
                    y: 10
                    x: 5
                    height: parent.height - y*2
                    width: height
                    source: "resources/images/menu.png"
                    sourceSize.height: height
                    sourceSize.width: width
                }

                FontLoader {
                    id: roboto
                    source: "resources/fonts/Roboto-Regular.ttf"
                }

                Text {
                    text: "главное меню"
                    font.pointSize: 14
                    font.family: roboto.name
                    x: icon.x*4 + icon.width
                    y: (parent.height - height)/2
                    color: Material.color(Material.Orange, Material.Shade300)
                }


            }
            Rectangle {
                height: 60
                width: parent.width
                color: parent.parent.color
                Image {
                    id: icon1
                    y: 10
                    x: 5
                    height: parent.height - y*2
                    width: height
                    source: "resources/images/db.png"
                    sourceSize.height: height
                    sourceSize.width: width
                }


                Text {
                    text: "база данных"
                    font.pointSize: 14
                    font.family: roboto.name
                    x: icon.x*4 + icon.width
                    y: (parent.height - height)/2
                    color: Material.color(Material.Orange, Material.Shade300)

                }
        }
    }
}
}









/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
