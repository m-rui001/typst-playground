#import "@preview/showybox:2.0.1": showybox
// 本意想做一个代码+执行效果的, 但是结果却是repr这种串表示。
#let eg(myCode, 
  init: ``, myMode: "markup",
  visible: (raw: true, content: true, repr: true)
) = {
  set block(width: 100%, inset:8pt)
  set raw(lang: "typst")
  let myContent = eval(init.text + myCode.text, mode:myMode)
  grid(columns:(2.5fr, 1fr), 
    align(horizon, showybox(
      frame: (
        border-color: rgb("#684268"),
        title-color: rgb("#cc99cc")
      ), 
      title: "Code & content", 
      if visible.raw {myCode}, 
      if visible.content {myContent}
    )),
    align(horizon, box(
      if visible.repr {text(size:5.4pt, raw(repr(myContent)))}
    ))
  )
}
#set text(
  font: ("Arial", "SimHei", "LXGW WenKai GB"),
  size: 12pt
)

// #set raw(theme)
#show raw: it => box(outset: 3pt, fill: luma(240), it)

#align(center, text(24pt, 
  font: "Source Han Sans SC")[
  Typst使用笔记
])

= 标记模式
Typst 是一个标记型语言. 其代码的正文即处于标记 (markup) 模式. 
#eg(`Hello *world*!`)

本文的例子模式分为三个部分, 即代码, 内容和结构. 

= 数学模式
相比于其他排版语言来说, Typst的数学模式可谓是独树一帜. 
#eg(`$ T=((diff S)/(diff U))^(-1)_(W=0,"rev") $`)
Typst数学模式的特别, 一方面是缘于名字不同, 一些符号具有特殊写法, 比如 `$diff$` $diff$ 在LaTeX里面通常写作 `$\partial$`, 另一方面则是以下这些特征.
- 行间公式的特别写法, 即 `$ ... $` 这种括号内侧的空格;
- 分式直接用 `/`, 类似于MathJax和KaTeX中的 `\over` 的位置;
- 括号自动拉伸, 省却 `\left( ... \right)` 的困扰;
- 不需要特别声明文本环境, 只有单字母单元才是符号, 字符串一律视为文本;
- 极大幅度减少反斜杠的使用.

= Typst的编程
首先我们非常重视 `#` 和 `[]`, 它们在指令模式和标记模式之间切换. 
== 赋值与调用
之前介绍的基本上都是纯粹的输出语句, 只不过有的记号直接原样输出, 有的则激活了特殊的格式.
我们可以键入 `#let x=5` 来用字母表示数, 然后再在正文中用 `#x` 把这个字母所表示的数表达出来. 而定义函数的方式和定义数的方式几乎完全相同. 
#eg(`#let e=2.718
用字母e表示了数#e`)
#eg(`#let sqr(x)=x*x
23的平方是#sqr(23).`)
// 函数的定义不需要涉及任何具体的数, 只需要用一个傀儡变元来把对应关系(一系列数对)描述好. 而真正使用的时候在指令模式下用函数名和一个具体的值, 告诉是什么对应系中, 这个值所对的结果. 

== 小修小补
我们有二项式定理
#eg(`$ (a+b)^n=sum_(k=0)^n C_n^k a^(n-k) b^k $`)
但觉得幂之间的乘法留的空隙太小了, 没法辨别角标与底的从属关系, 以至于糊在一起, 怎么办? 
简单! 我们都知道这本质上只是没有写乘号的乘法. 那么在代码中仍写成乘号, 但在编译中把乘号表示为细空格, 这样就行了. 
#eg(`#show math.ast: math.thin
$ (a+b)^n=sum_(k=0)^n C_n^k*a^(n-k)*b^k $`)
同样, 如果想把乘号改成小学学过的那种 $times$, 那么就使用 `#show math.ast: math.times`. 

== 多文件
我们都知道, 数学公式中的数学常数要使用正立的, 而物理常数则仍然使用斜体. 
事实上在我的量子力学学习中就经常遇到 `$upright(e)^(upright(i) k x)$`这样的式子. 那么我会非常喜欢这样做: 
#eg(`#let ee = $upright(e)$
#let ii = $upright(i)$
#let ei(expr) = $ee^(ii expr)$
$ ei(k x) $`)
开一个新文件比如相同文件夹里面的 `My_Snippets.typ`, 
并且把这前三行移到新文件里去, 然后在我的代码中开头写着
 `#import "My_Snippets/typ": *`.

== 程序执行的流程
=== 顺序与循环
顺序结构其实就是我们已经知道的部分, 但并不止步于此. 内容块 `[]` 理所当然的是一种顺序结构; 而在前面, 为了让 $n-k$ 全部写在 $a$ 的角标之上, 我们增加了一层圆括号. 这是一种打包, 在数据结构上最终转化成了元组 `([n],[-],[k])`, 而在执行的层面上当然是作为一种顺序结构而存在的. 除此之外, 指令模式的多条语句可以使用花括号括起来, 之间用分号来分隔, 完成一个打包.
#eg(`#{let x = 2226; let x = x + 174; x}`)
观察这个输出结果的结构, 注意它和前面介绍赋值语句时的结果的区别: 少了很多空内容块, 也少了许多令人作恼的空格. 但是啊, 这种花括号必须得只输出一个东西, 而这个东西是各语句的输出结果相连 (join) 的结果. 比如说整数不能相连, 那么只能输出一个整数, 多了不行. 多结果的输出要考虑选用元组, 原文, 字符串或者内容块作为一个整体.
#eg(````#{let x = "Confucius said: "; let y = ```Chinese There are something I can learn from among the pedestrians. ```; x; y}````)
其中元组不宜直接输出, 它透过 `#` 算符从指令模式进入标记模式后就变成了原文. 而字符串也自动变成了内容块.

