import pandas as pd

# 第1章·第1节 DID基础；数字为教学案例，非真实研究样本
df = pd.DataFrame({
    "treated": [1, 1, 0, 0],
    "post": [0, 1, 0, 1],
    "y": [20, 23, 22, 21]
})
means = df.groupby(["treated", "post"])["y"].mean().unstack()

# 计算处理组与对照组的前后变化
change_t = means.loc[1, 1] - means.loc[1, 0]
change_c = means.loc[0, 1] - means.loc[0, 0]
did = change_t - change_c
print(f"DID = {did:.1f}")  # DID = 4.0
# 每组每期仅一个人为设定值，不能据此进行统计显著性推断。
