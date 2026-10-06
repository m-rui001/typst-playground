#let font_sizes = (
  "一号": 26pt,
  "小一": 24pt,
  "二号": 22pt,
  "小二": 18pt,
  "三号": 16pt,
  "小三": 15pt,
  "四号": 14pt,
  "小四": 12pt,
  "五号": 10.5pt,
  "小五": 9pt,
  "六号": 7.5pt,
  "小六": 6.5pt,
)
#let fonts = (
  "宋体": ("Times New Roman", "Simsun"),
  "黑体": ("Arial", "SimHei"),
  "楷体": ("Times New Roman", "KaiTi"),
)
#let indent() = {
  h(2em)
}
#let title(title) = {
  align(center)[
    #text(size: font_sizes.at("二号"))[*#title*]
  ]
}
#let subtitle(authors) = {
  align(center)[
    #emph(
      text(size: font_sizes.at("小二"))[
        #for author in authors {
          author + h(1.5em)
        }
        #datetime.today().display("[year]年[month]月[day]日")
      ],
    )
  ]
}
#let _highlight_(body, type, fill, title: none, proof: none, label: none) = {
  let c = counter(type)
  c.step()

  if title != none {
    title = emph("（" + title + "）")
  }

  if proof != none {
    proof = line(
      length: 100%,
      stroke: 2pt + maroon,
    ) + parbreak() + emph("证明：") + proof + parbreak() + align(right)[\u{25A0}]
  }

  [#figure(v(-1em), kind: type, supplement: type) #label] // 硬编码，段落间距
  block(
    [#strong(type)#context c.display()#h(0.6em)#title#body#parbreak()#proof],
    fill: fill,
    width: 100%,
    radius: 5pt,
    stroke: 2pt,
    inset: 8pt,
  )
}
#let definition(body, title: none, label: none) = {
  _highlight_(body, "定义", rgb("#eef0c0"), title: title, label: label)
}
#let proposition(body, title: none, label: none) = {
  _highlight_(body, "命题", rgb("#ccf0da"), title: title, label: label)
}
#let theorem(body, title: none, proof: none, label: none) = {
  _highlight_(body, "定理", rgb("#d7baf1"), title: title, proof: proof, label: label)
}
#let lemma(body, title: none, proof: none, label: none) = {
  _highlight_(body, "引理", rgb("#e4bee9"), title: title, proof: proof, label: label)
}
#let note(body, title: none, label: none) = {
  _highlight_(body, "笔记", rgb("#86A7ED"), title: title, label: label)
}
#let template(doc) = [
  // set rules
  #set text(font: fonts.at("宋体"), size: font_sizes.at("小四"), lang: "zh", region: "cn")
  #set par(justify: true, spacing: 1em, leading: 1em)
  #set heading(numbering: "1.")
  #set page(numbering: "1 / 1")
  #set table(stroke: none, inset: 6pt)
  #set math.equation(numbering: "(1)")

  // show rules
  #show heading: set block(above: 1.4em, below: 1em)
  #show heading: set text(font: fonts.at("黑体"))
  #show emph: set text(font: fonts.at("楷体"))
  #show strong: set text(font: fonts.at("黑体"))
  #show math.equation: set block(spacing: 1em)
  #show figure.where(kind: table): set figure.caption(position: top)
  #show figure.caption: emph
  #show ref: strong

  #doc
]