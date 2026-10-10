# 第1章·第1节｜DID的基本原理

全课程第1课 / 共10课。2026-10-10已交付。课程正文为 `index.html`；本次整理与聊天授课统一采用教学构造的2×2案例（NJ 18→20、PA 15→14，DID=3），而代码采用真实NJ/PA快餐店数据；二者不可混为真实估计结果。

- `index.html`：中文完整课程（公式、示意图、自测和参考答案）。
- `did_demo.do`：Stata对真实教学整理版数据的DID变化量估计。
- `did_demo.py`：Python对同一数据、同一样本筛选的DID变化量估计。

## 运行
Stata：运行 `do did_demo.do`，或在Stata中打开并执行。
Python：`pip install pandas statsmodels`，运行 `python did_demo.py`。
脚本需要网络连接以读取 https://ditraglia.com/data/minwage.dta 。若无法联网，请先下载该数据至本地并替换读取路径。数据变量说明：https://ditraglia.com/erm/ps4-q3-minwage.html。

## 解释边界
本课未在两个软件中实际验证输出，不能把教学构造案例的DID=3当作真实政策估计。仅两个州且只有一期处理前调查，不能直接检验政策前动态平行趋势，常规餐厅层面标准误也不提供可靠的州级政策推断。原始数据：https://davidcard.berkeley.edu/data_sets/njmin.zip。
