#import "@preview/polylux:0.3.1": *
#import themes.simple: *

#set text(font: "Inria Sans")

#let pdfpc-file = {
  locate(loc => {
    let arr = query(<pdfpc>, loc).map(it => it.value)
    let (config, ..slides) = arr.split((t: "NewSlide"))
    let pdfpc = (
      pdfpcFormat: 2,
      disableMarkdown: false,
    )
    for item in config {
      pdfpc.insert(lower(item.t.at(0)) + item.t.slice(1), item.v)
    }
    let pages = ()
    let current-label = 0
    for slide in slides {
      let page = (
        idx: 0,
        label: 1,
        overlay: 0,
        forcedOverlay: false,
        hidden: false,
      )
      for item in slide {
        if item.t == "Idx" {
          page.idx = item.v
        } else if item.t == "LogicalSlide" {
          page.label = item.v
        } else if item.t == "Overlay" {
          page.overlay = item.v
          page.forcedOverlay = item.v > 0
        } else if item.t == "HiddenSlide" {
          page.hidden = true
        } else if item.t == "SaveSlide" {
          if "savedSlide" not in pdfpc {
            pdfpc.savedSlide = page.label - 1
          }
        } else if item.t == "EndSlide" {
          if "endSlide" not in pdfpc {
            pdfpc.endSlide = page.label - 1
          }
        } else if item.t == "Note" {
          page.note = item.v
        }
      }
      pages.push(page)
    }
    pdfpc.insert("pages", pages)
    [#metadata(pdfpc)<pdfpc-file>]
  })
}

#show: simple-theme.with(
  footer: [Simple slides],
)

#pdfpc-file

#pdfpc.config(
  duration-minutes: 30,
  start-time: datetime(hour: 14, minute: 10, second: 0),
  end-time: datetime(hour: 14, minute: 40, second: 0),
  // last-minutes: 5,
  note-font-size: 12,
  disable-markdown: false,
  default-transition: (
    type: "push",
    duration-seconds: 2,
    angle: ltr,
    alignment: "vertical",
    direction: "inward",
  ),
)

#title-slide[
  = Keep it simple!
  #v(2em)

  #pdfpc.hidden-slide

  Alpha #footnote[Uni Augsburg] #h(1em)
  Bravo #footnote[Uni Bayreuth] #h(1em)
  Charlie #footnote[Uni Chemnitz] #h(1em)

  July 23
]

#slide[
  == First slide

  #lorem(20)

  #pdfpc.save-slide
]

#focus-slide[
  _Focus!_

  This is very important.

  #pdfpc.speaker-note("This is a note that only the speaker will see.")
]

#slide[
  = Let's start a new section!
  
  #pdfpc.speaker-note(
    ```md
    # My notes
    Did you know that pdfpc supports Markdown notes? _So cool!_
    ```
  )
]

#slide[
  == Dynamic slide
  Did you know that...

  #pause
  ...you can see the current section at the top of the slide?

  #pdfpc.end-slide
]