@echo off
chcp 932 > nul
echo [WSL2 Install] Starting installation for Ubuntu...
wsl --install -d Ubuntu
echo.
echo -----------------------------------------------------------
echo [Success] Installation finished. Please RESTART your PC.
echo After rebooting, set your username and password in Ubuntu.
echo -----------------------------------------------------------
pause
