#let project(
  headleft,
  headright,
  text_size: 14pt,
  page_color: "ffe",
  text_color: "314",
  body,
) = {
  import "@preview/pinit:0.1.3": *
  import "@preview/chem-par:0.0.1": *
  import "@preview/tablex:0.0.8": *
  import "@preview/cuti:0.2.1": *

  show: show-cn-fakebold

  set page(
    margin: (top: 60pt, bottom: 40pt, left: 50pt, right: 70pt),

    header: [
      #smallcaps(headleft)
      #h(1fr) #fakeitalic(headright)
    ],
    numbering: "1",
    fill: rgb(page_color)
  )

  set text(
  fill: rgb(text_color),
  size: text_size,
  font: "Open Sans",
  )

  set par(
    leading: 0.6em,
    justify: true,
  )

  set heading(numbering: (..args) => {
    let nums = args.pos()
    if nums.len() == 1 or nums.len() == 2 {
      return numbering("1.1", ..nums)
    } else {
      return
    }
  })

  show math.equation: set text(font: "New Computer Modern Math")

  show heading.where(level: 1): set text(33pt, rgb("#51004d"))

  show heading.where(level: 2): set text(24pt, rgb("#050752"))

  show heading.where(level: 3): it => {
    set text(18pt, rgb("#003617"))
    underline(fakeitalic(it))
  }

  show heading.where(level: 4): it => {
    set text(16pt, rgb("#100202"))
    it
  }

  show heading: it => {
    set text(font: "Calibri")
    smallcaps(it)
  }

  show enum:it=>{
    set text(font: "Calibri", size: text_size - 1pt)
    it
  }

  show link: it => {
    let fill = {
      if type(it.dest) == str {
        blue
      } else if type(it.dest) == label {
        if "tab:" in repr(it.dest) {
          red
        } else if "eq:" in repr(it.dest) {
          green
        } else {
          rgb("#3000cc")
        }
      }
    }
    set text(fill: fill)
    it
  }

  body
}

#show: body => project(
  "健康生活",
  "健康生活",
  body,
)
#outline()

= 测试文段 test paragraph
== test
=== test
==== test

healthy living, 健康生活

*健康生活， healthy*

#link("https://www.baidu.com")[百度]

#link(<test>)[test]
<test>
- test
+ test
H2O