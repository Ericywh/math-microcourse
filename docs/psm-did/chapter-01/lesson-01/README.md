# 第1章·第1节｜DID的基本原理

全课程第1课 / 共10课。课程正文为本目录 `index.html`，与Notion私人课程档案对应。

## 文件
- `index.html`：适用于手机/电脑的完整中文课程页面（含公式、SVG概念图、习题）
- `did_demo.do`：Stata 2×2教学演算
- `did_demo.py`：Python/pandas同一教学演算

## 运行环境
Stata：支持 `input`、`summarize` 和 `scalar` 的常见版本。
Python：3.9+，`pip install pandas`，运行 `python did_demo.py`。
两段示例预计输出 DID=4，因每个单元仅一个假定数值，不用于统计推断；课程交付时未运行Stata核验。

## 后续贯穿数据
Card, D. & Krueger, A. B. (1994). NJ/PA 1992 fast-food minimum-wage survey.
原始数据： https://eml.berkeley.edu/~card/data_sets/njmin.zip
解压后使用 `public.dat` 与 `codebook`。
MIT教学档案：https://economics.mit.edu/people/faculty/josh-angrist/mhe-data-archive

**注意**：作者原始调查含410家餐馆，但两波具体可用配对样本数应通过缺失清洗确定，不应直接当作410家完整配对。政策仅两个州，不能由此将州级聚类标准误视作可靠。仅有一期政策前观察，不能直接检验政策前平行趋势。
