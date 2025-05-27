@echo off
setlocal

REM ---- install-deps.bat ----

REM Check for Node.js
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is required but was not found in PATH. Please install Node.js v16 or newer.
  exit /b 1
)

REM Check for Yarn
where yarn >nul 2>nul
if errorlevel 1 (
  echo Yarn was not found in PATH. Install Yarn from https://classic.yarnpkg.com/en/docs/install .
  exit /b 1
)

REM Check for 7-Zip which is needed to extract FFmpeg
where 7z.exe >nul 2>nul
if errorlevel 1 (
  REM Try a few common install locations
  for %%X in (
    "C:\Program Files\7-Zip\7z.exe"
    "C:\Program Files (x86)\7-Zip\7z.exe"
    "%ProgramData%\chocolatey\tools\7z.exe"
    "C:\Program Files\NVIDIA Corporation\NVIDIA app\7z.exe"
  ) do (
    if exist "%%~X" (
      echo Found 7-Zip at "%%~dpX"
      set "PATH=%%~dpX;%PATH%"
      goto :7zip_ok
    )
  )

  echo 7-Zip is required to extract FFmpeg. Install it from https://www.7-zip.org/ and make sure 7z.exe is in PATH.
  exit /b 1
)

:7zip_ok

echo Installing Node dependencies...
yarn install

echo Downloading FFmpeg for Windows...
yarn download-ffmpeg-win32-x64

endlocal
