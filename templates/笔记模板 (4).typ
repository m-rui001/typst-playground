#import "@preview/showybox:2.0.2": *
#import "@preview/in-dexter:0.0.4": *
#import "@preview/physica:0.8.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/shadowed:0.1.2": shadowed

// ----- 全局样式定义 -----
#let styles = (
  // 基础样式
  base: (
    font: ("Open Sans", "Fangsong"),
    text-size: 18pt,
    leading: 0.9em,
    spacing: 1.3em,
    page-color: "fcf6ff",
    text-color: rgb("#304"),
    header-color: "51004d",
    header-inset: 0.2em,
  ),
  // 主题颜色
  colors: (
    text: rgb("#304"),
    primary: rgb("#2b4692"),
    secondary: rgb("#3f6db5"),
    tertiary: rgb("#190058d6"),
    quaternary: rgb("#063202"),
    equation: rgb("#ffba743b"),
    tertiary_box_fill: rgb("#9fc0e690"),
    links: (
      url: rgb("#0366d6"),
      tab: rgb("#e36209"),
      eq: rgb("#22863a"),
      other: rgb("#0000bcc6"),
    ),
    chemical: (
      color: rgb("#2e7d32"),
      bg: rgb("#e8f5e9"),
    ),
  ),
  // 定理样式
  theorem: (
    theorem: (color: rgb("#1e88e5"), bg: rgb("#e3f2fd")),
    lemma: (color: rgb("#43a047"), bg: rgb("#e8f5e9")),
    corollary: (color: rgb("#7b1fa2"), bg: rgb("#f3e5f5")),
    definition: (color: rgb("#ff6f00"), bg: rgb("#fff3e0")),
    keyword: (color: rgb("#d32f2f"), bg: rgb("#ffebee")),
    fact: (color: rgb("#ff9800"), bg: rgb("#fff3e0")),
  ),
  // 标题样式
  heading: (
    font: ("Calibri", "Kaiti"),
    sizes: (42pt, 31pt, 25pt, 21pt, 21pt),
    colors: (
      rgb("#2b4692"),
      rgb("#3f6db5"),
      rgb("#190058d6"),
      rgb("#063202"),
    ),
  ),
  // 字体配置
  fonts: (
    math: "New Computer Modern Math",
    text: ("Open Sans", "Fangsong"),
    heading: ("Calibri", "Kaiti"),
    code: "Fira Code",
  ),
  // 显示配置
  display: (
    // 数学相关
    math: (
      equation_numbering: "1-1", // 章节-编号格式
      counter_prefix: "式", // 公式前缀
      bracket: ("(", ")"), // 编号括号样式
      indent: 1em, // 公式缩进
      align: center, // 公式对齐方式
    ),
    // 代码相关
    code: (
      numbering: true,
      theme: "github-dark",
    ),
    // 通用显示设置
    highlight: (
      radius: 0.26em,
      fill: rgb("#ffc43967"),
    ),
    // 红色高亮
    red_highlight: (
      radius: 3pt,
      fill: rgb("dd16224a"),
    ),
  ),
  // 布局配置
  layout: (
    outline: (
      indent: 2em,
      depth: 3,
    ),
    spacing: (
      block: 1.2em,
      heading1: 1.2em,
      heading2: 0.8em,
    ),
  ),
)

// 设置默认样式
#set par(justify: true)

// 创建索引收集器
#let index-collector = state("index-collector", ())

