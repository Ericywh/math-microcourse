import pandas as pd
import statsmodels.formula.api as smf

# 与Stata相同的Card-Krueger NJ/PA数据教学整理版
url = "https://ditraglia.com/data/minwage.dta"
df = pd.read_stata(url, convert_categoricals=False)

# 统一样本定义，确保前后FTE均不缺失
df = df.loc[df["sample"] == 1].copy()
df = df.dropna(subset=["state", "fte", "fte2"])

# state=1代表NJ处理组；0代表PA对照组
df["d_fte"] = df["fte2"] - df["fte"]

# 两州就业前后和就业变化均值
means = df.groupby("state")[["fte", "fte2", "d_fte"]].mean()
print(means)

# 手工组间平均变化差异
did = means.loc[1, "d_fte"] - means.loc[0, "d_fte"]
print("DID估计值：", did)

# 用变化量OLS验证点估计，不将默认标准误作为可靠州级推断
model = smf.ols("d_fte ~ state", data=df).fit()
print("回归DID系数：", model.params["state"])
