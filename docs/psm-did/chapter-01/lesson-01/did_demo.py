import pandas as pd
import statsmodels.formula.api as smf

url = "https://raw.githubusercontent.com/Cause-114/CityEdu-Eco/main/data/panel.csv"
df = pd.read_csv(url)
df = df[df["year"].isin([2013, 2014])].copy()
pilots = """
北京 天津 上海 长沙 株洲 湘潭 石家庄 大连 本溪 延边朝鲜族自治州
哈尔滨 大庆 南京 苏州 镇江 金华 芜湖 安庆 福州 厦门 泉州
南昌 上饶 青岛 淄博 威海 临沂 郑州 洛阳 武汉 广州 深圳
中山 成都 攀枝花 阿坝藏族羌族自治州 贵阳 银川 吴忠 阿拉尔
""".split()
df["treat"] = df["city_key"].isin(pilots).astype(int)
df["post"] = (df["year"] == 2014).astype(int)
df["did"] = df["treat"] * df["post"]
df = df.dropna(subset=["city_key", "wage"])
assert not df.duplicated(["city_key", "year"]).any()
n = df.groupby("city_key")["year"].transform("nunique")
df = df[n == 2].copy()
means = df.groupby(["treat", "post"])["wage"].mean()
print("两组两期工资均值：", means)
did = (means.loc[1, 1] - means.loc[1, 0]) - (means.loc[0, 1] - means.loc[0, 0])
print("DID估计值（元）：", did)
model = smf.ols("wage ~ treat * post", data=df).fit(
    cov_type="cluster", cov_kwds={"groups": df["city_key"]}
)
print("回归交互项系数：", model.params["treat:post"])
df.to_csv("中国城市_宽带中国DID教学数据.csv", index=False, encoding="utf-8-sig")
