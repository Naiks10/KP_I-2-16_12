import QtQuick 2.0
import "reader.js" as Prt

Item {
    width: 1366
    height: 768

    Column {
        scale: 1
        spacing: 20
        width: 670
        height: 140*3 + 20*2
        z: 0
        transformOrigin: Item.Left
        y: parent.height/2 - height/2
        x: 15
        Row {
            spacing: 10
            height: 140
            width: parent.width
            ActionButton {
                source: "resources/images/Products.png"
                label: "Список товаров"
                onStateChanged:{

                }
            }
            Column {
                spacing: 6
                ActionHoriButton {
                    source: "resources/images/editProduct.png"
                    label: "Изменить данные товара"
                }
                ActionHoriButton {
                    source: "resources/images/deleteProduct.png"
                    label: "Списать товар"
                }
            }
        }

        Row {
            spacing: 10
            height: 140
            width: parent.width
            ActionButton {
                source: "resources/images/Deliveriers.png"
                label: "Список поставщиков"
            }
            Column {
                spacing: 6
                ActionHoriButton {
                    source: "resources/images/addDelivier.png"
                    label: "Добавить поставщика"
                }
                ActionHoriButton {
                    source: "resources/images/deleteDelivier.png"
                    label: "Отказаться от поставщика"
                }
            }
        }

        Row {
            spacing: 10
            height: 140
            width: parent.width
            ActionButton {
                source: "resources/images/Deliveries.png"
                label: "Список поставок"
            }
            Column {
                spacing: 6
                ActionHoriButton {
                    source: "resources/images/addDelivery.png"
                    label: "Организовать поставку"
                }
                ActionHoriButton {
                    source: "resources/images/abortDelivery.png"
                    label: "Отменить поставку"
                }
            }
        }


    }
}
