import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ToolBar {
    id: root

    property string title: ""

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12

        Label {
            text: root.title
            font.pixelSize: 20
            Layout.fillWidth: true
            verticalAlignment: Text.AlignVCenter
        }
    }
}
