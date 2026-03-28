#!/bin/bash

# エラーが発生したら停止
set -e

# 定義
CONF_DIR="$HOME/.config/line-edit"
BUILD_UTILS="build-utils.lisp"

echo "Starting setup..."

# 1. ~/.config/line-edit の作成
# -p フラグを使うことで、親ディレクトリ (~/.config) がなくても再帰的に作成し、
# 既に存在する場合もエラーになりません。
if [ ! -d "$CONF_DIR" ]; then
    echo "Creating directory: $CONF_DIR"
    mkdir -p "$CONF_DIR"
fi

# 2. 設定ファイルの配置
# 既存の設定を上書きしたくない場合は cp -n (no clobber) を使います。
if [ -f "default-config.lisp" ]; then
    cp -n "default-config.lisp" "$CONF_DIR/config.lisp"
    echo "Config file placed at $CONF_DIR/config.lisp"
else
    echo "Warning: default-config.lisp not found."
fi

# 3. build-utils.lisp の移動
if [ -f "$BUILD_UTILS" ]; then
    cp "$BUILD_UTILS" "$HOME/"
    echo "$BUILD_UTILS moved to $HOME/"
else
    echo "Error: $BUILD_UTILS not found in current directory."
    exit 1
fi

echo "Setup completed successfully."
