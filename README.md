# AMSTools Temp Cleaner

Script សម្រាប់សម្អាត Temporary Files នៅលើ Windows ដោយស្វ័យប្រវត្តិ។

## ឈ្មោះ File

```text
DelTemp.bat
```

---

# មុខងារ

- សម្អាត `%temp%`
- សម្អាត `C:\Windows\Temp`
- សម្អាត `C:\Windows\Prefetch`
- ដំណើរការស្វ័យប្រវត្តិនៅពេល Boot Windows
- ស្រាល និង ដំណើរការលឿន
- មិនត្រូវការកម្មវិធីបន្ថែម

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

# របៀបប្រើប្រាស់

## 1. បង្កើត Folder

បង្កើត Folder មួយឈ្មោះ៖

```text
C:\Scripts
```

---

## 2. Save Script

Save File ជា៖

```text
C:\Scripts\DelTemp.bat
```

---

# កំណត់ឲ្យដំណើរការស្វ័យប្រវត្តិពេលបើក Windows

## បើក Task Scheduler

ចុច៖

```text
Win + R
```

វាយ៖

```text
taskschd.msc
```

បន្ទាប់មកចុច Enter

---

# បង្កើត Task ថ្មី

## General

Enable:

- Run with highest privileges
- Run whether user is logged on or not

---

## Trigger

បង្កើត Trigger ថ្មី៖

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

ដោះធីក៖

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

# ការប្រុងប្រយ័ត្ន

Script នេះនឹងលុប Temporary Files ជាអចិន្ត្រៃយ៍។

មិនគួរប្រើនៅពេល៖

- Windows កំពុង Update
- កំពុង Install កម្មវិធី
- កំពុង Extract File ធំៗ

---

# License
MIT License

---

# Author
[AMSTools](https://amsofficial-dev.vercel.app/)
