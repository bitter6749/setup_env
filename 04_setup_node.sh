#!/bin/bash
# nvmのインストール
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# nvmを現在のセッションで有効化
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 各バージョンのインストール
nvm install 20
nvm install 22
nvm install 24

nvm alias default 22
echo "Node.jsの各バージョンをインストールしました。現在は v$(node -v) です。"
