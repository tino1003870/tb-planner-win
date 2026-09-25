pragma Singleton

import QtQuick

QtObject {
    // Ubuntu Touch Grid Unit:
    // 1 GU entspricht 8 px bei der bisherigen Desktop-Darstellung.
    property real gridUnit: 8

    function gu(value) {
        return value * gridUnit
    }
}
