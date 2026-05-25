# AMSTools Temp Cleaner

Automatic Windows temporary file cleaner using Batch Script.

## File Name

```text
DelTemp.bat
```

---

# Features

- Clean `%temp%`
- Clean `C:\Windows\Temp`
- Clean `C:\Windows\Prefetch`
- Auto run at Windows startup
- Lightweight and fast
- No additional software required

---

# Script

```bat
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
```

---

# Installation

## 1. Create Folder

```text
C:\Scripts
```

---

## 2. Save Script

Save as:

```text
C:\Scripts\DelTemp.bat
```

---

# Auto Run at Startup

## Open Task Scheduler

Press:

```text
Win + R
```

Type:

```text
taskschd.msc
```

---

# Create Task

## General

Enable:

- Run with highest privileges
- Run whether user is logged on or not

---

## Trigger

Create new trigger:

```text
At startup
```

---

## Action

Program/script:

```text
C:\Scripts\DelTemp.bat
```

---

## Conditions

Disable:

```text
Start the task only if the computer is on AC power
```

---

## Settings

Enable:

```text
Run task as soon as possible after a scheduled start is missed
```

---

# Warning

This script permanently deletes temporary files.

Avoid running during:
- Windows Update
- Software installation
- Large file extraction

---

# License

MIT License

---

# Author

AMSTools
