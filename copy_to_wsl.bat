@echo off
chcp 932 > nul
set DISTRO=Ubuntu
set TARGET_DIR=setup

echo [File Transfer] Copying .sh files to WSL (%DISTRO%)...

rem Create directory in WSL
wsl -d %DISTRO% -- bash -c "mkdir -p ~/%TARGET_DIR%"

rem Use PowerShell to copy files
powershell -Command "$u = (wsl -d %DISTRO% -- bash -c 'whoami').Trim(); $dst = '\\wsl.localhost\%DISTRO%\home\' + $u + '\%TARGET_DIR%'; if (Test-Path $dst) { Copy-Item '.\*.sh' -Destination $dst -Force; echo 'Copy successful.' } else { exit 1 }"

if %ERRORLEVEL% equ 0 (
    echo.
    echo ===========================================================
    echo [OK] Files copied to ~/%TARGET_DIR% in Ubuntu.
    echo ===========================================================
    echo Next steps in Ubuntu terminal:
    echo 1. cd ~/%TARGET_DIR%
    echo 2. chmod +x *.sh
    echo 3. Run your scripts (e.g., ./01_setup_git.sh)
) else (
    echo.
    echo [ERROR] Transfer failed. Make sure Ubuntu is running.
)

pause
