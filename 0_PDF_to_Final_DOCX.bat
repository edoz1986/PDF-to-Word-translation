@echo off
chcp 65001 >nul

echo ================================================
echo PDF to Final Document Processor
echo ================================================
echo Process: PDF -> Word -> Translate -> Format -> TOC Fix
echo Output: _final.docx only
echo Note: No intermediate files, original files not overwritten
echo ================================================
echo.
echo Usage:
echo   1. Double-click: Auto-search all PDF files
echo   2. Drag ^& Drop: Process specific PDF files
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
    python process_all_in_one.py
    goto :done
)

echo Drag-drop mode: %*
echo.
python process_all_in_one.py %*

:done
echo.
pause
