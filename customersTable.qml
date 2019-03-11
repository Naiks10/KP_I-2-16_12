import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.4

Item {
                            Component
                            {
                                id: columnComponent
                                TableViewColumn{width: 100 }
                            }
                            TableView {
                                id: tableView
                                    anchors.fill: parent

                                    TableViewColumn
                                    {
                                        title: role
                                        role: 'код'
                                    }
                                    TableViewColumn
                                    {
                                      id: fstCol
                                      title: role
                                      role: 'Фамилия'
                                    }
                                    model: _myFirstModel


                                    style: TableViewStyle {

                                                headerDelegate: Rectangle {
                                                    height: textItem.implicitHeight * 1.8
                                                    //width: textItem.implicitWidth
                                                    color: "#34495e"

                                                    Text {
                                                        id: textItem
                                                        anchors.fill: parent
                                                        verticalAlignment: Text.AlignVCenter
                                                        horizontalAlignment: styleData.textAlignment
                                                        anchors.leftMargin: 12
                                                        text: styleData.value
                                                        elide: Text.ElideRight
                                                        color: "White"
                                                        renderType: Text.NativeRendering
                                                        font.pointSize: 12
                                                        font.bold: true

                                                    }
                                                    Rectangle {
                                                        anchors.right: parent.right
                                                        anchors.top: parent.top
                                                        anchors.bottom: parent.bottom
                                                        anchors.bottomMargin: 1
                                                        anchors.topMargin: 1
                                                        width: 1
                                                        color: "#ccc"
                                                    }

                                                }
                                                rowDelegate: Rectangle {
                                                    radius: 3
                                                    height: tht.implicitHeight * 1.8
                                                    width: tht.implicitWidth
                                                    color: styleData.selected ? Material.color(Material.Orange) : (styleData.alternate ? 'Whitesmoke' : 'White')

                                                    Text {
                                                        id: tht
                                                        //anchors.fill: parent
                                                        verticalAlignment: Text.AlignVCenter
                                                        horizontalAlignment: styleData.textAlignment
                                                        //anchors.leftMargin: 12
                                                        //text: "styleData.value"
                                                        elide: Text.ElideRight
                                                        color: "red"
                                                        renderType: Text.NativeRendering
                                                        font.pointSize: 12
                                                    }
    //                                                Rectangle {
    //                                                    height: 1
    //                                                    anchors.bottom: parent.bottom
    //                                                    color: "#FF4D4D4D"
    //                                                    width: parent.width
    //                                                }

                                            }
                                                itemDelegate: Text {
                                                    id: th
                                                    anchors.fill: parent
                                                    verticalAlignment: Text.AlignVCenter
                                                    horizontalAlignment: styleData.textAlignment
                                                    anchors.leftMargin: 12
                                                    text: styleData.value
                                                    elide: Text.ElideRight
                                                    color: "#34495e"
                                                    renderType: Text.NativeRendering
                                                    font.pointSize: 12

                                                }
    }


                            }
}
