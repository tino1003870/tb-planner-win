# TB Planner for Windows

**TB Planner** is a standalone task planning application for Windows.

It combines a hierarchical task list with a Gantt-style timeline and synchronizes project tasks with a CalDAV server using VTODO calendar items.

## Features

* Hierarchical task list
* WBS-style task numbering
* Gantt-style project timeline
* Start date, due date and duration
* CalDAV / VTODO synchronization
* WebDAV/CalDAV server connection
* Qt 6 / PySide6 user interface
* Python backend

## Development

The application is developed using Python 3 and Qt 6 / PySide6.

Create a virtual environment:

```cmd
python -m venv .venv
.venv\Scripts\activate
```

Run the application from the source tree:

```cmd
python src\main.py
```

## Windows Development

The Windows port is developed separately from the `tb-planner-nx` project.

The goal is to keep the existing application architecture and functionality while providing a native Windows development and build environment without requiring Visual Studio.

## Status

**Current release: v0.1.0**

The initial Windows port is based on the current `tb-planner-nx` source tree.

## License

See the `LICENSE` file included in the repository.
