// 导入外部包 Import external packages
#import "@preview/codly:1.0.0": * // 代码高亮 Code highlighting
#import "@preview/codly-languages:0.1.1": * // 代码语言支持 Code language support
#import "@preview/chem-par:0.0.1": * // 化学公式支持 Chemical formula support
#show: codly-init
#codly(languages: codly-languages)

// 自定义样式块 Custom style blocks
// 绿色提示框 Green tip box
#let greenbox(body) = {
  block(
    fill: rgb(250, 255, 250),
    width: 100%,
    inset: 8pt,
    radius: 4pt,
    stroke: rgb(31, 199, 31),
    body,
  )
}

// 蓝色标记框 Blue mark box
#let markblock(cite: none, body) = [
  #set text(size: 10.5pt)
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

// 分隔线 Section divider
#let sectionline = [
  #set align(center)
  #v(0.5cm) // 分割线上边距
  #line(
    length: 80%,
    stroke: (paint: rgb("#767676"), thickness: 1.2pt, dash: ("dot", 5pt, 10pt, 5pt)),
  )
  #v(0.5cm) //分割线下边距
]

// 定义常用样式变量 Define common style variables
// 主题色 Primary color
#let primary-color = rgb("#2196F3")

// 字体配置 Font configuration
#let fonts = (
  serif: "Libertinus Serif", // 衬线字体 Serif font
  sans: "microsoft yahei", // 无衬线字体 Sans-serif font
  code: "jetbrains mono", // 代码字体 Code font
  kaiti: "KaiTi", // 楷体 Kai font
  math: "New Computer Modern Math", // 数学字体 Math font
  heading: "Calibri" // 标题字体 Heading font
)

// 主题配置 Theme configuration
#let theme = (
  heading: (
    color: primary-color, // 标题颜色 Heading color
    icon: text(primary-color, weight: 500, sym.section) // 标题图标 Heading icon
  ),
  text: (
    size: (
      normal: 11pt, // 正常字号 Normal text size
      small: 9pt // 小字号 Small text size
    )
  ),
  page: (
    margin: (
      normal: (top: 2cm, bottom: 2cm, right: 2cm, left: 2cm), // 正常页边距 Normal page margins
      cover: (top: 7cm, bottom: 4cm, left: 2cm) // 封面页边距 Cover page margins
    )
  )
)

// 笔记模板主函数 Main note template function
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
  // 基础文档设置 Basic document settings
  set text(lang: lang)
  set document(author: author, date: auto, title: title)

  // 章节计数器 Chapter counter
  let chapter-counter = counter("chapter")
  
  // 标题样式设置 Heading style settings
  set heading(numbering: "1.1.1.1.1.")
  show heading: it => {
    set text(font: (fonts.serif, fonts.kaiti))
    if it.numbering != none {
      theme.heading.icon
      h(0.5em)
      text(theme.heading.color)[#counter(heading).display()]
    }
    h(0.2em)
    it.body
    v(0.1em)
    if it.level == 1 and it.numbering != none {
      chapter-counter.step()
      counter(math.equation).update(0)
    }
  }
  
  // 标题大写显示设置 Heading capitalization settings
  show heading: it => smallcaps(it)

  // 目录样式设置 Table of contents style settings
  set outline(fill: repeat[~.], indent: 1em)
  show outline: set heading(numbering: none)
  show outline: set par(first-line-indent: 0em)
  show outline.entry.where(level: 1): it => {
    text(font: fonts.serif, primary-color)[#strong[#it]]
  }
  show outline.entry: it => {
    h(1em)
    text(font: fonts.serif, primary-color)[#it]
  }

  // 封面设置 Cover page settings
  set page(margin: theme.page.margin.cover)
  
  polygon(
  fill: rgb("#bb4e4d"),
  (0cm, -7cm), // 左上角开始顺时针第一个点 x y 左负右正 上负下正
  (1.8cm, -7cm), // 左上角开始顺时针第二个点
  (1.8cm, -4cm), // 左上角开始顺时针第三个点
  (0.9cm, -4.9cm), // 左上角开始顺时针第四个点 (上下两个数的中点, 绝对值要比上下两个大)
  (0cm, -4cm), // 左上角开始顺时针第五个点
)


  align(right)[
    #set text(font: ("Times New Roman", "NSimSun"))
    #block(text(weight: 700, 30pt, title))
    #line(length: 100%, stroke: 3pt) //封面横线
    #v(1em, weak: true)
  ]

  align(right)[
    #set text(font: ("Libertinus Serif", "NSimSun"), size: 12pt)
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

  // 页眉设置 Header settings
  set page(header: context {
    set text(font: (fonts.serif, fonts.kaiti))
    if here().page() == 1 { return }
    let elems = query(heading.where(level: 1).after(here()))
    let chapter-title = ""
    if (elems == () or elems.first().location().page() != here().page()) {
      let elems = query(heading.where(level: 1).before(here()))
      chapter-title = elems.last().body
    } else {
      chapter-title = elems.first().body
    }
    align(right)[#chapter-title]
    v(-8pt)
    align(center)[#line(length: 105%, stroke: (thickness: 1pt, dash: "solid"))]
  })

  // 代码样式设置 Code style settings
  show raw.where(block: false): it => box(
    fill: rgb("#d7d7d7"), 
    inset: (x: 2pt), 
    outset: (y: 3pt), 
    radius: 1pt
  )[#it]

  // 表格和链接样式 Table and link styles
  show table.cell.where(y: 0): strong
  show link: underline.with(stroke: blue, offset: 2pt)
  
  // 增强的链接样式 Enhanced link styles
  show link: it => {
    let fill = {
      if type(it.dest) == str {
        blue
      } else if type(it.dest) == label {
        if "tab:" in repr(it.dest) {
          red
        } else if "eq:" in repr(it.dest) {
          green
        } else {
          rgb("#3000cc")
        }
      }
    }
    set text(fill: fill)
    it
  }

  // 公式设置 Equation settings
  set math.equation(numbering: (..nums) => {
    set text(size: theme.text.size.small)
    numbering("(1.1)", chapter-counter.at(here()).first(), ..nums)
  })

  // 数学公式字体 Math font settings
  show math.equation: set text(font: fonts.math)

  // 图表标题设置 Figure caption settings
  set figure(numbering: (..nums) => {
    set text(font: (fonts.serif, fonts.kaiti), size: theme.text.size.small)
    numbering("1.1", chapter-counter.at(here()).first(), ..nums)
  })
  show figure.caption: set text(
    font: (fonts.serif, fonts.kaiti), 
    size: theme.text.size.small
  )

  // 列表样式设置 List style settings
  show enum: it => {
    set text(font: fonts.heading)
    it
  }

  // 正文页面设置 Main content page settings
  set page(margin: theme.page.margin.normal)
  set text(font: (fonts.serif, fonts.sans))
  
  // 生成目录 Generate table of contents
  pagebreak()
  outline()
  pagebreak()
  
  // 页码设置 Page number settings
  set page(numbering: "1 / 1", number-align: right)
  counter(page).update(1)
  
  body

  // 参考文献设置 Bibliography settings
  if bibliography-file != none {
    pagebreak()
    set text(font: ("Times New Roman", fonts.kaiti))
    show bibliography: set text(10.5pt)
    set bibliography(style: bibliographystyle)
    bibliography-file
  }
}

// 应用模板 Apply template
#show: xyznote.with(bibliography-file: bibliography("refs.bib"))


