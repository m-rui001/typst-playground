// 导入必要的包
#import "@preview/cuti:0.2.1": *

// 设置中文粗体显示
#show: show-cn-fakebold

// 扩展试卷模板功能
#let exam-paper(
  // 基础信息
  title: "试卷标题",
  subtitle: none,
  total-score: 100,
  duration: "90分钟",
  
  // 考试详细信息
  course: none,
  grade: none,
  date: none,
  
  // 页面设置
  paper-size: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
  
  // 答题区设置
  answer-space: true,
  space-height: 5cm,
  
  doc
) = {
  // 设置页面属性
  set page(
    paper: paper-size,
    margin: margin,
  )
  
  // 页眉
  align(center)[
    #text(size: 20pt, weight: "bold")[#title]
    #if subtitle != none [
      \ #text(size: 14pt)[#subtitle]
    ]
  ]
  
  // 考试信息表格
  grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    align(left)[
      课程：#course \
      年级：#grade \
      日期：#date
    ],
    align(right)[
      满分：#total-score 分 \
      时间：#duration
    ]
  )
  
  line(length: 100%)
  v(2em)
  
  // 内容区
  doc

}

// 创建全局分数存储
#let scores = state("scores", ())

// 修改problem函数以记录分数
#let problem(id: "",question-height: 6cm, points: 0, body) = {
  scores.update(s => s + ((id, points),))
  text(weight: "bold")[
    题目#id （#points 分）
  ]
  body
  v(question-height)
}

// 计算总分函数
#let total-score() = {
  locate(loc => {
    let score-list = scores.at(loc)
    score-list.map(s => s.at(1)).sum()
  })
}

// 显示分数统计表
#let score-table() = {
  locate(loc => {
    let score-list = scores.at(loc)
    table(
      columns: (auto, auto),
      [题号], [分值],
      ..score-list.flatten(),
      [总分], [#total-score()]
    )
  })
}

// 不同题型模板
#let choice-question(id: "", points: 0, options: (), body) = {
  problem(id: id, points: points)[
    #body
    #for (i, opt) in options.enumerate() [
      #["ABCD".at(i).] #opt \
    ]
  ]
}

#let true-false(id: "", points: 0, body) = {
  problem(id: id, points: points)[
    #body
    #align(center)[
      □ 正确\
      □ 错误
    ]
  ]
}

#let fill-blank(id: "", points: 0, blanks: 1, body) = {
  problem(id: id, points: points)[
    #body
    #for i in range(blanks) [
      #box(width: 4cm, stroke: (bottom: 0.5pt))
    ]
  ]
}

// 评分表
#let score-table(scores) = {
  table(
    columns: scores.len(),
    ..scores.map(s => [题#s.id]),
    ..scores.map(s => str(s.points)),
    [总分], [#eval(scores.map(s => s.points).sum())]
  )
}

// 使用模板
#show: doc => exam-paper(
  title: "typst小卷",
  duration: "90分钟",
  date: "2024年11月20日",
  course: "typst",
  grade: "新手级",
  subtitle: "做个模板，试试看",
  doc,
)

// 选择题
#problem(
  id: "1",
  points: 10,
)[
  在Typst中，以下哪个符号用于标记内容块的开始和结束？

  A. { } \
  B. [ ] \
  C. ( ) \
  D. < >
]

#problem(
  id: "2",
  points: 10,
)[
  Typst中设置文本大小的正确语法是：

  A. ```typ #text[size: 12pt]``` \
  B. ```typ #text(size: 12pt)``` \
  C. ```typ #size(12pt)``` \
  D. ```typ #font(size: 12pt)```
]

// 填空题
#problem(
  id: "3",
  points: 15,
)[
  1. 在Typst中，引用外部包的命令是 #box(width: 3cm, stroke: (bottom: 0.5pt), inset: 0.2em)[
    //type here
  ]
  2. 创建新函数的关键字是 #box(width: 2cm, stroke: (bottom: 0.5pt), inset: 0.2em)[
    //type here
  ]
]

// 判断题
#problem(
  id: "4",
  points: 15,
)[
  请判断以下说法是否正确：
  1. Typst中数学公式需要用\$符号包裹（#h(2em)）
  2. `#show`命令可以修改全局样式（#h(2em)）
]

// 解答题
#problem(
  id: "5",
  points: 50,
)[
  1. 给出一个使用`#show`修改手段缩进具体示例。
  2. 并编写一个计算两数之和的函数。
  
  答：#box(width: 100%, height: 10cm, stroke: 0.5pt, inset: 1em)[
    //type here
  ]
]