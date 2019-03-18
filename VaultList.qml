import QtQuick 2.0

Item {
    width: 1366
    height: 768
    Grid {
        scale: 1
        columns: 2
        rows: 4
        spacing: 20
        width: 620
        height: 140*4 + 20*3
        z: 0
        transformOrigin: Item.Left
        y: parent.height/2 - height/2
        x: 15

        ActionButton {
            source: "resources/images/addOrder1.png"
            label: "Оформить заказ"
        }
        ActionButton {
            source: "resources/images/addClient.png"
            label: "Зарегистрировать клиента"
        }
        ActionButton {
            source: "resources/images/editOrder.png"
            label: "Изменить заказа"
        }
        ActionButton {
            source: "resources/images/editClient.png"
            label: "Изменить данные клиента"
        }
        ActionButton {
            source: "resources/images/abortOrder.png"
            label: "Оформить возврат"
        }
        ActionButton {
            source: "resources/images/deleteClient.png"
            label: "Удалить клиента"
        }
        ActionButton {
            source: "resources/images/orders.png"
            label: "Список заказов"
        }
        ActionButton {
            source: "resources/images/users.png"
            label: "Список клиентов"
        }
    }
}
