#import "@preview/cetz:0.5.2"

#set page(
  width: 20.346cm,
  height: 10cm,
  margin: 0pt,
  fill: white,
)
#set text(fill: black)

#cetz.canvas({
  import cetz.draw: *

  // 固定画布边界，使导出的页面与参考图保持 999:491 的比例。
  rect((0, 0), (20.346, 10), stroke: none, fill: white)

  let axis-stroke = 1.55pt
  let curve-stroke = 1.55pt

  // 坐标轴（箭头采用手工矢量三角形，以贴近原图的狭长箭头）。
  line((0.69, 2.75), (18.89, 2.75), stroke: axis-stroke)
  line((2.11, 1.35), (2.11, 8.29), stroke: axis-stroke)
  line(
    (18.89, 2.75), (18.24, 2.94), (18.39, 2.75), (18.24, 2.56),
    close: true, fill: black, stroke: none,
  )
  line(
    (2.11, 8.29), (1.93, 7.64), (2.11, 7.84), (2.29, 7.64),
    close: true, fill: black, stroke: none,
  )

  // 两段球的抛物线轨迹。
  bezier(
    (2.11, 5.42), (10.60, 2.75),
    (4.32, 7.30), (7.55, 6.86),
    stroke: curve-stroke,
  )
  bezier(
    (10.60, 2.75), (16.28, 2.83),
    (12.10, 5.28), (14.42, 5.26),
    stroke: curve-stroke,
  )

  // 球台和球网。
  rect((2.11, 2.36), (15.75, 2.76), fill: black, stroke: none, radius: 1pt)
  rect((8.88, 2.74), (9.23, 3.83), fill: black, stroke: none, radius: 1pt)

  // “球网”指示箭头。
  line((10.54, 6.00), (9.34, 3.96), stroke: 1.65pt)
  line(
    (9.34, 3.96), (9.38, 4.41), (9.55, 4.12), (9.82, 4.17),
    close: true, fill: black, stroke: none,
  )

  // 下方花括号。
  bezier((2.24, 2.20), (2.52, 1.95), (2.25, 2.03), (2.32, 1.95), stroke: 1.35pt)
  line((2.52, 1.95), (8.49, 1.95), stroke: 1.35pt)
  bezier((8.49, 1.95), (8.90, 1.70), (8.74, 1.95), (8.83, 1.88), stroke: 1.35pt)
  bezier((8.90, 1.70), (9.31, 1.95), (8.97, 1.88), (9.07, 1.95), stroke: 1.35pt)
  line((9.31, 1.95), (15.23, 1.95), stroke: 1.35pt)
  bezier((15.23, 1.95), (15.50, 2.20), (15.43, 1.95), (15.50, 2.03), stroke: 1.35pt)

  // 文字标注。
  content((1.63, 7.74), text(font: "Times New Roman", style: "italic", size: 34pt)[$y$])
  content((1.75, 5.15), text(font: "Times New Roman", style: "italic", size: 27pt)[$A$])
  content((1.43, 1.98), text(font: "Times New Roman", style: "italic", size: 31pt)[$O$])
  content((18.34, 2.25), text(font: "Times New Roman", style: "italic", size: 29pt)[$x$])
  content((10.72, 6.53), text(font: "SimSun", size: 29pt)[球网])
  content(
    (8.90, 1.36),
    [#text(font: "SimSun", size: 20pt)[球台长]#text(font: "Times New Roman", style: "italic", size: 20pt)[2.7m]],
  )
})
