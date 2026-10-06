#import "笔记模板.typ": *

// 设置基础样式
#show: body => project(
  "模板功能展示",
  "Template Features",
  text_size: 13pt,
  body,
)

// 显示目录
#outline(title: "目录")

= 基本功能演示
== 文本与排版
这是一个基本段落，展示*加粗*和_斜体_文本效果。

常用格式：
- #text(fill: blue)[彩色文本]
- #text(font: "Consolas")[特殊字体]
- #text(size: 15pt)[不同大小]
- #underline[下划线文本]

== 数学公式
=== 行内公式
简单公式：$E = m c^2$，$x^2 + y^2 = r^2$

=== 独立公式
贝叶斯公式：
$ P(A|B) = (P(B|A)P(A))/P(B) $

牛顿二定律：
$ F = m a $

= 高级功能演示
== 定理环境<theorem-example>
#theorem[
  若函数 $f(x)$ 在区间 $[a,b]$ 上连续，在 $(a,b)$ 内可导，且 $f(a)=f(b)$，
  则至少存在一点 $xi in (a,b)$，使得 $f'(xi)=0$。
]

#lemma[
  设 $n$ 是自然数，如果 $n^2$ 是偶数，那么 $n$ 是偶数。
]

#proof[
  反证法。假设 $n$ 是奇数，则存在整数 $k$ 使得 $n=2k+1$。
  因此 $n^2=(2k+1)^2=4k^2+4k+1=2(2k^2+2k)+1$。
  所以 $n^2$ 是奇数，矛盾。因此假设不成立，$n$ 必是偶数。
]

#definition[
  设 $f(x)$ 在 $x_0$ 处可导，如果 $f'(x_0) = 0$，则称 $x_0$ 是 $f(x)$ 的驻点。
]

== 链接与引用
- 外部链接：#link("https://typst.app/")[Typst官网]
- 内部引用：见上方#link(<theorem-example>)[定理示例]

== 表格效果
#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: horizon,
  [*功能*], [*说明*], [*示例*],
  [标题], [四级标题], [见上方],
  [公式], [支持数学公式], [$E=m c^2$],
  [定理], [定理环境], [见定理示例],
)

= 其他特性
== 列表功能
=== 无序列表
- 第一级
  - 第二级
    - 第三级
  - 返回二级
- 返回一级

=== 有序列表
1. 第一步
2. 第二步
   a. 子步骤 A
   b. 子步骤 B
3. 第三步


= 样式定制
== 颜色主题
- 主色：#text(fill: rgb("#2b4692"))[示例文本]
- 次色：#text(fill: rgb("#3f6db5"))[示例文本]
- 强调：#text(fill: rgb("#003617"))[示例文本]

== 字体设置
- 默认字体：示例文本
- #text(font: "Calibri")[Calibri 字体]
- #text(font: "Kaiti")[楷体示例]
