import QtQuick 2.0

Item {
    id: root
    width: 1366
    height: 768
    property string ttt: "Text";
    Text {
        id: name
        text: root.ttt
        x: 10
        y: 10
    }
    Grid {
        scale: 1
        columns: 2
        rows: 3
        spacing: 20
        width: 620
        height: 140*3 + 20*2
        z: 0
        transformOrigin: Item.Left
        y: parent.height/2 - height/2
        x: 15

        ActionButton {
            source: "resources/images/editWorker.png"
            label: "Изменить данные сотрудника"
        }
        ActionButton {
            source: "resources/images/addDocument.png"
            label: "Создать документ"
        }
        ActionButton {
            source: "resources/images/deleteWorker.png"
            label: "Уволить сотрудника"
        }
        ActionButton {
            source: "resources/images/addZayav.png"
            label: "Создать заявление"
        }
        ActionButton {
            source: "resources/images/workers.png"
            label: "Список сотрудников"
        }
        ActionButton {
            source: "resources/images/Archive.png"
            label: "Архив документация"
        }
    }
}
