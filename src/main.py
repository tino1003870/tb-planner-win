import sys
from pathlib import Path

from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from python.qtbridge import PythonBridge


def main():
    project_root = Path(__file__).resolve().parent

    print("=== PATH DEBUG MAIN ===")
    print("__file__      =", __file__)
    print("project_root  =", project_root)
    print("python path   =", project_root / "python")
    print("cwd           =", Path.cwd())
    print("sys.path      =", sys.path)
    print("=== END PATH DEBUG ===")

    # Bestehende Planner-Python-Module auffindbar machen
    sys.path.insert(0, str(project_root / "python"))

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()

    bridge = PythonBridge()
    engine.rootContext().setContextProperty("pythonBackend", bridge)

    qml_file = project_root / "qml" / "Main.qml"
    engine.load(QUrl.fromLocalFile(str(qml_file)))

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == "__main__":
    main()
