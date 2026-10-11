import numpy as np
import pandas as pd
import statsmodels.formula.api as smf

# 与Stata采用同一个公开CSV、同一政策前2013年
url = "https://raw.githubusercontent.com/Cause-114/CityEdu-Eco/main/data/panel.csv"
df = pd.read_csv(url)
df = df.loc[df["year"] == 2013].copy()
assert not df["city_key"].duplicated().any()

# 官方首批名单的教学级城市映射，县级/城市群口径须复核
pilots = """
北京 天津 上海 长沙 株洲 湘潭 石家庄 大连 本溪
延边朝鲜族自治州 哈尔滨 大庆 南京 苏州 镇江 金华
芜湖 安庆 福州 厦门 泉州 南昌 上饶 青岛 淄博
威海 临沂 郑州 洛阳 武汉 广州 深圳 中山 成都
攀枝花 阿坝藏族羌族自治州 贵阳 银川 吴忠 阿拉尔
""".split()
df["treat"] = df["city_key"].isin(pilots).astype(int)
cols = ["gdp", "population", "tertiary_pct", "wage"]
df = df.dropna(subset=cols).copy()
df = df.loc[(df[["gdp", "population", "wage"]] > 0).all(axis=1)].copy()
df["ln_gdp"] = np.log(df["gdp"])
df["ln_population"] = np.log(df["population"])
df["ln_wage"] = np.log(df["wage"])

# Logit预测被纳入2014首批试点的条件概率
formula = "treat ~ ln_gdp + ln_population + tertiary_pct + ln_wage"
model = smf.logit(formula, data=df).fit(disp=False)
df["pscore"] = model.predict(df)
print(df.groupby("treat")["pscore"].agg(["count", "min", "mean", "max"]))
df.to_csv("中国城市_2013年倾向得分教学样本.csv",
          index=False, encoding="utf-8-sig")
# 此处没有匹配后政策ATT，也没有因果估计
