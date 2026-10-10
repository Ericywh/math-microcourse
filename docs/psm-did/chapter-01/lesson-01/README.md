# 第1章·第1节｜DID的基本原理（中国政策案例·零基础重讲版）

2026-10-10根据用户明确要求对已经交付的全课程第1课重新讲解；正式已完成节数仍为1/10，其他9节均未授课。

- `index.html`：完整中文零基础课程，含政策来源、术语、潜在结果、手算DID、平行趋势、回归、国内政策限制、自测答案与双软件代码。
- `did_demo.do`：Stata 17+，读取中国城市年鉴整理版 `panel.csv`，将变量标签与0/1类别标签设置为中文，构造2014年首批试点及2013—2014的两期DID，导出本地中文标签 `.dta`。
- `did_demo.py`：Python/pandas/statsmodels，使用相同数据、政策城市映射、样本筛选、回归，输出本地CSV。

## 真实公开来源
政策：[2014年工信部、国家发展改革委首批名单](https://wap.miit.gov.cn/zwgk/zcwj/wjfb/gg/art/2020/art_4dab04091bea459e9cc45e0046be3fe9.html)。

数据：[CityEdu-Eco整理的中国城市年度统计面板CSV](https://github.com/Cause-114/CityEdu-Eco/blob/main/data/panel.csv)；[字段及口径说明](https://github.com/Cause-114/CityEdu-Eco/blob/main/data/DATA_NOTES.md)。

## 软件运行
Stata 17+：运行 `do did_demo.do`，需要网络能访问Github raw地址。Python：先执行 `pip install pandas statsmodels`，再运行 `python did_demo.py`。网络不通时先从原仓库下载 `panel.csv`，替换代码中的读入路径。

## 识别限制
2014年首批政策名单9—10月公布，2014年全年工资不是完整政策暴露后的结果。2015—2016年有新增政策城市，若延长窗口，必须处理分批实施；县级市、自治州、城市群须逐项核验与年鉴统计单位的对应关系。本节附代码尚未作Stata/Python两端实跑核验；不报告真实回归系数及p值。项目第三方数据的进一步再分发授权未核实，因此不把整套原始CSV上传到本仓库。保留了原作者仓库链接。
