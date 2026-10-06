#import "../template/globals_template.typ": *
#show table: my-table
// 修改幻灯片模板参数
#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [算法及其实现],
    subtitle: [信息的处理],
    author: [吴启新],
    date: datetime.today(),
    institution: [贵阳市第十八中学],
    logo: emoji.computer,
  ),
)

// 设置表格格式
// #set table(
//   fill: (_, y) => if y == 0 {
//     blue.lighten(20%)
//   },
// )

// #show table.cell.where(y: 0): it => {
//   set align(center)
//   set text(white, 24pt, weight: "bold")
//   it
// }

#title-slide()
#set text(lang: "zh")
#components.adaptive-columns(outline(title: text(size: 28pt)[目录], indent: 1em, depth: 1))

= 数据类型及其运算

计算机中的所有信息都是以二进制数据形式编码并存放在计算机中

== 数据类型

Python 中的数据类型
- 数值型
  - 整形
  - 浮点型
- 字符串型
- 布尔型

#align(center)[
  #figure(
    table(
      columns: 2,
      table.header([数据类型],[实例表示]),
      [整形（int）],[数学中的整数，如 -1，0，2],
      [浮点型（float）],[],
      [字符串型（str）],[],
      [布尔型（bool）],[],
    ),
    caption: [Python部分数据类型]
  )
]





#focus-slide[#text(88pt)[End]]
