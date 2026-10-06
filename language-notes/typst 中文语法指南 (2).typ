这本书只粗略涉及例子，供读者在忘记写法时查阅

原理讲解和更详细的例子请看：
#link("https://github.com/typst-doc-cn/tutorial")[Typst 中文教程- by Myriad-Dreamin等人]

中文非官方交流群：793548390

\

文本

*overstriking 加粗*

_italic（斜体）_

= 一级标题
== 二级标题
============= 很多很多级标题

这样

换行

这样
不是
换行

这样也是换行，\
但是没有行间距

\

这是行内公式 $x=1$。

这是$ x+1=2 $
行间公式


//这是注释
/*这也是注释*/
/*
你觉得这是不是注释吧
*/

这样制造
#v(1cm)
垂直间隔#h(2em)水平间隔

\

#let a=1//let可以设置变量/函数
#a//注：#号在 Typst 中作为「解释模式」的定界符
//此处a输出1是因为#将a解释为1
//解释不清还请见谅，写的时候更希望你去读完中文教程再来看这篇

#pagebreak()//换页

#align(
  center,
  text(22pt)[文档名],
)//可以用这个做文章的标题

#set align(
  center//center中文为中心的意思
)

这是set(请简单粗暴的理解成设置)，可以设置一个全局的规则


#set align(
  left
)
  


#set text (font: "Microsoft YaHei")
修改字体

*中文粗体*

_中文斜体见高级语法章_
#set text(font: ("Calibri", "KaiTi"),lang: "zh", region: "cn")

分开设置中英文字体
Set *_Chinese_* and _*English*_ fonts separately



+ 有序的列表
+ 有序
  + 很有序
+ 就是这个意思

- 无序的列表
- 无序
  - 无序里头可以套无序
  + 也可以套有序
    - 层数疑似有点多了

插入图片
#image("Tetrapeptide_structural_formulae.png"/*插入图片的路径*/,width: 60%/*设置大小*/)

#pagebreak()

#align(center, text(24pt)[稍微进阶的语法])
// 以下例子的解释将十分简略


= 数学部分

$integral$ 积分号 $display(integral)$大小更合理的积分号

$ integral 1/x dif x "&"/*此处“”内文本*/ 
display(integral 1/x dif x) $//吐槽：其实区别不大

let的正常使用方法
#let dx=$dif x$
$ integral 1/x^2 dx $

$lim_(x->0)$ $display(lim_(x->0))$

#calc.pow(3,5) 计算3的五次方

= 显示部分

== 标题


#set heading(
  numbering: "1.a.i",
)
#show heading.where(level: 1): set align(center)
= 显示-标题
== 文本

\
如果你想要一长段的示例文本，请用
#lorem(/*这里填字数*/10)

#strong(
)[这样就加粗了很长一段文本，虽然楷体没有粗体 XD\
换行也不会变 #lorem(40)]

#emph[斜体 #lorem(40)]、

#set text(
  size: 14pt,//设置字体大小
  black//设置颜色
)

#text(size: 12pt, rgb("7f2096"))[紫色的小字]

黑色的大字


#rect()[这是个框]
#box(stroke: black, inset: 0.4em)[这也是框]
#block(stroke: black, inset: 0.4em)[这还是框]
#quote()[这是引用]
#quote(block: true)[block的使用让quote位置更加合理]


#pagebreak()

#set page(
  fill: rgb("22232c"),
  margin: (top: 60pt, bottom: 20pt),
  header: [
    #set text(8pt,rgb("cdcdcd"))],
    numbering:"1 of 1"  
)

#set text(
  fill: rgb("ede8ef"),
  size: 15pt
)

#set par(
  leading: 0.6em,
  first-line-indent: 2em,
)

== 背景

这里直接放我常用的背景了

== 排版
这里自己放标题（其实是我不想搞乱序号）
#grid(
  columns: (1fr,1fr),
  align(center)[
    作者\
    作者信息\
    #link("链接")
  ],
  align(center)[
    另一个作者\
    作者信息\
    #link("还是链接")
  ]
)
文本分两栏：
#columns(2)[#lorem(270)]//此处因为还需要用到pagebreak，故不在此使用#show: rest => columns(2, rest) 



#pagebreak(to:"even")

#align(center, text(24pt)[高级语法])
#let skew(angle, vscale: 1, body) = {
  let (a, b, c, d) = (1, vscale * calc.tan(angle), 0, vscale)
  let E = (a + d) / 2
  let F = (a - d) / 2
  let G = (b + c) / 2
  let H = (c - b) / 2
  let Q = calc.sqrt(E * E + H * H)
  let R = calc.sqrt(F * F + G * G)
  let sx = Q + R
  let sy = Q - R
  let a1 = calc.atan2(F, G)
  let a2 = calc.atan2(E, H)
  let theta = (a2 - a1) / 2
  let phi = (a2 + a1) / 2
  
  set rotate(origin: bottom + center)
  set scale(origin: bottom + center)
  
  rotate(phi, scale(x: sx * 100%, y: sy * 100%, rotate(theta, body)))
}

#let fake-italic(body) = skew(-12deg, body)

#fake-italic[是中文斜体，是大佬#link("https://github.com/Enivex")[Enivex]制作 (hack) 的]


#align(center, text(24pt)[抽象语法])
//其实是抽象的语法


#for 间 in "东西" [鱼戏莲叶#间#parbreak()]
#"南北".clusters().map(间=>[鱼戏莲叶#间]).join(parbreak())