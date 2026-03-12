@echo off
chcp 65001 >nul

echo ================================================
echo Project Setup - Install Dependencies
echo ================================================
echo.

cd /d "%~dp0"

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python not found.
    echo Please install Python 3.11 or later and add it to PATH.
    echo Download: https://www.python.org/downloads/
    pause
    exit /b 1
)

REM Get Python version
for /f "tokens=2" %%a in ('python --version 2^>^&1') do set PYTHON_VERSION=%%a
echo Python detected: %PYTHON_VERSION%
echo.

REM Remove old venv if exists (to ensure clean install)
if exist ".venv" (
    echo Removing old virtual environment...
    rmdir /s /q .venv
    if errorlevel 1 (
        echo Warning: Could not remove old venv. Trying to use existing...
    ) else (
        echo Old virtual environment removed.
    )
    echo.
)

if exist "venv" (
    echo Removing old virtual environment...
    rmdir /s /q venv
    if errorlevel 1 (
        echo Warning: Could not remove old venv. Trying to use existing...
    ) else (
        echo Old virtual environment removed.
    )
    echo.
)

REM Create new venv with current Python
echo Creating virtual environment with Python %PYTHON_VERSION%...
python -m venv .venv
if errorlevel 1 (
    echo Error: Failed to create virtual environment.
    pause
    exit /b 1
)
echo Virtual environment created.
echo.

REM Activate venv and install dependencies
echo Activating virtual environment...
call .venv\Scripts\activate.bat

echo.
echo Installing dependencies...
pip install -r requirements.txt

if errorlevel 1 (
    echo Error: Failed to install dependencies.
    pause
    exit /b 1
)
echo.
echo Dependencies installed successfully.
echo.

echo ================================================
echo Setup complete! You can now run the tools.
echo ================================================
pause
