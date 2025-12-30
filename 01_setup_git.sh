#!/bin/bash
sudo apt update && sudo apt install -y git gh

echo "Gitの初期設定を開始します。"
read -p "GitHubのユーザー名を入力してください: " username
read -p "GitHubのメールアドレスを入力してください: " email

git config --global user.name "$username"
git config --global user.email "$email"

echo "GitHubへのログインを開始します。指示に従ってブラウザで認証してください。"
gh auth login
