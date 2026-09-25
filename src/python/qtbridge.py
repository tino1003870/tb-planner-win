import importlib
import json

from PySide6.QtCore import (
    QObject,
    Signal,
    Slot,
    QRunnable,
    QThreadPool,
)


class PythonWorker(QRunnable):

    def __init__(self, request_id, method, args, bridge):
        super().__init__()

        self.request_id = request_id
        self.method = method
        self.args = args
        self.bridge = bridge

    def run(self):
        try:
            module_name, function_name = self.method.split(".", 1)

            module = importlib.import_module(module_name)
            function = getattr(module, function_name)

            result = function(*self.args)

            # Python-Objekte sauber als JSON an QML übergeben.
            result_json = json.dumps(
                result,
                ensure_ascii=False
            )

            self.bridge.finished.emit(
                self.request_id,
                result_json
            )

        except Exception as e:
            self.bridge.failed.emit(
                self.request_id,
                str(e)
            )


class PythonBridge(QObject):

    finished = Signal(int, str)
    failed = Signal(int, str)

    def __init__(self):
        super().__init__()

        self._next_request_id = 1
        self._thread_pool = QThreadPool.globalInstance()

    @Slot(str, list, result=int)
    def call(self, method, args):

        request_id = self._next_request_id
        self._next_request_id += 1

        worker = PythonWorker(
            request_id,
            method,
            args,
            self
        )

        self._thread_pool.start(worker)

        return request_id
