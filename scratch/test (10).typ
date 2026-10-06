#import "@preview/itemize:0.2.0" as el
#import "@preview/cetz:0.4.2"
#import "@preview/numbly:0.1.0": numbly
#import "@preview/meander:0.3.0"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/zero:0.5.0": *
#import "@preview/wrap-it:0.1.1"

#show: codly-init.with()

#codly(languages: codly-languages)

#set text(
  font: (
    // (
    //   name: "Source Han Serif SC",
    //   covers: regex("[·“”‘’…|/\[\]\{\}<>，。！？（）：；]"),
    // ),
    (
      name: "Source Han Serif SC",
      covers: regex("[·“”‘’…|/\[\]\{\}<>，。！？（）：；—]"),
    ),
    (
      name: "TeX Gyre Termes",
    ),
    (
      name: "Source Han Sans SC",
      covers: regex("·"),
    ),
    "Source Han Serif SC",
    (
      name: "TeX Gyre Termes",
    ),
    "Source Han Serif SC",
  ),
  size: 12pt,
  lang: "zh",
  region: "cn",
)

#set enum(numbering: n => text(
  font: (
    (
      name: "Source Han Serif SC",
      covers: regex("[·“”‘’…|/\[\]\{\}<>—，。！？（）：；]"),
    ),
    (
      name: "TeX Gyre Termes",
    ),
    "NSimSun",
  ),
)[#numbering("1.", n)])

#show raw: set text(
  font: "Maple Mono",
  size: 1.15em,
  features: (
    calt: 0,
  ),
)

#show strong: set text(
  font: (
    "Roboto",
    "Source Han Sans SC",
  ),
  lang: "zh",
  region: "cn",
  weight: "regular",
)

#set-group(
  threshold: 4,
)

#show math.equation: set text(
  font: "TeX Gyre Termes Math",
)

#set par(
  justify: true,
  leading: 12pt,
  spacing: 12pt,
  first-line-indent: (
    all: true,
    amount: 2em,
  ),
)

#set block(spacing: 1em)

#show math.equation.where(block: false): set text(
  top-edge: "bounds",
  bottom-edge: "bounds",
)

#show math.equation.where(block: false): math.display

#set page(
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
  numbering: (current, total) => [
    第 #current 页 / 共 #total 页
  ],
)

#show heading: set text(
  font: (
    "Roboto",
    "Source Han Sans SC",
  ),
  lang: "zh",
  region: "cn",
)

#show heading.where(level: 1): set text(size: 16pt)
#show heading.where(level: 2): set text(size: 14pt)
#show heading.where(level: 3): set text(size: 12pt)
#show heading.where(level: 4): set text(size: 12pt)

#show math.equation.where(block: true): set align(left)

#let zh(body) = text(font: "NSimSun", weight: "regular", size: 12pt)[#body]

#let en(body) = text(font: "TeX Gyre Termes")[#body]

#let underln(width, body) = box(align(center, body), width: width, stroke: (bottom: 0.5pt), outset: (bottom: 2pt))

#let h-space(width, body) = box(align(center, body), width: width, outset: (bottom: 2pt))

#let blue(body) = text(fill: rgb("#1d5dff"))[#body]

#show ref: el.ref-enum
#show: el.default-enum-list
#show: el.default-enum-list.with(enum-spacing: 1em)

#set list(marker: (
  [•],
  [◦],
  [▪],
  [▫],
  [▸],
  [▹],
))

#show quote.where(block: true): it => block(
  fill: luma(90.2%), // 浅灰背景
  stroke: (left: 2pt + gray, rest: none), // 只画左边竖线
  inset: (top: 1em, right: 1em, bottom: 1em, left: 1em + 2pt), // 内边距
  spacing: 1.2em,
  outset: (left: -2pt),
  width: 100%,
)[
  #it.body
]

#let fake-italic(body) = box(text([#skew(ax: -12deg)[#body]]))

