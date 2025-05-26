@echo off
REM ---- build-exe.bat ----
setlocal enabledelayedexpansion

REM ➊ Jump to the directory that contains THIS .bat
pushd "%~dp0"

REM ➋ Run your project’s build script
yarn pack-win      && echo Build succeeded. || echo Build failed.

REM ➌ Restore the caller’s original directory
popd
endlocal
