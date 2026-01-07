@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
where python >nul 2>nul || (echo Python not found on PATH. Install Python or add it to PATH & pause & exit /b 1)
SET "MODULES=pygame-ce numpy librosa pillow mutagen"

echo required modules: %MODULES%
echo.
choice /C YN /N /M "Check and install modules? [Y | N]: "
if ERRORLEVEL 2 goto :start

echo Checking for required Python modules...

for %%M in (%MODULES%) do (
    call :CheckAndInstall "%%M"
)

if %ERRORLEVEL% NEQ 0 (
    echo One or more module installations failed.
    pause
    exit /b 1
)

echo All required modules are installed.
timeout /t 2 /nobreak >nul

:start
cls
python main.py
exit /b

:CheckAndInstall
setlocal enabledelayedexpansion
set "MOD_NAME=%~1"

if "!MOD_NAME!"=="pygame-ce" (
    python -c "import pygame" 2>nul
) else if "!MOD_NAME!"=="pillow" (
    python -c "import PIL" 2>nul
) else (
    python -c "import !MOD_NAME!" 2>nul
)

if !ERRORLEVEL! NEQ 0 (
    echo Module !MOD_NAME! is not installed. Attempting to install...
    python -m pip install !MOD_NAME!
    if !ERRORLEVEL! NEQ 0 (
        echo Failed to install !MOD_NAME!.
        exit /b 1
    )
    echo Successfully installed !MOD_NAME!.
) else (
    echo Module !MOD_NAME! is already installed.
)
endlocal
exit /b
