#set text(lang: "zh", region: "CN", font: "Source Han Serif")

// 我设置好了纸张大小，页边距，两栏。
// 1，我需要在左边页边距那里有一个竖栏的学生学号、姓名信息
// 2，需要在页面底部每栏下面都放置一个页脚，信息类似这样：“XXX课程考试试卷A卷    第x页，共y页”
#let footer-title = "XXX课程考试试卷A卷"

#set page(
  height: 270mm,
  width: 393mm,
  // 您原来设置了`flipped: true`，其实直接指定 height、width 就行。
  // 原来还有`binding: left`，这已经是默认了，也不用专门设置。
  margin: (top: 3cm, bottom: 3cm, inside: 3.5cm, outside: 2.5cm),
  columns: 2,
  header: rotate(
    -90deg,
    origin: top + left,
    place(
      dx: -170mm, // TODO: 数值可以自己调节
      dy: -2em,
      block(
        width: 200mm,// TODO: 数值可以自己调节
        grid(
          gutter: 2em,
          // TODO: 列数和内容再调调
          columns: (1fr,) * 2,
          "学号：_____",
          "姓名：_____",
        ),
      ),
    ),
  ),
  footer: context {
    set align(center)

    grid(
      columns: (1fr,) * 2,
      {
        counter(page).display(
          (n, total) => {
            // TODO: 最后一面只有半边的话，total 不对，暂且手动设置吧；或者看群里其他人有没有办法
            footer-title
            h(2em)
            [第#(2 * n - 1)页，共#(2 * total)页]
          },
          both: true,
        )
      },
      {
        counter(page).display(
          (n, total) => {
            footer-title
            h(1em)
            [第#(2 * n)页，共#(2 * total)页]
          },
          both: true,
        )
      },
    )
  },
)

#rect(width: 100%, height: 100%, fill: blue)
#rect(width: 100%, height: 100%, fill: red)
#rect(width: 100%, height: 100%, fill: blue)
#rect(width: 100%, height: 100%, fill: red)
