#import "@preview/polylux:0.3.1": *

#let font_size = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let font = (
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi")
)

#let uni-short-author = state("uni-short-author", none)
#let uni-short-title = state("uni-short-title", none)

#let title_slide(
  title: [],
  authors: [],
  short-author: []
) = {
  if short-author != none {
    uni-short-author.update(short-author)
  }
  if title != none {
    uni-short-title.update(title)
  }
  let content = {

    align(horizon + center, {
      image("图片/logo.svg", width: 50%)
    })

    align(horizon + center, {
      text(font: font.黑体, size: font_size.小初, fill: white, {
        block(width: 90%, inset: .5em, fill: rgb("2056aeff"))[#title]
      })})

    align(horizon + center, {
        text(font: font.黑体, size: font_size.二号, {block()[#authors]})
        })

    align(bottom + center, {
      text(font: font.黑体, size: font_size.二号, {
        block()[#datetime.today().display("[year] 年 [month] 月 [day] 日")]
      })
    })

    align(bottom + center, text(font: font.黑体, size: font_size.四号, {
      rect(width: 100%, fill: rgb("2056aeff"), stroke: none, {
        grid(
          columns: (25%, 1fr, 18%, 7%),
          align(horizon, text(fill: white, [#uni-short-author.display()])),
          align(horizon, text(fill: white, [#uni-short-title.display()])),
          align(horizon, text(fill: white, [#datetime.today().display("[year] 年 [month] 月 [day] 日")])),
          align(horizon, text(fill: white, [#logic.logical-slide.display() / #utils.last-slide-number]))
        )
      })
    }))
  }

  logic.polylux-slide(content)
}

#let slide(
  title: [],
  body
) = {
  let content = {
    align(top + center, {
      text(font: font.黑体, size: font_size.四号, {
        rect(width: 100%, fill: rgb("2056aeff"), stroke: none, align(horizon, text(fill: white, [#title])))
      })
    })

  set text(font: font.黑体, size: font_size.二号)
  set align(horizon)

  pad(x: 2em, body)

  align(bottom + center, text(font: font.黑体, size: font_size.四号, {
      rect(width: 100%, fill: rgb("2056aeff"), stroke: none, {
        grid(
          columns: (25%, 1fr, 18%, 7%),
          rows: (0.5em, auto),
          align(horizon, text(fill: white, [#uni-short-author.display()])),
          align(horizon, text(fill: white, [#uni-short-title.display()])),
          align(horizon, text(fill: white, [#datetime.today().display("[year] 年 [month] 月 [day] 日")])),
          align(horizon, text(fill: white, [#logic.logical-slide.display() / #utils.last-slide-number]))
        )
      })
    }))
  }

  logic.polylux-slide(content)
}


#let section-title-slide(
  title: []
) = {
  let content = {
    align(top + center, {
      text(font: font.黑体, size: font_size.四号, {
        rect(width: 100%, fill: rgb("2056aeff"), stroke: none, align(horizon, text(fill: white, [#title])))
      })
    })

  align(horizon + center, {
      text(font: font.黑体, size: font_size.小初, fill: white, {
        block(width: 90%, inset: .5em, fill: rgb("2056aeff"))[#title]
      })})

  align(bottom + center, text(font: font.黑体, size: font_size.四号, {
      rect(width: 100%, fill: rgb("2056aeff"), stroke: none, {
        grid(
          columns: (25%, 1fr, 18%, 7%),
          rows: (0.5em, auto),
          align(horizon, text(fill: white, [#uni-short-author.display()])),
          align(horizon, text(fill: white, [#uni-short-title.display()])),
          align(horizon, text(fill: white, [#datetime.today().display("[year] 年 [month] 月 [day] 日")])),
          align(horizon, text(fill: white, [#logic.logical-slide.display() / #utils.last-slide-number]))
        )
      })
    }))
  }

  logic.polylux-slide(content)
}