/// Creates a theorem-like environment
/// 创建定理样环境
///
/// - kind (string): Type of theorem environment 定理环境类型
/// - title-prefix (string): Prefix shown before the number 编号前显示的前缀
/// - breakable (bool): Whether the box can break across pages 是否允许跨页
/// -> function
#let make-theorem-env(kind, title-prefix, breakable) = {
  let style = styles.theorem.at(kind)
  let thm-counter = counter(kind)

  return (body, numbered: true, subtitle: none) => context {
    let number = if numbered {
      counter.step(thm-counter)
      str(thm-counter.get().first() + 1)
    }

    showybox(
      breakable: if breakable and measure(body).height > 0.1 * page.height { true } else { false },
      width: 100%,
      frame: (
        border-color: style.color,
        title-color: style.bg,
        body-color: style.bg,
        radius: 4pt,
        thickness: 1pt,
        inset: (x: 1.2em, y: .8em),
      ),
      title-style: (color: style.color, weight: "bold", align: left),
      body-style: (color: black, align: left),
      title: [
        #title-prefix #if number != none [
          #h(0.3em)
          #number
        ]
      ],
      {
        if subtitle != none {
          align(center, text(size: 1.2em, weight: "bold", fill: style.color, subtitle))
          v(0.5em)
        }
        body
      },
    )
  }
}

/// Creates a theorem block with automatic numbering
/// 创建自动编号的定理区块
///
/// - body (content): Theorem content 定理内容
/// - numbered (bool, default: true): Whether to show numbers 是否显示编号
/// - subtitle (string, default: none): Optional subtitle 可选副标题
/// -> content
#let theorem = make-theorem-env("theorem", "Theorem", true)

/// Creates a lemma block with automatic numbering
/// 创建自动编号的引理区块
///
/// - body (content): Lemma content 引理内容
/// - numbered (bool, default: true): Whether to show numbers 是否显示编号
/// - subtitle (string, default: none): Optional subtitle 可选副标题
/// -> content
#let lemma = make-theorem-env("lemma", "Lemma", true)

/// Creates a corollary block with automatic numbering
/// 创建自动编号的推论区块
///
/// - body (content): Corollary content 推论内容
/// - numbered (bool, default: true): Whether to show numbers 是否显示编号
/// - subtitle (string, default: none): Optional subtitle 可选副标题
/// -> content
#let corollary = make-theorem-env("corollary", "Corollary", true)

/// Utility function to sanitize label text
/// 用于清理标签文本的工具函数
///
/// - str (string): Input string to sanitize 需要清理的输入字符串
/// -> string: Sanitized string 清理后的字符串
#let sanitize-label(str) = {
  str.replace(" ", "-").replace("(", "").replace(")", "")
}

/// Creates a definition block with index entry
/// 创建带索引的定义区块
///
/// - subtitle (string): Definition name 定义名称
/// - breakable (bool): Whether can break across pages 是否允许跨页
/// - body (content): Definition content 定义内容
/// -> content
#let definition(subtitle, breakable: true, body) = {
  let label-text = "def-" + sanitize-label(subtitle)

  index-collector.update(entries => {
    entries.push(("定义", subtitle, label-text))
    entries
  })

  make-theorem-env("definition", "Definition", breakable)(
    subtitle: subtitle,
    [#body #label(label-text)],
  )
}

/// Create a keyword block with index entry
/// 创建带索引的关键词区块
///
/// - subtitle (string): Keyword name 关键词名称
/// - breakable (bool): Whether can break across pages 是否允许跨页
/// - body (content): Keyword content 关键词内容
/// -> content
#let keyword(subtitle, breakable: true, body) = {
  let label-text = "kw-" + sanitize-label(subtitle)

  index-collector.update(entries => {
    entries.push(("关键词", subtitle, label-text))
    entries
  })

  make-theorem-env("keyword", "Key Words", breakable)(
    subtitle: subtitle,
    [#body #label(label-text)],
  )
}

