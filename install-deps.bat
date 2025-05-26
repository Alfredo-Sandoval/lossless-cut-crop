@echo off
setlocal

:: Install Node dependencies
yarn install

:: Download FFmpeg for Windows
yarn download-ffmpeg-win32-x64

endlocal
