# 第1章·第2节｜PSM的基本原理

全课程第2/10课，2026-10-11正式交付。采用2014年首批“宽带中国”示范城市作为处理组，使用中国城市统计年鉴二次整理的公开面板，仅取政策前2013年协变量估计倾向得分。

- `index.html`：完整中文零基础课文、3个公式、数值示例、方法限制、误区与恰好两题自测。
- `psm_intro.do`：Stata 17+，使用官方`logit`和`predict`，含中文变量/类别标签；保存本地倾向得分.dta。
- `psm_intro.py`：Python 3.9+，`pip install numpy pandas statsmodels`，同Logit模型、样本筛选及政策城市映射；保存本地CSV。

政策首批公告：https://wap.miit.gov.cn/zwgk/zcwj/wjfb/gg/art/2020/art_4dab04091bea459e9cc45e0046be3fe9.html

数据源：https://github.com/Cause-114/CityEdu-Eco/blob/main/data/panel.csv
中文口径说明：https://github.com/Cause-114/CityEdu-Eco/blob/main/data/DATA_NOTES.md

匹配算法下文另学，本课只计算倾向得分。不上传第三方整套年鉴数据。2014批次包括城市群、自治州、县级市，映射需完善；没有在Stata/Python两端实际运行核验，勿把预测概率当政策因果估计。
