@echo off
title Temp Cleaner
color 0A

echo =============================================
echo        Cleaning Temporary Files By AMSTools
echo =============================================
echo.

:: Stop Explorer to release temp file locks
taskkill /f /im explorer.exe >nul 2>&1

:: Clean User Temp
echo Cleaning %%temp%% ...
del /f /s /q "%temp%\*" >nul 2>&1
for /d %%x in ("%temp%\*") do rd /s /q "%%x" >nul 2>&1

:: Clean Windows Temp
echo Cleaning C:\Windows\Temp ...
del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%x in ("C:\Windows\Temp\*") do rd /s /q "%%x" >nul 2>&1

:: Clean Prefetch
echo Cleaning Prefetch ...
del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1
for /d %%x in ("C:\Windows\Prefetch\*") do rd /s /q "%%x" >nul 2>&1

:: Restart Explorer
start explorer.exe

echo.
echo =============================================
echo      Temporary Files Cleaned
echo =============================================
pause
