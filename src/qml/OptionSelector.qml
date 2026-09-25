import QtQuick
import QtQuick.Controls as Controls

Column {
    id: root

    property string text: ""
    property int selectedIndex: 0
    property var model: []

    spacing: 4

    Controls.Label {
        width: parent.width
        text: root.text
        visible: root.text !== ""
    }

    Controls.ComboBox {
        id: comboBox

        width: parent.width
        model: root.model

        currentIndex: root.selectedIndex

        onCurrentIndexChanged: {
            if (root.selectedIndex !== currentIndex)
                root.selectedIndex = currentIndex
        }
    }

    onSelectedIndexChanged: {
        if (comboBox.currentIndex !== selectedIndex)
            comboBox.currentIndex = selectedIndex
    }
}
