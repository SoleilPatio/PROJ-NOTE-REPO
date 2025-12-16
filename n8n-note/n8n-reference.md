
# 從AI Agent取得參數(Agent 專用 helper function)
$fromAI(parameterName, defaultValue, type)
ex:
{{$fromAI('symbol', ``, 'string')}} 意思就是：
  把 AI 工具呼叫裡的 symbol 參數拿出來，當成一個字串使用。如果AI沒給 symbol，用預設空字串。
  用它你才能做到：
  python yourscript.py {{$fromAI("symbol")}}
  並成功接收到 LLM 提取的股票代號。