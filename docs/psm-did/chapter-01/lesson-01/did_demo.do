clear all
set more off
* 可直接从GitHub公开数据源读入；若联网失败，先下载panel.csv
import delimited "https://raw.githubusercontent.com/Cause-114/CityEdu-Eco/main/data/panel.csv", clear varnames(1) encoding("UTF-8")
keep if inlist(year, 2013, 2014)
label data "中国城市宽带中国示范政策教学数据"
label variable city_key "城市名称"
label variable year "统计年份"
label variable wage "在岗职工平均工资（元）"
label variable gdp "地区生产总值（亿元）"
label variable population "人口（百万人）"
label variable tertiary_pct "第三产业占GDP比重（%）"
* 根据2014年首批公告设置试点城市；长株潭按三市映射；昆山归入苏州口径
gen byte treat = 0
local pilots "北京 天津 上海 长沙 株洲 湘潭 石家庄 大连 本溪 延边朝鲜族自治州 哈尔滨 大庆 南京 苏州 镇江 金华 芜湖 安庆 福州 厦门 泉州 南昌 上饶 青岛 淄博 威海 临沂 郑州 洛阳 武汉 广州 深圳 中山 成都 攀枝花 阿坝藏族羌族自治州 贵阳 银川 吴忠 阿拉尔"
foreach c of local pilots {
    replace treat = 1 if city_key == "`c'"
}
gen byte post = (year == 2014)
label variable treat "是否属于2014年首批示范城市"
label variable post "是否属于政策后年份"
label define treat_lab 0 "非首批试点" 1 "首批试点"
label define post_lab 0 "2013年政策前" 1 "2014年政策后"
label values treat treat_lab
label values post post_lab
gen byte did = treat * post
label variable did "首批试点与政策后交互项"
drop if missing(city_key, wage)
isid city_key year
egen cityid = group(city_key), label
label variable cityid "城市编号（对应中文城市名）"
bysort cityid: keep if _N == 2
table treat post, statistic(mean wage)
regress wage i.treat##i.post, vce(cluster cityid)
save "中国城市_宽带中国DID教学数据.dta", replace
