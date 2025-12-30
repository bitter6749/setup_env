#!/bin/bash
# 依存ライブラリのインストール
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev libyaml-dev libreadline-dev libffi-dev

# rbenvのインストール
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >>~/.bashrc
echo 'eval "$(rbenv init -)"' >>~/.bashrc
source ~/.bashrc

# ruby-buildのインストール
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Ruby 3.2.2 のインストール（3.2.9が未リリースの場合は最新安定版を指定してください）
~/.rbenv/bin/rbenv install 3.2.2
~/.rbenv/bin/rbenv global 3.2.2

echo "Rubyのインストールが完了しました。"
