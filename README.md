# Typst Playground · Typst 草稿与片段练习场

日常使用 [Typst](https://typst.app) 过程中积累的模板、片段、测试与草稿合集。文件大多为独立可编译的小实验，按用途粗分为以下几类：

## 目录结构

| 目录 | 内容 |
|---|---|
| `templates/` | 个人笔记/讲义模板、`main`/`lib` 脚手架、模板变体 |
| `exam/` | 试卷排版：装订线、选择题自动排版、高考数学等 |
| `slides-beamer/` | Beamer 风格幻灯片、开题报告、paper 骨架 |
| `bibliography/` | 参考文献样式：GB/T 7714（gb2015）、enhance-bib、nocite 测试 |
| `graphics-drawing/` | CeTZ 画图与排版技巧：曲线、表格、间距、图片透明度等 |
| `language-notes/` | 语法与内容笔记：Typst 中文语法指南、日语文法、化学式、古文排版 |
| `docs-manuals/` | 手册类长文档：physica 手册（中英）、《一本（并不）严肃的Typst手册》 |
| `scratch/` | 未归类的临时实验、测试副本（`test`、`tmp`、`example` 等） |

## 说明

- 文件按原始文件名保留，仅按用途归入目录；`scratch/` 中的 `(1)`、`(2)` 等副本为编辑器产生的重复版本。
- 各文件独立性强，通常可直接 `typst compile <文件>` 单独编译（部分依赖本目录其他文件）。
- License: MIT
