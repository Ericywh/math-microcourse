# 研究学习中心 · Research Learning Hub

这是五门长期课程的**公开展示仓库**，所有公开课文均保留独立目录，并通过统一入口导航。

**网站首页**：https://ericywh.github.io/math-microcourse/  
**五门课程索引**：https://ericywh.github.io/math-microcourse/study/#courses

## 五门公开课程

| 课程 | 目录 | 说明 |
|---|---|---|
| 每日10分钟数学微课程 | `docs/math/` | 六章73节，按实际交付标记进度 |
| 计量经济学120天系统课程 | `docs/econometrics/` | 十章120节，Stata与Python |
| 统计与实证研究前沿日报 | `docs/frontier/` | 研究前沿与文献分析 |
| CSSCI实证论文复现精读库 | `docs/cssci/` | 公开书目与复现方法索引 |
| 每日经济学经典精读 | `docs/economic-classics/` | 以《国富论》重新开始的新序列 |

## 网站结构

- `docs/index.html`：公开学习中心首页
- `docs/study/index.html`：五门课程的卡片式分类与检索入口
- `docs/assets/hub.css`、`hub.js`：共享的学习中心样式及进度展示逻辑
- 各课程目录分别提供独立的课程主页、已交付全文、章节规划和检索功能

## 发布规则

GitHub Pages：`Settings → Pages → Deploy from a branch → main → /docs`。

课程的“已归档”状态只依据真实交付并存在于此仓库的完整网页，不得按照日历自动推测进度。私人主档案仓库 `research-learning-archive` 作为独立备份保留，不直接镜像或推送其全部 Git 历史。后续只发布经核查、明确可公开的文档；勿上传私人笔记、付费全文或受限数据。

## 关于仓库名称

当前 GitHub 仓库的技术名称仍为 `math-microcourse`，以维持既有 Pages 地址稳定。网站展示名称已统一改为**研究学习中心**。如果在 GitHub 设置中将仓库改名为 `research-learning-hub`，公开 Pages 项目路径将对应变为 `/research-learning-hub/`，原有项目 Pages URL 不会自动保持。
