// ---- 导入与初始化 ----
#import "@preview/codly:1.0.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init
#codly(languages: codly-languages)

// ---- 样式配置 ----
#let styles = (
  colors: (
    primary: rgb("#2196F3"),
    secondary: rgb("#bb4e4d"),
    link: blue,
    code-bg: rgb("#d7d7d7"),
  ),
  fonts: (
    serif: "Libertinus Serif",
    sans: "microsoft yahei",
    code: "jetbrains mono",
    cjk: ("KaiTi", "NSimSun"),
  ),
)

// ---- 工具函数 ----
#let make-header(chapter-title) = {
  align(right)[#chapter-title]
  v(-8pt)
  align(center)[#line(length: 105%, stroke: (thickness: 1pt, dash: "solid"))]
}

// ---- 自定义组件 ----
#let components = {
  let greenbox(body) = block(
    fill: rgb(250, 255, 250),
    width: 100%,
    inset: 8pt,
    radius: 4pt,
    stroke: rgb(31, 199, 31),
    body,
  )

  let markblock(body, cite: none) = text(size: 10.5pt)[
    #pad(left: 0.5em)[
      #block(
        breakable: true,
        width: 100%,
        fill: rgb("#d0f2fe"),
        radius: (left: 1pt),
        stroke: (left: 4pt + rgb("#5da1ed")),
        inset: 1em,
      )[#body]
    ]
  ]

  let sectionline = align(center)[
    #v(0.5cm)
    #line(
      length: 80%,
      stroke: (
        paint: rgb("#767676"),
        thickness: 1.2pt,
        dash: ("dot", 5pt, 10pt, 5pt),
      ),
    )
    #v(0.5cm)
  ]

  (greenbox: greenbox, markblock: markblock, sectionline: sectionline)
}

// ---- 主模板函数 ----
#let xyznote(
  title: "xyznote",
  author: "wardenxyz",
  abstract: "A simple typst note template",
  createtime: "2024-11-27",
  lang: "zh",
  bibliographystyle: "ieee",
  body,
  bibliography-file: none,
) = {
  // 基础样式配置
  set text(lang: lang, font: (styles.fonts.serif, styles.fonts.sans))
  set document(author: author, date: auto, title: title)

  // 计数器和标题配置
  let chaptercounter = counter("chapter")
  set heading(numbering: "1.1.1.1.1.")
  show heading: it => {
    set text(font: (styles.fonts.serif, styles.fonts.cjk.at(0)))
    if it.numbering != none {
      text(styles.colors.primary, weight: 500)[#sym.section]
      h(0.5em)
      text(styles.colors.primary)[#counter(heading).display()]
    }
    it.body
    v(0.1em)
    if it.level == 1 and it.numbering != none {
      chaptercounter.step()
      counter(math.equation).update(0)
    }
  }

  // 大纲配置
  set outline(fill: repeat[~.], indent: 1em)
  show outline: it => {
    set heading(numbering: none)
    set par(first-line-indent: 0em)
    it
  }
  show outline.entry: it => {
    let style = text.with(
      font: styles.fonts.serif,
      fill: styles.colors.primary,
    )
    if it.level == 1 {
      style(strong(it))
    } else {
      h(1em)
      style(it)
    }
  }

  // 封面配置
  set page(margin: (top: 7cm, bottom: 4cm, left: 2cm))
  polygon(
    fill: styles.colors.secondary,
    (0cm, -7cm),
    (1.8cm, -7cm),
    (1.8cm, -4cm),
    (0.9cm, -4.9cm),
    (0cm, -4cm),
  )
  align(right)[
    #set text(font: (styles.fonts.serif, styles.fonts.cjk.at(1)))
    #block(text(weight: 700, 30pt, title))
    #line(length: 100%, stroke: 3pt)
    #v(1em, weak: true)
  ]

  align(right)[
    #set text(font: (styles.fonts.serif, styles.fonts.cjk.at(1)), size: 12pt)
    #abstract
  ]

  align(bottom + center)[
    #set text(size: 15pt)
    *#author*
  ]

  align(bottom + center)[
    #set text(size: 15pt)
    *#createtime*
  ]

  // 页眉配置
  set page(header: context {
    set text(font: (styles.fonts.serif, styles.fonts.cjk.at(1)))
    if here().page() == 1 {
      return
    }

    let elems = query(heading.where(level: 1).after(here()))

    let chapter-title = ""

    if (elems == () or elems.first().location().page() != here().page()) {
      let elems = query(heading.where(level: 1).before(here()))
      chapter-title = elems.last().body
    } else {
      chapter-title = elems.first().body
    }
    make-header(chapter-title)
  })

  // 正文配置
  set page(margin: (top: 2cm, bottom: 2cm, right: 2cm, left: 2cm))
  set text(font: (styles.fonts.serif, styles.fonts.sans))
  show raw.where(block: false): box.with(
    fill: styles.colors.code-bg,
    inset: (x: 2pt),
    outset: (y: 3pt),
    radius: 1pt,
  )
  show table.cell.where(y: 0): strong
  show link: underline.with(
    stroke: styles.colors.link,
    offset: 2pt,
  )

  // 页码配置
  set page(numbering: "1 / 1", number-align: right)
  counter(page).update(1)

  // 输出内容
  pagebreak()
  outline()
  pagebreak()
  body

  // 参考文献
  if bibliography-file != none {
    pagebreak()
    show text: set text(font: (styles.fonts.serif, styles.fonts.cjk.at(0)))
    show bibliography: set text(10.5pt)
    set bibliography(style: bibliographystyle)
    bibliography-file
  }
}

// 导出组件
#let (greenbox, markblock, sectionline) = components.values()
