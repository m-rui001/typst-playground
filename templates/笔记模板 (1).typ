#import "@preview/cuti:0.2.1": show-cn-fakebold, fakeitalic
#import "@preview/showybox:2.0.2": *

// 定义默认颜色
#let default-colors = (
  primary: rgb("#2b4692"),
  secondary: rgb("#3f6db5"),
  tertiary: rgb("#003617"),
  quaternary: rgb("#100202"),
  equation: rgb("#ffba743b"),
)

// 添加计数器状态
#let theorem-counter = state("theorem-counter", 0)

// 定义定理样式
#let theorem-styles = (
  theorem: (
    color: rgb("#1e88e5"),
    bg: rgb("#e3f2fd"),
    title: "定理",
  ),
  lemma: (
    color: rgb("#43a047"),
    bg: rgb("#e8f5e9"),
    title: "引理",
  ),
  corollary: (
    color: rgb("#7b1fa2"),
    bg: rgb("#f3e5f5"),
    title: "推论",
  ),
  definition: (
    color: rgb("#ff6f00"),
    bg: rgb("#fff3e0"),
    title: "定义",
  ),
)

// 修改项目函数定义
#let project(
  headleft,
  headright,
  text_size: 18pt,
  page_color: "ffe",
  text_color: "314",
  header_color: "51004d",
  spacing: 0.9em,
  header_inset: 0.2em,
  page_margin: auto,
  body,
) = {
  // 缓存常用值
  let page_fill = rgb(page_color)
  let header_fill = rgb(header_color)
  let text_fill = rgb(text_color)

  // 缓存标题大小
  let heading_sizes = (text_size + 24pt, text_size + 13pt, text_size + 7pt, text_size + 3pt)

  // 合并所有样式设置到一个函数中
  show: doc => {
    show: show-cn-fakebold
    
    set page(
      margin: page_margin,
      header: {
        set text(fill: header_fill)
        block(
          inset: (-header_inset),
          width: 100%,
          {
            box(
              inset: (x: 0.5em),
              [#smallcaps(headleft) #h(1fr) #fakeitalic(headright)],
            )
            v(-0.6em)
            line(length: 100%, stroke: 0.5pt + header_fill)
          },
        )
      },
      numbering: "1",
      fill: page_fill,
    )

    set text(
      fill: text_fill,
      size: text_size,
      font: ("Open Sans", "Fangsong"),
    )

    set par(
      leading: spacing,
      justify: true,
    )

    // 应用其他样式设置
    show heading: it => {
      if it.level <= 4 {
        let idx = it.level - 1
        set text(
          font: ("Calibri", "Kaiti"),
          heading_sizes.at(idx),
          default-colors.at(("primary", "secondary", "tertiary", "quaternary").at(idx)),
        )
        if it.level == 1 {
          block(spacing: 1.2em)[
            #text(style: "normal", weight: "bold")[#align(center, it)]
            #v(-0.8em)
            #line(length: 100%, stroke: (thickness: 1.5pt, paint: default-colors.primary))
          ]
        } else if it.level == 2 {
          block(spacing: 1em)[
            #text(style: "normal", weight: "bold")[#it]
            #v(-0.9em)
            #line(length: 100%, stroke: (thickness: 1.2pt, dash: "dotted", paint: default-colors.secondary))
          ]
        } else if it.level == 3 {
          underline(fakeitalic(it))
        } else {
          smallcaps(it)
        }
      }
    }
    
    show math.equation: eq => box(
      outset: (x: 0.1em, y: 0.4em),
      radius: 0.3em,
      stroke: 0.4pt + rgb("#b222ff57"),
      fill: default-colors.equation,
      text(font: "New Computer Modern Math", eq),
    )

    show enum: set text(
      font: ("Calibri", "Kaiti"),
      size: text_size - 1pt,
    )
    show enum: set block(inset: (left: 1.5em))

    show link: it => {
      set text(
        fill: if type(it.dest) == str { rgb("#0366d6") } else if "tab:" in repr(it.dest) {
          rgb("#e36209")
        } else if "eq:" in repr(it.dest) { rgb("#22863a") } else { rgb("#3000cc") },
        weight: "medium",
      )
      underline(it)
    }

    // 重置定理计数器
    counter("theorem").update(0)

    doc
  }

  body
}

// 定理环境实现
#let theorem-env(kind: "theorem", number: none, title: none, body) = {
  let style = theorem-styles.at(kind, default: theorem-styles.theorem)

  block(spacing: 1.5em)[
    #showybox(
      frame: (
        border-color: style.color,
        title-color: style.bg,
        body-color: style.bg,
        radius: 4pt,
        thickness: 1pt,
        inset: (x: 1.2em, y: .8em), // 增加内部间距
      ),
      title-style: (
        color: style.color,
        weight: "bold",
        align: left,
        sep-thickness: 1pt,
      ),
      body-style: (
        color: rgb(black),
        align: left,
      ),
      title: [
        #style.title
        #if number != none [#h(0.3em)#number]
        #if title != none [：#title]
      ],
      body,
    )
  ]
}

#let theorem(body, numbered: true) = {
  let n = {
    theorem-counter.update(n => n + 1)
    context theorem-counter.get()
  }
  theorem-env(kind: "theorem", number: if numbered { n }, body)
}

#let lemma(body, numbered: true) = {
  let n = {
    theorem-counter.update(n => n + 1)
    context theorem-counter.get()
  }
  theorem-env(
    kind: "lemma",
    number: if numbered { n },
    body,
  )
}

#let corollary(body, numbered: true) = {
  let n = {
    theorem-counter.update(n => n + 1)
    context theorem-counter.get()
  }
  theorem-env(
    kind: "corollary",
    number: if numbered { n },
    body,
  )
}

#let definition(body, numbered: true) = {
  let n = {
    theorem-counter.update(n => n + 1)
    context theorem-counter.get()
  }
  theorem-env(
    kind: "definition",
    number: if numbered { n },
    body,
  )
}

#let proof(body) = block(spacing: 1em)[
  #set text(style: "italic")
  *证明.* #h(0.5em) #body

  #h(1fr) □
]

// 导出默认目录样式
#let default-outline-style = {
  show outline: it => {
    set text(font: ("Calibri", "Kaiti"))
    block(
      inset: (x: 2em, y: 1.5em),
      radius: 4pt,
      width: 100%,
      [
        #set text(weight: "bold", size: 1.2em)
        #block(spacing: 1em)[= #it.title]
        #set text(weight: "regular")
        #set par(leading: 0.7em)
        #it
      ]
    )
  }

  show outline.entry: it => {
    let level = it.level
    let color = if level == 1 { default-colors.primary }
    else if level == 2 { default-colors.secondary }
    else { default-colors.tertiary }
    
    set text(fill: color)
    if level > 1 { h(1em * (level - 1)) }
    it
  }
}