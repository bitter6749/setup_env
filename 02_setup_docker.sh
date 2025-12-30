#!/bin/bash
# 古いバージョンを削除
sudo apt-get remove docker docker-engine docker.io containerd runc

# 依存パッケージのインストール
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Docker公式のGPGキーを追加
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# リポジトリの設定
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# インストール
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# sudoなしで実行するための設定
sudo usermod -aG docker $USER
echo "Dockerのセットアップが完了しました。設定を反映させるため、一度ログアウトするか 'newgrp docker' を実行してください。"
