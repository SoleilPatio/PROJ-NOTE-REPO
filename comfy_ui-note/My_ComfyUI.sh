#!/bin/bash

# --- 設定 ---
# 假設 ComfyUI 程式碼位於目前目錄下的 "ComfyUI" 資料夾
COMFYUI_DIR=~/PRJ/AI-Vision/ComfyUI/ComfyUI

# 假設虛擬環境位於目前目錄下的 "venv-ubuntu-3.12.3" 資料夾
VENV_DIR=~/PRJ/AI-Vision/ComfyUI/venv-ubuntu-3.12.3

# --- 腳本 ---
# 檢查 ComfyUI 目錄是否存在
if [ ! -d "$COMFYUI_DIR" ]; then
    echo "錯誤: 找不到 ComfyUI 目錄 '$COMFYUI_DIR'"
    echo "請確認 ComfyUI 已被 clone 到該位置。"
    exit 1
fi

# 檢查虛擬環境是否存在
if [ ! -d "$VENV_DIR" ]; then
    echo "錯誤: 找不到虛擬環境目錄 '$VENV_DIR'"
    echo "請確認虛擬環境已建立。"
    exit 1
fi

# 切換到 ComfyUI 目錄
cd "$COMFYUI_DIR" || exit

# 啟用 Python 虛擬環境
echo "啟用虛擬環境: $VENV_DIR/bin/activate"
source "$VENV_DIR/bin/activate" || { echo "錯誤: 啟用虛擬環境失敗"; exit 1; }

# 啟動 ComfyUI
# 您可以根據需求選擇是否要加上 --cpu 參數
echo "正在啟動 ComfyUI..."
python3 main.py --cpu

echo "ComfyUI 已關閉。"
