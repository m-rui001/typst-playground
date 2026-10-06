// 方便调试的设置，实际用可删
#set par(leading: 0em, spacing: 0em)
#set text(top-edge: "ascender", bottom-edge: "descender", font: "Source Han Serif", weight: "bold")

// 页面高 5em，上下边距各 0.5em，背景是 1em 等距水平线
#set page(
  height: 5em,
  width: 8em,
  margin: 0.5em,
  // background：1em 等距水平线
  background: place(
    top,
    {
      set line(stroke: 0.2pt)
      v(0.5em)
      line(length: 100%)
      v(1em)
      line(length: 100%)
      v(1em)
      line(length: 100%)
      v(1em)
      line(length: 100%)
      v(1em)
      line(length: 100%)
    },
  ),
)

#let palette = (
  (fill: purple, width: 100%),
  (fill: yellow.transparentize(20%), width: 90%),
  (fill: gray.transparentize(50%), width: 80%),
  (fill: blue.transparentize(50%), width: 70%),
  (fill: orange.transparentize(50%), width: 70%),
)

// 前文；调整`height`以测试“题目空白”表现
#block([前文], height: 3.4em, ..palette.at(0))

// 绿线之间是题目空白
#line(length: 100%, stroke: green + 0.5pt)

// 不允许“题目空白起点”太靠下
#block(height: 1em, breakable: false, ..palette.at(1))
#block(height: -1em, ..palette.at(2))

// 题目空白A，无论是否跨页，总计入
#block(height: 1em, ..palette.at(3))

// 题目空白B，跨页时忽略
#v(0.5em)

// 题目空白C，无论是否跨页，总计入
#block(height: 0.5em, ..palette.at(4))

// 题目空白的总高度（不计入页边）：
// - 若会跨页：1.5em = A + C
// - 若不跨页：2.0em = A + B + C
// - 若差不多跨页：填充剩余空白，高度不定
//
// “差不多跨页”是指剩余空白介于 1.5em 和 2.0em 之间，若占 1.5em 就不跨页，若占 2.0em 就跨页。

#line(length: 100%, stroke: green + 0.5pt)

