@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
where python >nul 2>nul || (echo "Python not found on PATH. Install Python or add it to PATH" & pause & exit /b 1)
SET "MODULES=pygame numpy librosa PIL mutagen"

echo required modules: %MODULES%
echo.
choice /C YN /N /M "Check and install modules? [Y | N]: "
if ERRORLEVEL 2 goto :start

echo Checking for required Python modules...

FOR %%M IN (%MODULES%) DO (
    CALL :CheckAndInstall "%%M"
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
python -c "import !MOD_NAME!" 2>nul

if !ERRORLEVEL! NEQ 0 (
    echo Module !MOD_NAME! is not installed. Attempting to install...
    if "!MOD_NAME!"=="PIL" set "MOD_NAME=Pillow"
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