/// Main project template function
/// 主要的项目模板函数
///
/// - headleft (string): Left header text 左侧页眉文本
/// - headright (string): Right header text 右侧页眉文本
/// - text_size (length): Base text size 基础字号
/// - page_color (string): Page background color 页面背景色
/// - text_color (color): Text color 文字颜色
/// - header_color (string): Header color 页眉颜色
/// - leading (length): Line leading 行间距
/// - spacing (length): Paragraph spacing 段间距
/// - header_inset (length): Header inset 页眉内边距
/// - page_margin (auto|length): Page margin 页边距
/// - body (content): Document content 文档内容
/// -> content
#let project(
  headleft,
  headright,
  text_size: 18pt,
  page_color: "fcf6ff",
  text_color: styles.colors.text,
  header_color: "51004d",
  leading: 0.9em,
  spacing: 1.3em,
  header_inset: 0.2em,
  page_margin: auto,
  body,
) = {
  let colors = (
    page: rgb(page_color),
    header: rgb(header_color),
    text: rgb(text_color),
  )

  let heading_sizes = (
    text_size + 24pt,
    text_size + 13pt,
    text_size + 7pt,
    text_size + 3pt,
    text_size + 3pt,
  )

  let heading_colors = (
    styles.colors.primary,
    styles.colors.secondary,
    styles.colors.tertiary,
    styles.colors.quaternary,
  )

  let text-styles = (
    base: (
      font: ("Open Sans", "Fangsong"),
      fill: colors.text,
      size: text_size,
    ),
    heading: (font: ("Calibri", "Kaiti")),
  )

  show: doc => {
    show heading: set heading(numbering: "1.")

    set outline(
      indent: 2em,
      depth: 3,
      title: none,
    )

    set page(
      margin: page_margin,
      header: context {
        set text(fill: colors.header)
        box(
          width: 100%,
          inset: (bottom: 0.6em),
        )[
          #smallcaps(headleft)
          #h(1fr)
          #headright
          #v(-0.3em)
          #line(length: 100%, stroke: 0.5pt + colors.header)
        ]
      },
      numbering: "1",
      fill: colors.page,
    )

    set text(..text-styles.base)
    set par(
      justify: true,
      leading: leading,
      spacing: spacing,
    )

    show strong: it => text(
      weight: "bold",
      fill: styles.colors.primary,
      it.body,
    )

    show heading: it => {
      if it.level <= 4 {
        let idx = it.level - 1
        set text(
          font: text-styles.heading.font,
          heading_sizes.at(idx),
          heading_colors.at(idx),
        )

        if it.level == 1 {
          block(spacing: 1.2em)[
            #text(weight: "bold")[#align(center, it)]
            #v(-0.8em)
            #line(length: 100%, stroke: (thickness: 1.5pt, paint: styles.colors.primary))
          ]
        } else if it.level == 2 {
          block(spacing: 0.8em)[
            #text(weight: "bold")[#it]
            #v(-0.8em)
            #line(length: 100%, stroke: (thickness: 1.2pt, dash: "dotted", paint: styles.colors.secondary))
          ]
        } else if it.level == 3 {
          block(
            stroke: (left: 0.12em + styles.colors.tertiary),
            fill: rgb(styles.colors.tertiary_box_fill),
            inset: (x: 0.5em, y: 0.4em),
            radius: (left: 0.1em, right: 1em),
          )[#it]
        } else {
          block(
            fill: rgb("#edf2f7"),
            inset: (x: 0.6em, y: 0.2em),
            radius: 0.3em,
          )[#smallcaps(it)]
        }
      }
    }

    // 在project函数中，替换原有的math.equation显示设置，是由obj.fake_cirno制作的

    set math.equation(numbering: "式 1")
    show math.equation.where(block: true): it => {
      if it.has("label") {
        if "-" == str(it.label) {
          counter(math.equation).update(n => n - 1)
          math.equation(it.body, block: true, numbering: none)
          return
        } else if "::" in str(it.label) {
          let (a, b) = str(it.label).split("::")
          counter(math.equation).update(n => n - 2)
          [#math.equation(it.body, block: true, numbering: _ => "(" + b + ")")#label(a)]
          return
        }
      }
      it
    }

    show list: set text(
      font: ("Calibri", "Kaiti"),
      size: text_size,
    )

    let link-colors = (
      str: styles.colors.links.url,
      tab: styles.colors.links.tab,
      eq: styles.colors.links.eq,
      other: styles.colors.links.other,
    )

    show link: it => {
      let color = if type(it.dest) == str {
        link-colors.str
      } else if "tab:" in repr(it.dest) {
        link-colors.tab
      } else if "eq:" in repr(it.dest) {
        link-colors.eq
      } else {
        link-colors.other
      }
      text(fill: color, weight: "medium", underline(it))
    }

    set highlight(
      radius: 0.26em,
      fill: rgb("#ffc43967"),
    )

    doc
  }
  body
}

/// Proof environment with italic text and end mark
/// 带有斜体文本和终止符号的证明环境
///
/// - body (content): Proof content 证明内容
/// -> content
#let proof(body) = block(spacing: 1em)[
  #set text(style: "italic")
  *Proof.* #h(0.5em) #body #h(1fr) □
]

/// Creates a fact block with automatic numbering
/// 创建自动编号的事实区块
///
/// - body (content): Fact content 事实内容
/// - numbered (bool, default: true): Whether to show numbers 是否显示编号
/// - subtitle (string, default: none): Optional subtitle 可选副标题
/// -> content
#let fact = make-theorem-env("fact", "Fact", true)

/// Applies color to text content
/// 为文本内容添加颜色
///
/// - color (string): Color value in any CSS format 任何CSS格式的颜色值
/// - content (content): Content to be colored 需要着色的内容
/// -> content
#let clr(color, content) = text(rgb(color))[#content]

/// Shows index of definitions and keywords
/// 显示定义和关键词索引
///
/// - title (string): Index title 索引标题
/// -> content
#let show-index(title: "索引") = {
  heading(level: 1, title)
  context {
    let entries = index-collector.final()
    let grouped = (:)
    for (type, term, label-text) in entries {
      if type not in grouped {
        grouped.insert(type, ())
      }
      grouped.at(type).push((term, label-text))
    }
    for (type, terms) in grouped {
      heading(level: 2, type)
      let sorted-terms = terms.sorted(key: ((term, _)) => term)
      for (term, label-text) in sorted-terms {
        [ + #link(label(label-text))[#term]]
      }
    }
  }
}


#let chem-rules = (
  compound: regex("[A-Z][a-z]?[0-9]+|\\([A-Z][a-z]+\\)[0-9]+"),
  ion: regex("[A-Z][a-z]?\\^\\([0-9+-]+\\)"),
  state: regex("[A-Z][a-z]?(?:[0-9]+)?\\([a-z]+\\)"),
  complex: regex("[A-Z][a-z]?\\([A-Z][A-Za-z]\\)[0-9]+"),
)

/// Process chemical formulas and equations
/// 处理化学公式和方程式
///
/// - body (content): Chemical content 化学内容
/// -> content
#let process-chemistry = body => {
  show "react": $arrow$
  show "equilibrium": math.arrow.l.r
  show "Delta": sym.Delta
  show "+": $ + $

  show chem-rules.complex: it => {
    let parts = it.text.split("(")
    let base = parts.at(0)
    let group = parts.at(1).split(")").at(0)
    let number = parts.at(1).split(")").at(1)
    $base(group)_number$
  }

  show chem-rules.compound: it => {
    if it.text.starts-with("(") {
      let group = it.text.find(regex("\\([A-Z][a-z]+\\)"))
      let number = it.text.find(regex("[0-9]+"))
      $(group)_number$
    } else {
      let element = it.text.find(regex("[A-Z][a-z]?"))
      let number = it.text.find(regex("[0-9]+"))
      $element_number$
    }
  }

  show chem-rules.ion: it => {
    let element = it.text.find(regex("[A-Z][a-z]?"))
    let charge = it.text.find(regex("[0-9+-]+"))
    show "+": math.plus
    show "-": math.minus
    $element^charge$
  }

  show chem-rules.state: it => {
    let element = it.text.find(regex("[A-Z][a-z]?"))
    let number = it.text.find(regex("[0-9]+"))
    let state = it.text.find(regex("\\([a-z]+\\)"))
    if number == "" {
      $element_state$
    } else {
      $element_(number state)$
    }
  }

  $upright(#body)$
}

/// Creates a reaction box with chemical equation
/// 创建带有化学方程式的反应框
///
/// - body (content): Reaction content 反应内容
/// -> content
#let reaction(body) = {
  showybox(
    breakable: false,
    width: 100%,
    frame: (
      border-color: styles.colors.chemical.color,
      title-color: styles.colors.chemical.bg,
      body-color: styles.colors.chemical.bg,
      radius: 4pt,
      thickness: 1pt,
      inset: (x: 1.2em, y: .8em),
    ),
    title-style: (color: styles.colors.chemical.color, weight: "bold", align: left),
    body-style: (color: black, align: center),
    title: "Reaction",
    {
      set text(font: "New Computer Modern Math")
      set math.equation(numbering: "eq 1.")
      v(1em)
      process-chemistry(body)
    },
  )
}

