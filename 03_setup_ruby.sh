#!/bin/bash

# 1. 依存ライブラリのインストール
echo "依存ライブラリをインストールしています..."
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev libyaml-dev libreadline-dev libffi-dev libgmp-dev

# 2. rbenvのインストール
if [ ! -d "$HOME/.rbenv" ]; then
  echo "rbenvをクローンしています..."
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

# 3. ruby-buildのインストール
if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  echo "ruby-buildをインストールしています..."
  mkdir -p "$(~/.rbenv/bin/rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(~/.rbenv/bin/rbenv root)"/plugins/ruby-build
fi

# 4. シェル設定の追加（重複しないように追記）
grep -q 'export PATH="$HOME/.rbenv/bin:$PATH"' ~/.bashrc || echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >>~/.bashrc
grep -q 'eval "$(rbenv init -)"' ~/.bashrc || echo 'eval "$(rbenv init -)"' >>~/.bashrc

# 5. 現在のスクリプトセッションにrbenvを読み込む
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# 6. Ruby 3.2.9 のインストール
echo "Ruby 3.2.9 をインストールしています... (これには数分かかります)"
rbenv install 3.2.9
rbenv global 3.2.9

# 7. 確認
echo "Rubyのインストールが完了しました。"
ruby -v
