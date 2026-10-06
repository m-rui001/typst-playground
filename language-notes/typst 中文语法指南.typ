
#align(
  center, text(22pt)[typst中文语法指南],
)

= 第一部分
== 第一章：基本语法
=== 最基础的语法
这一章主要包含在制作文档的时候会用到的简单语法。

文字输入就直接输入文字，大标题用 #align，文章里的分级标题用数量不同的 = 号确定，
= 比如一个等号就是一级标题
== 这样就是2级标题
====== 这是6级标题（不会真的有人用标题用这么细吧）


两个星号中间夹的就是*粗体*，下划线夹着的就是_italic（斜体）_ （现在中文现在还不支持斜体，伪斜体见第三章）。
// 注释
/*
或者这样，也是注释
*/


=== 写公式
这是 $y=x^2$ 行内公式。

这是块级数学公式（我比较喜欢叫行间公式）
$ y_1&=x_1\
&=x_1^2/x_1
"引号中间的内容会被看作是文本而不是公式"\
&="\号是换行，&号用作对齐"
// 和 /*依旧是注释*/
$

#set heading(numbering: "1.I. ")
= 这是个没用的分段
== 第二章：一些进阶
+ 这是列表的第一行
+ 第二行
  + 这里就是2.1
  - 当然，你也可以用创建一个无序的列表
  - 就像这样 
+ 第三行


#set quote(block: true)

#quote(attribution: [书名])[引用的内容]

#pagebreak() //换页


#quote(attribution: [https://sitandr.github.io/typst-examples-book])[
Typst中有几个绝对长度单位:
#set rect(height: 1em)
#table(//table是表格
  columns: 2,
  [像素点个数], rect(width: 72pt),
  [毫米], rect(width: 25.4mm),
  [厘米], rect(width: 2.54cm),
  [英寸], rect(width: 1in),
  [相对于字体大小], rect(width: 6.5em)
)
`1 em` 就是现在的字体大小。]

#v(2em)
设置一些垂直间距
#h(3em)
设置一些水平间距
#v(2em)
在写公式的时候往往会遇到公式太小看不清的问题 $x/(x+1)^2$ 这个时候就需要使用 $display(x/(x+1)^2)$ 来解决问题。
当然，你可能会在输入公式的时候发现输入_dx_需要打_d x_，而且这里 $x d x$ 会连在一起，所以，你可以
#let dx=$#h(0.3em)d x$
$ display(integral^1_0 x/(x^3+2) dx) $


#pagebreak()


//以下区域还未开发
#import "@preview/cetz:0.2.0"
#import "@preview/showybox:2.0.1": showybox

#set page(
  fill: rgb("22232c"),
  margin: (top: 60pt, bottom: 20pt),
  header: [
    #set text(8pt,rgb("cdcdcd"))],
    numbering: "1 of 1"  
)

#set text(
  fill: rgb("efefef"),
  size: 14pt
)

#set par(
  leading: 0.6em,
  first-line-indent: 2em,
)


#show heading.where(level: 1): set align(center)
//以下是自定义变量区域
#let dx=$#h(0.2em)d x$

