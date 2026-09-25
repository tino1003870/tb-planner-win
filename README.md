# TB Planner

**TB Planner** is a standalone task planning application for Linux.

It combines a hierarchical task list with a Gantt-style timeline and synchronizes project tasks with a CalDAV server using VTODO calendar items.

## Features

- Hierarchical task list
- WBS-style task numbering
- Gantt-style project timeline
- Start date, due date and duration
- CalDAV / VTODO synchronization
- WebDAV/CalDAV server connection
- Qt 6 / PySide6 user interface
- Python backend
- Standalone Linux executable
- AppImage distribution

## Screenshots

Screenshots will be added here.

## Download

Pre-built Linux releases are available here:

https://github.com/tino1003870/tb-planner-nx/releases

### AppImage

Download **TB-Planner-x86_64.AppImage**, make it executable and start it:

```bash
chmod +x TB-Planner-x86_64.AppImage
./TB-Planner-x86_64.AppImage
```

The AppImage contains the required Python and Qt runtime.

## Development

The application is developed using Python 3 and Qt 6 / PySide6.

Create a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Run the application from the source tree:

```bash
python src/main.py
```

## Building

The standalone Linux executable is built using PyInstaller.

```bash
source .venv/bin/activate
pyinstaller TB-Planner.spec
```

The resulting executable is created in `dist/TB-Planner`.

An AppImage can then be created using `appimagetool`.

## Status

**Current release: v0.1.0**

The first release provides the Qt 6 application, hierarchical task handling, Gantt-style visualization, CalDAV/VTODO synchronization and Linux AppImage distribution.

## License

License information will be added in a future release.
