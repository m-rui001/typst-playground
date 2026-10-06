// 基础设置
#set page(
  paper: "a4",
  margin: (x: 2.7cm, y: 3.7cm),
  header: states => [
    if states.page > 1 [
      line(length: 100%, stroke: 0.5pt)
      text(16pt, font: "黑体", "某某项目报告")
    ]
  ],
  footer: align(outer)[
    -#page-numbering("1")-
  ]
)

// 全局字体
#set text(font: "仿宋_GB2312", size: 16pt)

// 标题系统
#show heading: set block(break: avoid)
#show heading.where(level: 1): it => [
  #set text(font: "黑体")
  #counter(heading).display(format: n => chinese(n) + "、")#it.body
]
#show heading.where(level: 2): it => [
  #set text(font: "楷体")
  （#counter(heading).display(format: n => chinese(n))）#it.body
]
#show heading.where(level: 3): it => [
  #set text(font: "仿宋_GB2312", weight: "bold")
  #counter(heading).display().#it.body
]
#show heading.where(level: 4): it => [
  #set text(font: "仿宋_GB2312")
  （#counter(heading).display()）#it.body
]

// 表格系统
#show table.caption: set text(font: "黑体", size: 14pt, block(above: 8pt))
#show table: set text(font: "宋体", size: 10.5pt)
#let table(body, caption) = {
  counter(table).update()
  table(
    caption: [表1-#counter(table).display() #caption],
    ..body
  )
}

// 图片系统
#show figure.caption: set text(font: "黑体", size: 14pt, block(below: 8pt))
#let figure(img, caption) = {
  counter(figure).update()
  figure(
    image(img, width: 60%),
    caption: [图1-#counter(figure).display() #caption]
  )
}

// 生成多页示例
#counter(heading).update(1)
#counter(table).update(1)
#counter(figure).update(1)

#for i in range(10) {
  = heading[章节 #chinese(i+1)] <level:1>
  #lorem(300)
  
  == heading[二级标题] <level:2>
  #lorem(200)
  
  === heading[三级标题] <level:3>
  #table(
    columns: 4,
    [,,年度数据统计],
    [项目, 2022, 2023, 增长率],
    [销售额, 120, 150, 25%]
  )[示例表格]
  
  #figure("placeholder.png")[示例图片]
  
  ==== heading[四级标题] <level:4>
  #lorem(150)
  
  #pagebreak()
}
