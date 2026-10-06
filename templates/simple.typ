// 基本模板
#import "@preview/rubber-article:0.1.0": *
#show: article.with()
#import "@preview/mitex:0.2.4": * // latex 兼容包
#import "@preview/cmarker:0.1.1" //  md兼容包
#import "@preview/codly:1.0.0": * // 设置代码块
// #show: codly-init.with()
#import "@preview/showybox:2.0.3": showybox // 彩色盒子
#import "@preview/i-figured:0.2.4"
#show math.equation: i-figured.show-equation.with(only-labeled: true) // 只有引用的公式才会显示编号
#show figure: i-figured.show-figure // 图1.x
#import "@preview/physica:0.9.3":* // 数学公式简写
#import "@preview/lovelace:0.3.0": * // 伪代码算法
#set text(font:("Times New Roman","Source Han Serif SC"), size: 12pt) // 设置中英语文字体 小四宋体 英语新罗马 
// #import "@preview/cuti:0.2.1": show-cn-fakebold  // 中文伪粗体 像我们使用的Source Han Serif SC是粗体字体不用开启
// #show: show-cn-fakebold
#import "@preview/dashy-todo:0.0.1": todo
#let 行间距转换(正文字体,行间距) = ((行间距)/(正文字体)-0.75)*1em
#set par(leading: 行间距转换(12,20),justify: true,first-line-indent: 2em)
#import "@preview/indenta:0.0.3": fix-indent
#show: fix-indent() // 修复第一段的问题
#show heading: it =>  {it;par()[#let level=(0.3em,0.2em,0.2em);#for i in (1, 2, 3) {if it.level==i{v(level.at(int(i)-1))}};#text()[#h(0.0em)];#v(-1em);]} // 修复标题下首行 以及微调标题间距
#show ref: it => {
  let eq = math.equation;let el = it.element;
  if el != none and el.func() == eq {link(el.location(),"式"+numbering(el.numbering,..counter(eq).at(el.location())))} else {it}
} // 设置引用公式为式
#show figure.where(kind:image): set figure(supplement: [图]) // 设置图
#show figure.where(kind:"tablex"): set figure(supplement: [表]) // 设置表
#import "@preview/mannot:0.1.0": * // 公式突出
// #import "@preview/oasis-align:0.1.0" // 自动布局
// ------------定理 证明----------------
// 默认可间断了，可调
#import "@preview/ctheorems:1.1.3": *
#show: thmrules
#let theorem = thmbox("theorem", "Theorem", stroke: rgb("#ada693a1") + 1pt,breakable: true) //定理环境
#let definition = thmbox("definition", "Definition", inset: (x: 0.5em, top: -0.25em,bottom:-0.25em),stroke: rgb("#ada693a1") + 0pt,breakable: true) // 定义环境
#let proof = thmproof("proof", "Proof",breakable: true) //证明环境
// ----------------------------

= 111