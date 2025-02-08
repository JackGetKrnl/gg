@echo off
setlocal enabledelayedexpansion

:: Set your webhook URL here
set WEBHOOK_URL=https://ptb.discord.com/api/webhooks/1337920372737310864/MaK8_z8TgXSchMPg35mwworB1pEaPdEl6X-GqQrPHlVpw9T_iISkfE7cPXzmu96uc3fM

:: Prompt user to select a file
echo Please enter the full path of the file you want to upload:
set /p FILE_PATH=

:: Check if the file exists
if not exist "%FILE_PATH%" (
    echo File does not exist. Exiting.
    pause
    exit /b
)

:: Send the file using curl to the webhook
curl -X POST "%WEBHOOK_URL%" ^
    -F "file=@%FILE_PATH%" ^
    -H "Content-Type: multipart/form-data"

echo File uploaded successfully.

:: Open the screen-melter program
echo Opening screen-melter...
start "" "C:\path\to\screen-melter.exe"

pause
