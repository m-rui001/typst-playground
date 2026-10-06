// ==========================================
// 讲义模板.typ
// ==========================================

// 宏包
#import "./lib/zh-format.typ": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-venn:0.1.4"

根据一级标题号自动更新例题号
#let example-counter = counter("example")
#show heading.where(level: 1): it => {
    example-counter.update(0)
    it
}

#let example(body) = [

  #example-counter.step()

  #context {
    let head_num = counter(heading).get().first()
    let exa_num = example-counter.get().first()
    [
      #strong[例 #head_num.#exa_num]
      #body
    ]
  }
]

// 全局自动更新习题号
#let exercise-state = state("exersice-stat", 0)

#let exercise(body) = [
  #let exercise-counter = counter("exercise")
  #exercise-counter.step()
  #context {
    let exe_num = exercise-counter.get().first()
    [
      【#exe_num】
      #body
    ]
  }
]

// 填空
#let blank(len) = underline(" " * len)

// 教师版或学生版讲义
// #let answer = make-answer(show_ans: true) 显示答案
// #let answer = make-answer(show_ans: false) 隐藏答案
#let make-answer(show_ans: false) = {
  (body) => {
    if show_ans {
      text(fill: red, body)
    } else {
      hide(body)
    }
  }
}

// 文章大纲
#let doc(
  title: "",
  subtitle: "",
  author: "",
  body,
) = {
  
  // 宏包
  show: zh-format

  // 全局设置
  set page(
  paper: "a5",
  margin: (top: auto, bottom: auto, left: auto, right: auto),
  numbering: none,
)

  set text(
  font: ("Times New Roman", "Source Han Serif SC"),
  size: 10pt,
  lang: "zh",
)

  show math.equation: set block(breakable: true)
  show math.cases: math.display

  // 封面页
  set page(numbering: none, margin: (top: 0cm, bottom: 4cm, left: 2.5cm, right: 2.5cm))
  align(center + horizon, [
    #text(size: 28pt, weight: "bold", title)
    #v(0em)
    #text(size: 12.5pt, subtitle)
  ])
  align(bottom + right, [
    #text(size: 12pt, author)
  ])
  pagebreak()

  // 目录页
  set page(numbering: none, margin: (top: 3cm, bottom: 3cm, left: 3cm, right: 3cm))
  outline(title: [目 录], indent: 1.2em, depth: 2)
  pagebreak()

  // 正文设置
  set heading(numbering: "1.1.1")
  set par(justify: true, leading: 0.8em)
  
show heading.where(level: 1): it => [
  #set align(center)
  #if it.numbering != none [
    #let num = counter(heading).display("1")
    §#num
  ]
  #it.body
]

show heading.where(level: 3): it => [
  #if it.numbering != none [
    #let num = counter(heading).get().at(2)
    #numbering("一", num)、
  ]
  #it.body
]

  // 正文页
  set page(numbering: "1", margin: (top: 1.5cm, bottom: 1cm, left: 1.8cm, right: 1.8cm),
  footer: context{
    let num = counter(page).display()
    align(center, text(size: 9pt)[#num])
  })
  
  counter(page).update(1)
  body
}
