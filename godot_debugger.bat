
@echo off
setlocal EnableExtensions
title Godot 4.5.1 Debugger 
color 07

echo ==========================================
echo       GODOT 4.5.1 DEBUG LAUNCHER
echo ==========================================
echo.

REM AUTO DETECT PROJECT
for %%I in ("%~dp0.") do set "PROJECT=%%~fI"

if not exist "%PROJECT%\project.godot" (
    color 0C
    echo [ERROR] project.godot not found!
    pause
    exit /b 1
)

echo [PASS] Project detected!
echo %PROJECT%
echo.

REM GODOT EXECUTABLE
set "GODOT=C:\Users\Neuroticfly\Desktop\Godot\godot_4.5.1_spine.exe"

if not exist "%GODOT%" (
    color 0C
    echo [ERROR] Godot executable not found!
    pause
    exit /b 1
)

echo [PASS] Godot executable found!
echo.

REM VERSION CHECK
"%GODOT%" --version

echo.
echo [INFO] Starting game...
echo.

REM LAUNCH GAME
pushd "%PROJECT%"
"%GODOT%" --path . --verbose
set "EXITCODE=%ERRORLEVEL%"
popd

echo.
echo ==========================================
echo GAME CLOSED
echo EXIT CODE: %EXITCODE%
echo ==========================================
pause
