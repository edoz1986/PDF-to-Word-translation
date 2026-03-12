@echo off
chcp 65001 >nul

echo ================================================
echo Table Formatter Tool
echo ================================================
echo Function: Fix table format, auto-fit content
echo Output: _fixed.docx
echo Note: Original files not overwritten
echo ================================================
echo.
echo Usage:
echo   1. Double-click: Auto-search all Word files
echo   2. Drag ^& Drop: Format specific Word files
echo ================================================
echo.

cd /d "%~dp0"

REM Check system Python first
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python not found. Please ensure Python is installed and added to PATH.
    pause
    exit /b 1
)

REM Check if venv exists
if exist ".venv\Scripts\activate.bat" (
    echo Activating virtual environment...
    call .venv\Scripts\activate.bat
) else if exist "venv\Scripts\activate.bat" (
    echo Activating virtual environment...
    call venv\Scripts\activate.bat
) else (
    echo Warning: Virtual environment not found. Using system Python.
    echo Please run setup.bat first to create the virtual environment.
    echo.
)

echo.

if "%~1"=="" (
    echo Auto-search mode...
    echo.
    python fix_tables_only.py
    goto :done
)

echo Drag-drop mode: %*
echo.
python fix_tables_only.py %*

:done
echo.
pause
