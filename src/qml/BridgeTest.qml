import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 700
    height: 500
    title: "TB Planner NX - Bridge Test"

    Column {
        anchors.centerIn: parent
        spacing: 15

        Label {
            text: "PySide6 Bridge Test"
            font.pixelSize: 22
        }

        Button {
            text: "backend.getTasks()"

            onClicked: {
                var result = pythonBackend.call("backend.getTasks", [])
                console.log("getTasks():", result)
                resultLabel.text = "getTasks(): " + JSON.stringify(result)
            }
        }

        Button {
            text: "Test Argumente: add → ändern → löschen"

            onClicked: {
                console.log("=== Bridge Argument-Test ===")

                // 1. Task mit Argumenten erzeugen
                pythonBackend.call(
                    "backend.addTask",
                    ["Bridge Test", 0, 1]
                )

                // 2. Tasks lesen
                var tasks = pythonBackend.call(
                    "backend.getTasks",
                    []
                )

                console.log("Nach addTask():", tasks)

                if (tasks.length > 0) {
                    var index = tasks.length - 1

                    // 3. Titel mit Argument ändern
                    pythonBackend.call(
                        "backend.setTaskTitle",
                        [index, "Bridge Test geändert"]
                    )

                    // 4. Noch einmal lesen
                    tasks = pythonBackend.call(
                        "backend.getTasks",
                        []
                    )

                    console.log("Nach setTaskTitle():", tasks)

                    // 5. Test-Task wieder löschen
                    pythonBackend.call(
                        "backend.removeTask",
                        [index]
                    )

                    tasks = pythonBackend.call(
                        "backend.getTasks",
                        []
                    )

                    console.log("Nach removeTask():", tasks)

                    resultLabel.text =
                        "Argument-Test erfolgreich\n" +
                        "Tasks danach: " +
                        JSON.stringify(tasks)
                } else {
                    resultLabel.text =
                        "FEHLER: addTask() hat keinen Task erzeugt."
                }
            }
        }

        Label {
            id: resultLabel

            text: "Noch kein Test ausgeführt."
            wrapMode: Text.Wrap
            width: 600
        }
    }
}