打包可以帮助代码习惯更加整洁. 其实很多时候为了标红一个公式中的各处字符, 因为KaTeX和MathJax实现起来的微妙差别, 而导致bug无处不在, 以至于不得不使用诸如 `$E={\color{red}{m}}c^2$` 这样的内外双括号来尽可能的防止歧义. 至于说我们都开始用符号替换了, 那更是要小心整洁为上. 谁知道bug会从哪里冒出来呢?

#eg(`#{show math.ast: math.thin; "电流密度: "; $arrow(dotless.j)=n*z*e*arrow(v)$}.
#{show math.ast: math.times; "常见常数: "; $N_"A "=6.02*10^23, h=6.67*10^(-34), F=9.65*10^4$}.`)

顺序结构里面套顺序结构只是打包, 当然会不由得考虑输出结果和作用域的问题. 但除此之外我们还要实现程序执行顺序的调整. `while` 循环可以做到. 它的基本写法是 `while condition code`, 但是理所当然的需要在 while 内外各套一个括号才能解决问题. 
#eg(`#{let n=0; let m=1; let t=0; while n < 200 {(n,);t=n;n+=m;m=t}}`)

和前面的赋值运算语句一样, 这所有的编程当然都是不可逆的. 只能顺向编译出运算结果的内容, 和知道这个内容的结构. 用得到的结构只是能复现出内容, 不能反向猜出原来是个什么运算过程.

=== 分支与遍历
`while` 虽然足以随意调整程序执行顺序, 但是其实繁琐的要死. 因为上一个很简洁的`goto` 已经死了, 太简洁以至于程序执行飞来飞去难以追踪调试. 

前面说了 `while` 循环独木难支, 必须强依赖于内外两个顺序结构. 外层的顺序结构是在进入判断之前做一个奠基, 比如在定义变量和赋予初值, 而内层的顺序结构则是给参与判断的变量做一个迭代, 让表达式能由真变假. 

一个很直接的整合就是 `for...in` 循环. 让一个变量依序取遍所给结构体里的所有元素, 那当然就整合了最平凡的那些奠基, 迭代和边界判断. 
#eg(`#for 间 in "东西南北" [鱼戏莲叶#间, ]`)

不过比较遗憾的是 `for` 循环的结果又是内容套元组套内容, 就像前面的指标 `n-k` 一样. 
但换句话说, 它也给公式动画提供了一点方便, 因为至少分离了不变的和变易的部分.

除此之外 `if ... else ...` 分支也是一种 `while` 循环的功能整合. 不要笑, 只需要在奠基处立帜, 迭代处易帜就行. 实际上 `for ... if ... ` 的连用是非常典型的筛选过程. 

#eg(`#for i in "Metal Organic Framework"{
  if i == lower(i) {i} else {
    text(fill: rgb(204,153,204), i)
}}`)

这相当于

```typst 
#{let iter = 0
  let str = "Metal Organic Framework"
  while iter != str.len() {
    let i = str.at(iter)
    let then-flag = true
    let else-flag = true
    while i == lower(i) and then-flag{
      i
      then-flag = false
    }
    while not i == lower(i) and then-flag and else-flag {
      text(fill: rgb(204,153,204), i)
      else-flag = false
    }
    iter += 1
}}
```


== 自编译
最后, 让我们套娃. 使用 `eval()` 把string代码转化为content内容; 使用 `repr()` 把content内容转化为string表示, 相当于反编译, 只不过一颗语法糖都吃不到. 

因此我们直接使用以下代码, 来把一个字符串按照代码的形式列出来, 然后看它编译出来的结果以及它的结构. 没有什么比它更适合用来调试一个表达式, 特别是如果想从中摘取一个括号中的内容的话. 

Typst 对引号的支持并不好, 只能用双引号表示字符串, 不能整三引号等花哨玩意. 但原始文本却能无限嵌套: 除了要用``来表示空原文之外, 其他所谓的三引号四引号五引号啥的都能推下去, 不过要注意外引号的层数比内引号多; 此外, 字符串和原文可以互相转换, 通过 `raw("x")` 和 ``` `x`.text ```. 

#eg(```#let eg(myCode) = {
  set block(width: 100%, inset:8pt)
  let myContent = eval(myCode.text, mode:"markup")
  block(myCode, fill: luma(240))
  block(myContent, stroke: 1pt)
  block(text(repr(myContent),
    size:5pt),fill:luma(240),stroke:1pt)
}
#eg(`Hello *world*!`)```)

/*
#eg("#let x=7 \n $ x^2=#(x*x) $")

#let letx = "#let x=7\n"
#eg("$x^2=#(x*x)$", init: letx)

#eg("```typst Hello _world_!```")

