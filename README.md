# 開発環境セットアップガイド (WSL2 / Ubuntu)

このリポジトリは、チームで統一されたLinux開発環境を構築するためのスクリプト群です。

## セットアップ手順

### STEP 1: WSLのインストール (Windows)
1. `setup_wsl.bat` を右クリックして **「管理者として実行」** してください。
2. 完了後、必ず **PCを再起動** してください。
3. 再起動後、Ubuntu（黒い画面）が自動で立ち上がります。
   - 画面の指示に従い、**ユーザー名とパスワードを設定** してください。

### STEP 2: 設定ファイルの転送 (Windows)
1. Ubuntuの初期設定（ユーザー名作成）が終わった状態で、このフォルダにある `copy_to_wsl.bat` をダブルクリックして実行してください。
   - これにより、Ubuntu内の `~/setup/` フォルダへ必要なスクリプトがコピーされます。

### STEP 3: 各種環境の構築 (Ubuntu)
Ubuntuのターミナルを開き、以下のコマンドを順番に実行してください。

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
./06_check_env.sh      # すべてのツールが正常か確認

# 5. 以下は必須ではない
./07_setup_nasm.sh # nasm
