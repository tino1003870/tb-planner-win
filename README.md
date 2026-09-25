# TB Planner – Windows

TB Planner is a Gantt-/WBS-based task planner with CalDAV synchronization.

## Windows release

The current Windows release is provided as a complete PyInstaller package.

Download the current release from the GitHub Releases page and **extract the complete package** before starting `TB-Planner.exe`.

The application does not require a separate Python installation.

## Features

- Hierarchical task planning using WBS
- Gantt diagram
- Start date and duration handling
- Automatic calculation of the end date
- CalDAV synchronization
- VTODO support
- Windows application built with PySide6 / Qt 6
- Standalone PyInstaller distribution

## Development

The application is developed using Python 3 and Qt 6 / PySide6.

Create a virtual environment:

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
```

Install the required packages:

```powershell
pip install -r requirements.txt
```

Build the Windows application:

```powershell
pyinstaller TB-Planner.spec
```

The resulting application is created in:

```text
dist\TB-Planner\
```

The executable is:

```text
dist\TB-Planner\TB-Planner.exe
```

## Project structure

```text
src/
├── main.py
├── qml/
└── python/
    ├── backend.py
    ├── planner.py
    ├── syncmanager.py
    ├── taskmodel.py
    └── caldav/
```

## License

See the repository for the current license information.
