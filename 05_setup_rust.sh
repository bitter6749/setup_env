#!/bin/bash
# rustupのインストール (インタラクティブ入力をスキップするために -y を付与)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# パスを通す
source $HOME/.cargo/env

echo "Rustのインストールが完了しました。バージョン: $(rustc --version)"
