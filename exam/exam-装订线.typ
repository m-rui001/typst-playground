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
  foreground: context {
    // 是否是正面
    let is-front = calc.rem(counter(page).get().at(0), 2) == 1

    // 正面为 +1，反面为 -1
    let sgn-front = (2 * int(is-front) - 1)

    // 正反面都有装订线
    place(
      center + horizon,
      dx: (3.5cm - 393mm / 2 - 2em) * sgn-front, // TODO: 数值可以自己调节
      dy: 0em,
      rotate(
        -90deg * sgn-front,
        origin: center + horizon,
        block(
          width: 270mm - 3cm * 2,
          stroke: (y: (dash: "dashed")),
          inset: 0.5em,
          "装订线内不要答题".clusters().intersperse(h(2em)).join(),
        ),
      ),
    )
    // 仅正面有信息栏
    if is-front {
      place(
        center + horizon,
        dx: 3.5cm - 393mm / 2 - 4em, // TODO: 数值可以自己调节
        dy: 0em,
        rotate(
          -90deg,
          origin: center + horizon,
          block(
            width: 200mm, // TODO: 数值可以自己调节
            grid(
              gutter: 2em,
              // TODO: 列数和内容再调调
              columns: (1fr,) * 2,
              [学号：#box(width: 5em, stroke: (bottom: 1pt))],
              [姓名：#box(width: 5em, stroke: (bottom: 1pt))],
            ),
          ),
        ),
      )
    }
  },
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
