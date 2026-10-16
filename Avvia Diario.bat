@echo off
cd /d "%~dp0"
py -c "import argofamiglia, dotenv, flask; from google import genai" >nul 2>&1
if errorlevel 1 (
    echo Installazione delle dipendenze necessarie...
    py -m pip install -r requirements.txt
    if errorlevel 1 (
        echo.
        echo Installazione non riuscita. Verifica la connessione Internet e riprova.
        pause
        exit /b 1
    )
)
py main.py
if errorlevel 1 (
    echo.
    echo Avvio non riuscito. Verifica Python e le dipendenze.
    pause
)