/// Process and format chemical formulas
/// 处理和格式化化学公式
///
/// - body (content): Chemical formula content 化学公式内容
/// - Returns: Formatted chemical formula styled with special font and colors
/// -> content
#let chemical = body => {
  process-chemistry(body)
}



//------ 自定义常用模块 ------

/// Creates a red highlighted text block
/// 创建红色高亮文本区块
///
/// - body (content): Text to highlight 要高亮的文本
/// -> content
#let red-highlight(body) = highlight(
  radius: styles.display.red_highlight.radius,
  fill: styles.display.red_highlight.fill,
)[#body]

/// Creates a modern cover page
/// 创建现代风格的封面
///
/// - title (string): Document title 文档标题
/// - subtitle (string): Document subtitle 文档副标题
/// - author (string): Author name 作者名称
/// - date (datetime): Optional date, defaults to today 可选日期，默认今天
/// -> content
#let modern-cover(
  title: "",
  subtitle: "",
  author: "",
  date: none,
) = {
  let date = if date == none { datetime.today() } else { date }

  page()[
    #stack(
      spacing: 2em,
      {
        v(15%)
        // 标题区块
        align(center)[
          #shadowed(
            inset: 2em,
            radius: 6.5pt,
            fill: rgb(252, 250, 255, 235),
          )[
            #stack(
              spacing: 1em,
              align(center)[
                #text(
                  size: 42pt,
                  weight: "bold",
                  fill: rgb("#2b4692"),
                  title,
                )
              ],
              align(center)[
                #text(
                  size: 24pt,
                  fill: rgb("#3f6db5"),
                  subtitle,
                )
              ],
            )
          ]
        ]

        // 作者和日期圆形区域
        align(center)[
          #cetz.canvas({
            import cetz.draw: *

            // 外圈装饰
            set-style(stroke: rgb("#ffffff00"), fill: rgb("#ebc2ff05"))
            for i in range(0, 50) {
              circle(
                (0, 0),
                radius: 5 - 0.05 * i,
                stroke-width: 1pt,
              )
            }


            // 作者和日期文本
            content(
              (0, 1),
              text(
                fill: styles.colors.primary,
                size: 18pt,
                [作者：#author],
              ),
              anchor: "center",
            )

            content(
              (0, -1),
              text(
                fill: styles.colors.primary,
                size: 18pt,
                [日期：#date.display()],
              ),
              anchor: "center",
            )
          })
        ]
      },
    )
  ]
}

// 应用全局配置
#show math.equation: eq => context {
  text(font: styles.fonts.math, eq)
}

#show strong: it => text(
  weight: "bold",
  fill: styles.colors.primary,
  it.body,
)

#set highlight(
  radius: styles.display.highlight.radius,
  fill: styles.display.highlight.fill,
)

