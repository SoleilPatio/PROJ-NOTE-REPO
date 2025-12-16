# 在 Ubuntu 上安裝與執行 ComfyUI

這份文件說明如何在 Ubuntu 環境下安裝並執行 ComfyUI，作為 `README-comfy-ui.md` 中 Windows 版本的補充。

# [手動安裝步驟]
安裝目錄:
   * ComfyUI 的python 環境:  ~/PRJ/AI-Vision/ComfyUI/venv-ubuntu-3.12.3  (不要".",會隱藏)
   * ComfyUI 的程式碼:       ~/PRJ/AI-Vision/ComfyUI/ComfyUI

安裝步驟:
1.  **安裝 Python 並建立虛擬環境**
    *   首先，請確保您的系統已安裝 Python 3.10 或更新版本。
    *   安裝 `python3-venv` 套件（如果尚未安裝）：
        
        sudo apt update
        sudo apt install python3-venv

    *   建立一個虛擬環境 (例如，名為 `venv-ubuntu-3.12.3`):
        
        python3 -m venv venv-ubuntu-3.12.3

    *   啟用虛擬環境。之後的所有指令都應在此環境下執行：
        
        source venv-ubuntu-3.12.3/bin/activate

        *當您想退出虛擬環境時，可以執行 `deactivate` 指令。*

2.  **下載 ComfyUI**
    *   使用 `git` 複製 ComfyUI 的程式碼庫：
        git clone https://github.com/comfyanonymous/ComfyUI.git
        cd ComfyUI

3.  **安裝 PyTorch (NVIDIA GPU)**
    *   **重要前提**: 在安裝 PyTorch 之前，您必須先在 Ubuntu 系統上安裝好對應的 [NVIDIA 驅動程式](https://www.nvidia.com/Download/index.aspx) 和 [CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit-archive)。
    *   您可以從 [PyTorch 官網](https://pytorch.org/get-started/locally/) 根據您的 CUDA 版本獲取最新的安裝指令。
    *   例如，如果您的 CUDA 版本是 12.1，指令會是：
        pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

4.  **安裝 ComfyUI 的依賴套件**
    *   安裝 `requirements.txt` 中列出的所有 Python 套件：
        pip install -r requirements.txt

5.  **啟動 ComfyUI**
    *   執行 `main.py` 來啟動 Web UI：
        python3 main.py
    *   啟動後，在瀏覽器中開啟 `http://127.0.0.1:8188`。




# [快速啟動腳本 (launch.sh)]

您可以建立一個 `launch.sh` 檔案，方便一鍵啟動。

```bash
#!/bin/bash

# --- 設定 ---
# 1. 請將此路徑修改為您的 ComfyUI 資料夾實際所在位置
COMFYUI_DIR="/home/clouds/PRJ/PROJ-NOTE-REPO/comfy_ui-note/ComfyUI" # <-- 修改這裡

# 2. 虛擬環境資料夾的相對路徑
VENV_DIR="../.venv-ubuntu"

# --- 腳本 ---
# 切換到 ComfyUI 目錄
cd "$COMFYUI_DIR" || { echo "錯誤: 找不到 ComfyUI 目錄 '$COMFYUI_DIR'"; exit 1; }

# 啟用 Python 虛擬環境
source "$VENV_DIR/bin/activate" || { echo "錯誤: 啟用虛擬環境失敗"; exit 1; }

# 在背景執行 ComfyUI
echo "正在啟動 ComfyUI..."
python3 main.py &
python3 main.py --cpu &  #(no gpu)

# 等待幾秒鐘讓伺服器完全啟動
sleep 5

# 使用 xdg-open 在預設瀏覽器中開啟網址
echo "在瀏覽器中開啟 http://127.0.0.1:8188"
xdg-open http://127.0.0.1:8188

echo "ComfyUI 正在背景執行。"
```

**如何使用:**
1.  將上面的腳本內容儲存為 `launch.sh` 檔案，放在您喜歡的位置。
2.  給予該檔案執行權限: `chmod +x launch.sh`。
3.  執行腳本: `./launch.sh`。

# [外掛 (Plugin)]

安裝外掛的步驟在所有作業系統上都是一樣的。

*   **ComfyUI Manager**: 強烈推薦安裝，方便管理其他外掛。
    ```bash
    # 進入 ComfyUI 的 custom_nodes 資料夾
    cd /path/to/your/ComfyUI/custom_nodes

    # 下載 Manager
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git
    ```
*   安裝後，重啟 ComfyUI 即可生效。
