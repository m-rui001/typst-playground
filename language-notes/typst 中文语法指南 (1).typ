你必须知道的最最最基础的东西：

文本

*overstriking 加粗*

_italic（斜体）_

这是行内公式 $x=1$。

这是$ x+1=2 $
行间公式

= 一级标题
== 二级标题
============= 很多很多级标题
//这是注释
/*这也是注释*/
/*
你觉得这是不是注释吧
*/
#v(1em)//这样制造垂直间隔
awa#h(2em)/*这样制造水平间隔*/uwu

这样

换行

这样
不是
换行

这样也是换行，\
但是没有行间距

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
回到左边
  
#set text(
  size: 14pt,//设置字体大小
  rgb("3f007f")//设置颜色
)

#text(black)[黑色的]
紫色的

#set text(
  black
)

#set text (font: "Microsoft YaHei")
修改字体

*中文粗体*
_中文斜体见下章_
#set text(font: ("Calibri","KaiTi"),lang: "zh",region: "cn")

分开设置中英文字体
Set *Chinese* and _English_ fonts separately


#pagebreak()//换页

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
#image("Tetrapeptide_structural_formulae.png"/*插入图片*/,width: 60%/*设置大小*/)