#let inline-options(option-a, option-b, option-c, option-d) = {
  layout(size => {
    let total-width = size.width
    context {
      let option-width = total-width / 4

      let option-a-text = [A.#h(0.5em)] + option-a
      let option-b-text = [B.#h(0.5em)] + option-b
      let option-c-text = [C.#h(0.5em)] + option-c
      let option-d-text = [D.#h(0.5em)] + option-d

      let option-a-width = measure(option-a-text).width
      let option-b-width = measure(option-b-text).width
      let option-c-width = measure(option-c-text).width
      let option-d-width = measure(option-d-text).width

      [#option-a-text#h(option-width - option-a-width)#option-b-text#h(option-width - option-b-width)#option-c-text#h(
          option-width - option-c-width,
        )#option-d-text#h(option-width - option-d-width)]
    }
  })
}

#let short-options(option-a, option-b, option-c, option-d) = {
  layout(size => {
    let total-width = size.width
    context {
      let option-width = total-width / 2

      let option-a-text = [A.#h(0.5em)] + option-a
      let option-b-text = [B.#h(0.5em)] + option-b
      let option-c-text = [C.#h(0.5em)] + option-c
      let option-d-text = [D.#h(0.5em)] + option-d

      let option-a-width = measure(option-a-text).width
      let option-b-width = measure(option-b-text).width
      let option-c-width = measure(option-c-text).width
      let option-d-width = measure(option-d-text).width

      [#option-a-text#h(option-width - option-a-width)#option-b-text#h(option-width - option-b-width)]

      parbreak()

      [#option-c-text#h(option-width - option-c-width)#option-d-text#h(option-width - option-d-width)]
    }
  })
}

#let long-options(option-a, option-b, option-c, option-d) = [
  #block[
    #set enum(numbering: n => text(
      font: (
        (
          name: "Source Han Serif SC",
          covers: regex("[·“”‘’…|/\[\]\{\}<>—，。！？（）：；]"),
        ),
        (
          name: "TeX Gyre Termes",
        ),
        "NSimSun",
      ),
    )[#numbering("A.", n)])
    1.
      #option-a
  ]

  #block[
    #set enum(numbering: n => text(
      font: (
        (
          name: "Source Han Serif SC",
          covers: regex("[·“”‘’…|/\[\]\{\}<>—，。！？（）：；]"),
        ),
        (
          name: "TeX Gyre Termes",
        ),
        "NSimSun",
      ),
    )[#numbering("A.", n)])
    2.
      #option-b
  ]

  #block[
    #set enum(numbering: n => text(
      font: (
        (
          name: "Source Han Serif SC",
          covers: regex("[·“”‘’…|/\[\]\{\}<>—，。！？（）：；]"),
        ),
        (
          name: "TeX Gyre Termes",
        ),
        "NSimSun",
      ),
    )[#numbering("A.", n)])
    3.
      #option-c
  ]

  #block[
    #set enum(numbering: n => text(
      font: (
        (
          name: "Source Han Serif SC",
          covers: regex("[·“”‘’…|/\[\]\{\}<>—，。！？（）：；]"),
        ),
        (
          name: "TeX Gyre Termes",
        ),
        "NSimSun",
      ),
    )[#numbering("A.", n)])
    4.
      #option-d
  ]
]

#align(center)[
  #set text(size: 16pt, weight: "bold")

  2025\u{2015}2026 #text(font: "Source Han Serif SC")[学年度八年级（上）学习能力训练]

  #set text(size: 22pt)

  *语#h(2em)文*

  #set text(size: 12pt)

  *（本试卷共 23 小题#h(1em)满分 120 分#h(1em)考试时长 150 分钟）*

  *考生注意：所有试题必须在答题卡指定区域内作答，在本试卷上作答无效*
]

#show heading: it => {
  // 1. 先准备好标题的内容（编号 + 间距 + 文字）
  let heading-content = if it.numbering != none {
    let number = counter(heading).display(it.numbering)
    // 这里是你原来的逻辑：编号 + 0.8em 间距 + 标题正文
    number + it.body
  } else {
    it.body
  }

  // 2. 将内容包装在 block 中以设置精确的上下间距
  block(
    above: 1.2em, // 标题上方的间距
    below: 12pt, // 标题下方的间距
    sticky: true, // 关键：保证标题不会和下方的段落被分页符切断
    width: 100%, // 确保块占据整行
    heading-content,
  )
}

= 一、积累与运用

+
  下列词语中加点字的字音、字形完全正确的一项是（#h(2em)）。（2 分）

  #long-options(
    [
      #layout(size => {
        let total-width = size.width
        context {
          let option-width = total-width / 4

          let option-a-text = [倔强（jué jiàng）]
          let option-b-text = []
          let option-c-text = []
          let option-d-text = []

          let option-a-width = measure(option-a-text).width
          let option-b-width = measure(option-b-text).width
          let option-c-width = measure(option-c-text).width
          let option-d-width = measure(option-d-text).width

          [#option-a-text#h(option-width - option-a-width)#option-b-text#h(
              option-width - option-b-width,
            )#option-c-text#h(
              option-width - option-c-width,
            )#option-d-text#h(option-width - option-d-width)]
        }
      })],
    [],
    [],
    [],
  )
