@echo off
set DISTRO=Ubuntu
set TARGET_DIR=setup

echo WSL(%DISTRO%) へのファイル転送を開始します...

rem WSL内にディレクトリを作成
wsl -d %DISTRO% -- bash -c "mkdir -p ~/%TARGET_DIR%"

rem PowerShellを呼び出して、現在のフォルダの全.shファイルをWSLのホームディレクトリへコピー
powershell -Command "$user = wsl -d %DISTRO% -- bash -c 'whoami'; $target = '\\wsl.localhost\%DISTRO%\home\' + $user.Trim() + '\%TARGET_DIR%'; Copy-Item '.\*.sh' -Destination $target -Force"

if %ERRORLEVEL% equ 0 (
    echo [成功] すべての .sh ファイルを Ubuntu 内の ~/%TARGET_DIR% にコピーしました。
) else (
    echo [エラー] ファイル転送に失敗しました。Ubuntuが起動しているか確認してください。
)

echo.
echo 次に Ubuntu を開き、以下のコマンドを実行してください：
echo cd ~/%TARGET_DIR%
echo chmod +x *.sh
pause
