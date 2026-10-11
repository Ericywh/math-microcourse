clear all
set more off
* 只使用2014年试点决定前的2013年中国城市数据
import delimited "https://raw.githubusercontent.com/Cause-114/CityEdu-Eco/main/data/panel.csv", clear varnames(1) encoding("UTF-8")
keep if year == 2013
isid city_key

* 按2014首批试点官方名单建立教学用处理组
* 长株潭对应三城；自治州/县级市映射仍须审核
gen byte treat = 0
local pilots "北京 天津 上海 长沙 株洲 湘潭 石家庄 大连 本溪 延边朝鲜族自治州 哈尔滨 大庆 南京 苏州 镇江 金华 芜湖 安庆 福州 厦门 泉州 南昌 上饶 青岛 淄博 威海 临沂 郑州 洛阳 武汉 广州 深圳 中山 成都 攀枝花 阿坝藏族羌族自治州 贵阳 银川 吴忠 阿拉尔"
foreach c of local pilots {
    replace treat = 1 if city_key == "`c'"
}
label data "2013年中国城市政策倾向得分教学样本"
label variable city_key "城市名称"
label variable treat "2014年是否入选首批宽带示范城市"
label variable gdp "2013年GDP（亿元）"
label variable population "2013年人口（百万人）"
label variable wage "2013年在岗职工平均工资（元）"
label variable tertiary_pct "2013年第三产业比重（%）"
label define group_zh 0 "非首批试点" 1 "首批试点"
label values treat group_zh

* 缺失和零值不能用于自然对数（ln）
keep if !missing(gdp, population, tertiary_pct, wage)
keep if gdp > 0 & population > 0 & wage > 0
gen double ln_gdp = ln(gdp)
gen double ln_population = ln(population)
gen double ln_wage = ln(wage)
label variable ln_gdp "2013年GDP自然对数"
label variable ln_population "2013年人口自然对数"
label variable ln_wage "2013年平均工资自然对数"

* Logit：估计试点概率，尚未匹配、尚未估计政策效果
logit treat ln_gdp ln_population tertiary_pct ln_wage
predict double pscore if e(sample), pr
label variable pscore "倾向得分（预测试点概率）"
tabulate treat
bysort treat: summarize pscore
save "中国城市_2013年倾向得分教学样本.dta", replace
