import QtQuick

QtObject {
    id: root

    signal received(var data)
    signal error(var traceback)

    property var callbacks: ({})

    function addImportPath(path) {
        // Kompatibilität zu PyOtherSide.
    }

    function importModule(name, callback) {
        if (callback)
            callback()
    }

    function call(method, args, callback) {

        var requestId = pythonBackend.call(method, args)

        console.log(
            "[PYTHON CALL]",
            "requestId=", requestId,
            "method=", method
        )

        if (callback) {
            var newCallbacks = root.callbacks
            newCallbacks[requestId] = callback
            root.callbacks = newCallbacks

            console.log(
                "[PYTHON CALLBACK STORED]",
                "requestId=", requestId
            )
        }

        return requestId
    }

    property Connections backendConnections: Connections {

        target: pythonBackend

        function onFinished(requestId, result) {

            console.log(
                "[PYTHON FINISHED]",
                "requestId=", requestId
            )

            var data = null

            try {
                data = JSON.parse(result)

                console.log(
                    "[PYTHON JSON OK]",
                    "requestId=", requestId
                )

            } catch (e) {

                console.log(
                    "[PYTHON JSON ERROR]",
                    "requestId=", requestId,
                    "error=", e
                )

                root.error(String(e))
            }

            root.received(data)

            var callback = root.callbacks[requestId]

            console.log(
                "[PYTHON CALLBACK LOOKUP]",
                "requestId=", requestId,
                "callback=", callback
            )

            if (callback) {

                var newCallbacks = root.callbacks
                delete newCallbacks[requestId]
                root.callbacks = newCallbacks

                console.log(
                    "[PYTHON CALLBACK EXECUTE]",
                    "requestId=", requestId
                )

                callback(data)

            } else {

                console.log(
                    "[PYTHON CALLBACK MISSING]",
                    "requestId=", requestId
                )
            }
        }

        function onFailed(requestId, message) {

            console.log(
                "[PYTHON FAILED]",
                "requestId=", requestId,
                "error=", message
            )

            root.error(message)

            var callback = root.callbacks[requestId]

            if (callback) {

                var newCallbacks = root.callbacks
                delete newCallbacks[requestId]
                root.callbacks = newCallbacks

                callback(null)
            }
        }
    }
}
