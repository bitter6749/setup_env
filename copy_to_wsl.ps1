# 1. ターゲットとなる配布先（Ubuntu）のパスを設定
$distroName = "Ubuntu"
$targetDir = "setup"

Write-Host "WSL($distroName) へのファイル転送を開始します..." -ForegroundColor Cyan

# 2. Ubuntu内にディレクトリを作成 (すでに存在してもエラーにならない)
wsl -d $distroName -- bash -c "mkdir -p ~/$targetDir"

# 3. WSL側のホームディレクトリのパスを取得
# \\wsl.localhost\Ubuntu\home\username というパスを構築
$wslPath = "\\wsl.localhost\$distroName\home\" + $(wsl -d $distroName -- bash -c "whoami").Trim() + "\$targetDir"

# 4. .shファイルをコピー
if (Test-Path $wslPath) {
    Copy-Item ".\*.sh" -Destination $wslPath -Force
    Write-Host "成功: すべての .sh ファイルを $wslPath にコピーしました。" -ForegroundColor Green
} else {
    Write-Host "エラー: WSLのパスが見つかりませんでした。" -ForegroundColor Red
}

Write-Host "`n次に、Ubuntuを開いて以下のコマンドを実行してください："
Write-Host "cd ~/$targetDir"
Write-Host "chmod +x *.sh"
pause
