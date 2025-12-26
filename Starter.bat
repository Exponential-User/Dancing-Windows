@echo off
SET "MODULES=pygame numpy librosa PIL mutagen"

echo required modules: %MODULES%
echo.
echo Do you want to check and install required Python modules?
choice /C YN /N /M "Y | N: "
if ERRORLEVEL 2 goto :start

echo Checking for required Python modules...

FOR %%M IN (%MODULES%) DO (
    CALL :CheckAndInstall "%%M"
)

echo All required modules are installed.
echo.
echo Starting...
timeout /t 2 /nobreak >nul
goto :start


:CheckAndInstall
set "MOD_NAME=%~1"
python -c "import %MOD_NAME%" 2>nul

if %ERRORLEVEL% NEQ 0 (
    echo Module %MOD_NAME% is not installed. Attempting to install...
    python -m pip install %MOD_NAME%

    if %ERRORLEVEL% NEQ 0 (
        echo Failed to install %MOD_NAME%.
        exit /b 1
    )

    echo Successfully installed %MOD_NAME%.
) else (
    echo Module %MOD_NAME% is already installed.
)
goto :EOF


:start
cls
python main.py
