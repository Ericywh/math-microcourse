* 第1章·第1节：使用统一的真实NJ/PA最低工资数据
* 数据说明：https://ditraglia.com/erm/ps4-q3-minwage.html
* 文件需可联网访问；也可先下载到本地再修改use路径
use "https://ditraglia.com/data/minwage.dta", clear

* 两轮均有工资与就业数据的餐厅；保留本课所需非缺失项
keep if sample == 1
keep if !missing(state, fte, fte2)

* state=1表示新泽西州，state=0表示宾夕法尼亚州
* fte是政策前全职等价就业；fte2是政策后
generate double d_fte = fte2 - fte

* 查看两州两轮样本均值与各自变化
tabstat fte fte2 d_fte, by(state) stat(n mean)

* 两期DID等价的变化量回归，state系数就是DID点估计
regress d_fte state

* 警告：政策仅在两个州之间变化；上述常规OLS标准误
* 不应解释为可靠的州级政策冲击显著性推断。
