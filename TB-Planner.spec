# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['src/main.py'],
    pathex=[r"C:\github\tb-planner-win\src\python"],
    binaries=[],
    datas=[(r"src\qml", "qml")],

hiddenimports=[
    "backend",
    "planner",
    "qtbridge",
    "syncmanager",
    "taskmodel",
    "caldav",
    "caldav.client",
    "caldav.ical",
    "uuid",
    "xml",
    "xml.etree",
    "xml.etree.ElementTree",
],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='TB-Planner',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
coll = COLLECT(
    exe,
    a.binaries,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='TB-Planner',
)
