@echo off
setlocal EnableDelayedExpansion
title System Cleaner Ultimate by AMSDev
color 0B

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :menu
) else (
    echo [!] Administrator Privileges Required.
    echo [*] Requesting elevation...
    powershell -Command "Start-Process '%~dpnx0' -Verb RunAs"
    exit /b
)

:menu
cls
echo =======================================================
echo               SYSTEM CLEANER ULTIMATE
echo                  Develop by AMSDev
echo =======================================================
echo.
echo   [1] Clean Temporary Files (User, Windows, Prefetch)
echo   [2] Clean Windows Update Cache
echo   [3] Empty Recycle Bin
echo   [4] Flush DNS Cache
echo   [5] Deep Clean (Perform ALL actions + Restart Explorer)
echo   [6] Exit
echo.
echo =======================================================
set /p choice="Enter your choice (1-6): "

if "%choice%"=="1" goto :temp
if "%choice%"=="2" goto :update
if "%choice%"=="3" goto :recycle
if "%choice%"=="4" goto :dns
if "%choice%"=="5" goto :deep
if "%choice%"=="6" exit
goto :menu

:temp
echo.
echo [*] Cleaning User Temp...
del /f /s /q "%temp%\*" >nul 2>&1
for /d %%x in ("%temp%\*") do rd /s /q "%%x" >nul 2>&1

echo [*] Cleaning Windows Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" >nul 2>&1

echo [*] Cleaning Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1
for /d %%x in ("C:\Windows\Prefetch\*") do rd /s /q "%%x" >nul 2>&1
echo [+] Temp Files Cleaned!
pause
goto :menu

:update
echo.
echo [*] Stopping Windows Update Service...
net stop wuauserv >nul 2>&1
echo [*] Cleaning Windows Update Cache...
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
for /d %%x in ("C:\Windows\SoftwareDistribution\Download\*") do rd /s /q "%%x" >nul 2>&1
echo [*] Starting Windows Update Service...
net start wuauserv >nul 2>&1
echo [+] Windows Update Cache Cleaned!
pause
goto :menu

:recycle
echo.
echo [*] Emptying Recycle Bin...
powershell -command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo [+] Recycle Bin Emptied!
pause
goto :menu

:dns
echo.
echo [*] Flushing DNS Cache...
ipconfig /flushdns >nul
echo [+] DNS Cache Flushed!
pause
goto :menu

:deep
echo.
echo [!] Starting Deep Clean...
echo [*] Stopping Explorer to release locked files...
taskkill /f /im explorer.exe >nul 2>&1

echo [*] Cleaning User Temp...
del /f /s /q "%temp%\*" >nul 2>&1
for /d %%x in ("%temp%\*") do rd /s /q "%%x" >nul 2>&1
echo [*] Cleaning Windows Temp...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" >nul 2>&1
echo [*] Cleaning Prefetch...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1
for /d %%x in ("C:\Windows\Prefetch\*") do rd /s /q "%%x" >nul 2>&1

echo [*] Stopping Windows Update Service...
net stop wuauserv >nul 2>&1
echo [*] Cleaning Windows Update Cache...
del /f /s /q "C:\Windows\SoftwareDistribution\Download\*" >nul 2>&1
for /d %%x in ("C:\Windows\SoftwareDistribution\Download\*") do rd /s /q "%%x" >nul 2>&1
echo [*] Starting Windows Update Service...
net start wuauserv >nul 2>&1

echo [*] Emptying Recycle Bin...
powershell -command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"

echo [*] Flushing DNS Cache...
ipconfig /flushdns >nul

echo [*] Restarting Explorer...
start explorer.exe

echo.
echo [+] Deep Clean Completed Successfully!
pause
goto :menu
