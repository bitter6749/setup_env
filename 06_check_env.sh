#!/bin/bash

# 表示色の設定
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "========================================"
echo "   開発環境セットアップ確認ツール"
echo "========================================"

check_version() {
  local name=$1
  local cmd=$2
  if command -v $cmd &>/dev/null; then
    echo -e "${GREEN}[OK]${NC} $name: $($cmd --version | head -n 1)"
  else
    echo -e "${RED}[NG]${NC} $name がインストールされていないか、パスが通っていません。"
  fi
}

# nvm や rbenv のパスを反映させるために読み込み
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
[ -d "$HOME/.rbenv" ] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

echo "--- 言語・ツール ---"
check_version "Git" "git"
check_version "GitHub CLI" "gh"
check_version "Ruby (rbenv)" "ruby"
check_version "Node.js (nvm)" "node"
check_version "Rust (rustup)" "rustc"

echo -e "\n--- Docker ---"
if docker ps &>/dev/null; then
  echo -e "${GREEN}[OK]${NC} Docker: $(docker --version)"
  echo -e "${GREEN}[OK]${NC} Docker Compose: $(docker compose version)"
  echo -e "     (sudoなしでの実行権限も正常です)"
else
  echo -e "${RED}[NG]${NC} Docker が起動していないか、権限設定が反映されていません。"
  echo -e "     (一度Ubuntuを閉じて開き直したか確認してください)"
fi

echo -e "\n--- Node.js バージョン確認 ---"
if command -v nvm &>/dev/null; then
  echo "インストール済みリスト:"
  nvm ls | grep -E "v20|v22|v24"
else
  echo -e "${RED}[NG]${NC} nvm が見つかりません。"
fi

echo "========================================"
