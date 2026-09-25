import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root

    visible: true

    // Qt6-native Grid Unit
    // Zentraler Skalierungsfaktor für die gesamte Oberfläche.
    property real gridUnit: 8

    // Lomiri MainView compatibility
    property string applicationName: ""
}
