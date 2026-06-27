
@echo off
:: Check if Zscaler is running
tasklist | findstr "ZSATray.exe" >nul 2>&1
if %errorlevel%==0 (
    echo Zscaler is running. Attempting to stop it...
    taskkill /IM "ZSATary.exe" /F >nul 2>&1
   
    :: Optional: Attempt to uninstall Zscaler
    echo Attempting to uninstall Zscaler...
    wmic product where name="Zscaler" call uninstall /nointeractive >nul 2>&1
) else (
    echo Zscaler is not running.
)

:: Wait 30 seconds before checking again
timeout /t 30 >nul
goto loop