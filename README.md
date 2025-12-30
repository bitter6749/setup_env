# 開発環境セットアップガイド

このリポジトリは、WSL2(Ubuntu)上に開発環境を自動構築するためのスクリプト群です。

## セットアップ手順

### STEP 1: Windows側での準備
1. ZIPファイルを展開したフォルダで `copy_to_wsl.ps1` を右クリックし、**「PowerShell で実行」** を選択してください。
   - これにより、Ubuntu内の `~/setup/` フォルダへ必要な設定ファイルが自動コピーされます。

### STEP 2: Ubuntu側での実行
Ubuntuのターミナル（WSL）を開き、以下のコマンドを順番に実行してください。

```bash
# 1. セットアップディレクトリへ移動
cd ~/setup

# 2. 実行権限を付与
chmod +x *.sh

# 3. 各環境のインストール（順番に実行）
./01_setup_git.sh      # Git & GitHub CLI (ブラウザ認証あり)
./02_setup_docker.sh   # Docker (完了後、一度Ubuntuを閉じて再起動してください)
./03_setup_ruby.sh     # Ruby (rbenv)
./04_setup_node.sh     # Node.js (nvm)
./05_setup_rust.sh     # Rust (rustup)

# 4. 最終確認
./06_check_env.sh      # すべてのツールが正しく入ったか確認

### ワンポイントアドバイス
チームメンバーがスクリプトを実行する際、PowerShellの実行ポリシー制限（スクリプト実行禁止設定）に引っかかる場合があります。その場合は、以下のコマンドをPowerShellで一度だけ実行するよう伝えてあげてください。

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
