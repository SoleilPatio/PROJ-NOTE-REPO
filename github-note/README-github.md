# 用 PAT（Personal Access Token） 當 Password
[github->setting->developer settings->Personal access tokens->Fine-grained token(建議)]()
    需要 Contents: Read and write（內容讀寫）
    Username 照舊/Password 使用產生的Token取代原來的密碼,可以設定期限

[git 預先設定]()
# 1) 先把 helper 全部清掉（避免 store 一直黏著錯的）
git config --global --unset-all credential.helper

# 2) 如果你之前用 store，刪掉它存的憑證檔（安全起見）
rm -f ~/.git-credentials

# 3) 改用 cache（比較安全，不會永久寫死）
檢查狀態: git config --show-origin --get credential.helper
Opt1 重開機消失: git config --global credential.helper cache
Opt2 重開機存在: git config --global credential.helper store 