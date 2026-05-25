# Windows Temp Cleaner

Simple Batch Script to automatically clean temporary files on Windows startup.

## Features

- Clean `%temp%`
- Clean `C:\Windows\Temp`
- Clean `C:\Windows\Prefetch`
- Runs automatically at Windows boot
- Lightweight and fast
- No third-party software required

---

# Script

```bat
@echo off
title Temp Cleaner
color 0A

echo ========================================
echo        Cleaning Temporary Files
echo ========================================
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
echo ========================================
echo      Temporary Files Cleaned
echo ========================================
pause
```

---

# Installation

## 1. Create Script Folder

Create folder:

```text
C:\Scripts
```

Save the batch file as:

```text
C:\Scripts\CleanTemp.bat
```

---

# Auto Run on Startup

## Using Task Scheduler

### Step 1
Press:

```text
Win + R
```

Type:

```text
taskschd.msc
```

---

### Step 2
Click:

```text
Create Task
```

---

### General Tab

Enable:

- Run with highest privileges
- Run whether user is logged on or not

---

### Triggers Tab

Create new trigger:

```text
At startup
```

---

### Actions Tab

Program/script:

```text
C:\Scripts\CleanTemp.bat
```

---

### Conditions Tab

Disable:

```text
Start the task only if the computer is on AC power
```

---

### Settings Tab

Enable:

```text
Run task as soon as possible after a scheduled start is missed
```

---

# Warning

This script permanently removes temporary files.

Do not use while installing software or running Windows updates.

---

# License

MIT License
