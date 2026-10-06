// 导入touying幻灯片包
#import "@preview/touying:0.5.2": *
// 使用Metropolis主题
#import themes.metropolis: *
// 导入numbly标题编号格式包
#import "@preview/numbly:0.1.0": numbly

#let template(
  doc,
) = {
  // 设置字体为思源宋体，并设置文本粗细
  set text(font: "Noto Sans CJK SC", lang: "zh", weight: "extralight", size: 30pt)

  // 设置章节编号格式
  set heading(numbering: numbly("{1}.", default: "1.1"))

  // 设置加粗字体（因为模板把默认的加粗改为变颜色了）
  // #let bold(str) = text(weight: "bold", str)

  doc
}

// 设置表格格式
#let my-table(it) = {
  set table(fill: (_, y) => if y == 0 {
    blue.lighten(20%)
  })

  show table.cell.where(y: 0): it => {
    set align(center)
    set text(white, 24pt, weight: "bold")
    it
  }
}