
//#import "@preview/cuti:0.2.1": show-cn-fakebold, fakeitalic
#import "@preview/showybox:2.0.2": *
#import "@preview/in-dexter:0.0.4": *
#import "@preview/physica:0.8.0": *

#let theme = (
  colors: (
    text: rgb("#304"),
    primary: rgb("#2b4692"),
    secondary: rgb("#3f6db5"),
    tertiary: rgb("#003617"),
    quaternary: rgb("#100202"),
    equation: rgb("#ffba743b"),
    tertiary_box_fill: rgb("#cad0b4b3"),
    links: (
      url: rgb("#0366d6"),
      tab: rgb("#e36209"),
      eq: rgb("#22863a"),
      other: rgb("#0000bcc6"),
    ),
    chemical: (
      color: rgb("#2e7d32"),
      bg: rgb("#e8f5e9"),
    ),
  ),
  theorem: (
    theorem: (color: rgb("#1e88e5"), bg: rgb("#e3f2fd")),
    lemma: (color: rgb("#43a047"), bg: rgb("#e8f5e9")),
    corollary: (color: rgb("#7b1fa2"), bg: rgb("#f3e5f5")),
    definition: (color: rgb("#ff6f00"), bg: rgb("#fff3e0")),
    keyword: (color: rgb("#d32f2f"), bg: rgb("#ffebee")),
    fact: (color: rgb("#ff9800"), bg: rgb("#fff3e0")),
  ),
)

// 创建索引收集器
#let index-collector = state("index-collector", ())

#let make-theorem-env(kind, title-prefix) = {
  let style = theme.theorem.at(kind)
  let thm-counter = counter(kind)

  return (body, numbered: true, subtitle: none) => context {
    let number = if numbered {
      counter.step(thm-counter)
      str(thm-counter.get().first() + 1)
    }

    showybox(
      breakable: measure(body).height > 0.1 * page.height,
      width: 100%,
      frame: (
        border-color: style.color,
        title-color: style.bg,
        body-color: style.bg,
        radius: 4pt,
        thickness: 1pt,
        inset: (x: 1.2em, y: .8em),
      ),
      title-style: (color: style.color, weight: "bold", align: left),
      body-style: (color: black, align: left),
      title: [
        #title-prefix #if number != none [
          #h(0.3em)
          #number
        ]
      ],
      {
        if subtitle != none {
          align(center, text(size: 1.2em, weight: "bold", fill: style.color, subtitle))
          v(0.5em)
        }
        body
      },
    )
  }
}

#let theorem = make-theorem-env("theorem", "Theorem")
#let lemma = make-theorem-env("lemma", "Lemma")
#let corollary = make-theorem-env("corollary", "Corollary")


#let sanitize-label(str) = {
  str.replace(" ", "-").replace("(", "").replace(")", "")
}

#let definition(subtitle, body) = {
  let label-text = "def-" + sanitize-label(subtitle)

  index-collector.update(entries => {
    entries.push(("定义", subtitle, label-text))
    entries
  })

  make-theorem-env("definition", "Definition")(
    subtitle: subtitle,
    [#body #label(label-text)],
  )
}

#let keyword(subtitle, body) = {
  let label-text = "kw-" + sanitize-label(subtitle)

  index-collector.update(entries => {
    entries.push(("关键词", subtitle, label-text))
    entries
  })

  make-theorem-env("keyword", "Key Words")(
    subtitle: subtitle,
    [#body #label(label-text)],
  )
}

#let project(
  headleft,
  headright,
  text_size: 18pt,
  page_color: "fffff3",
  text_color: theme.colors.text,
  header_color: "51004d",
  leading: 0.9em,
  spacing: 1.3em,
  header_inset: 0.2em,
  page_margin: auto,
  body,
) = {
  let colors = (
    page: rgb(page_color),
    header: rgb(header_color),
    text: rgb(text_color),
  )

  let heading_sizes = (
    text_size + 24pt,
    text_size + 13pt,
    text_size + 7pt,
    text_size + 3pt,
  )

  let heading_colors = (
    theme.colors.primary,
    theme.colors.secondary,
    theme.colors.tertiary,
    theme.colors.quaternary,
  )

  let text-styles = (
    base: (
      font: ("Open Sans", "Fangsong"),
      fill: colors.text,
      size: text_size,
    ),
    heading: (font: ("Calibri", "Kaiti")),
  )

  show: doc => {
    show heading: set heading(numbering: "1.")

    set outline(
      indent: 2em,
      depth: 3,
      title: none,
    )

    set page(
      margin: page_margin,
      header: context {
        set text(fill: colors.header)
        box(
          width: 100%,
          inset: (bottom: 0.6em),
        )[
          #smallcaps(headleft)
          #h(1fr)
          #headright
          #v(-0.3em)
          #line(length: 100%, stroke: 0.5pt + colors.header)
        ]
      },
      numbering: "1",
      fill: colors.page,
    )

    set text(..text-styles.base)
    set par(
      justify: true,
      leading: leading,
      spacing: spacing,
    )

    show strong: it => text(
      weight: "bold",
      fill: theme.colors.primary,
      it.body,
    )

    show heading: it => {
      if it.level <= 4 {
        let idx = it.level - 1
        set text(
          font: text-styles.heading.font,
          heading_sizes.at(idx),
          heading_colors.at(idx),
        )

        if it.level == 1 {
          block(spacing: 1.2em)[
            #text(weight: "bold")[#align(center, it)]
            #v(-0.8em)
            #line(length: 100%, stroke: (thickness: 1.5pt, paint: theme.colors.primary))
          ]
        } else if it.level == 2 {
          block(spacing: 0.8em)[
            #text(weight: "bold")[#it]
            #v(-0.8em)
            #line(length: 100%, stroke: (thickness: 1.2pt, dash: "dotted", paint: theme.colors.secondary))
          ]
        } else if it.level == 3 {
          block(
            stroke: (left: 0.12em + theme.colors.tertiary),
            fill: rgb(theme.colors.tertiary_box_fill),
            inset: (x: 0.5em, y: 0.4em),
            radius: (left: 0.1em, right: 1em),
          )[#it]
        } else {
          block(
            fill: rgb("#edf2f7"),
            inset: (x: 0.6em, y: 0.2em),
            radius: 0.3em,
          )[#smallcaps(it)]
        }
      }
    }

    show math.equation: eq => context {
      let math-text = text(font: "New Computer Modern Math", eq)
      math-text
    }

    show list: set text(
      font: ("Calibri", "Kaiti"),
      size: text_size,
    )

    let link-colors = (
      str: theme.colors.links.url,
      tab: theme.colors.links.tab,
      eq: theme.colors.links.eq,
      other: theme.colors.links.other,
    )

    show link: it => {
      let color = if type(it.dest) == str {
        link-colors.str
      } else if "tab:" in repr(it.dest) {
        link-colors.tab
      } else if "eq:" in repr(it.dest) {
        link-colors.eq
      } else {
        link-colors.other
      }
      text(fill: color, weight: "medium", underline(it))
    }

    doc
  }
  body
}

#let proof(body) = block(spacing: 1em)[
  #set text(style: "italic")
  *Proof.* #h(0.5em) #body #h(1fr) □
]

#let fact = make-theorem-env("fact", "Fact")
#let clr(color, content) = text(rgb(color))[#content]

#let show-index(title: "索引") = {
  heading(level: 1, title)
  context {
    let entries = index-collector.final()
    let grouped = (:)
    for (type, term, label-text) in entries {
      if type not in grouped {
        grouped.insert(type, ())
      }
      grouped.at(type).push((term, label-text))
    }
    for (type, terms) in grouped {
      heading(level: 2, type)
      let sorted-terms = terms.sorted(key: ((term, _)) => term)
      for (term, label-text) in sorted-terms {
        [ + #link(label(label-text))[#term]]
      }
    }
  }
}


#let chem-rules = (
  compound: regex("[A-Z][a-z]?[0-9]+|\\([A-Z][a-z]+\\)[0-9]+"),
  ion: regex("[A-Z][a-z]?\\^\\([0-9+-]+\\)"),
  state: regex("[A-Z][a-z]?(?:[0-9]+)?\\([a-z]+\\)"),
  complex: regex("[A-Z][a-z]?\\([A-Z][A-Za-z]\\)[0-9]+"),
)


#let process-chemistry = body => {
  show "react": $arrow$
  show "equilibrium": math.arrow.l.r
  show "Delta": sym.Delta
  show "+": $ + $

  show chem-rules.complex: it => {
    let parts = it.text.split("(")
    let base = parts.at(0)
    let group = parts.at(1).split(")").at(0)
    let number = parts.at(1).split(")").at(1)
    $base(group)_number$
  }

  show chem-rules.compound: it => {
    if it.text.starts-with("(") {
      let group = it.text.find(regex("\\([A-Z][a-z]+\\)"))
      let number = it.text.find(regex("[0-9]+"))
      $(group)_number$
    } else {
      let element = it.text.find(regex("[A-Z][a-z]?"))
      let number = it.text.find(regex("[0-9]+"))
      $element_number$
    }
  }

  show chem-rules.ion: it => {
    let element = it.text.find(regex("[A-Z][a-z]?"))
    let charge = it.text.find(regex("[0-9+-]+"))
    show "+": math.plus
    show "-": math.minus
    $element^charge$
  }

  show chem-rules.state: it => {
    let element = it.text.find(regex("[A-Z][a-z]?"))
    let number = it.text.find(regex("[0-9]+"))
    let state = it.text.find(regex("\\([a-z]+\\)"))
    if number == "" {
      $element_state$
    } else {
      $element_(number state)$
    }
  }

  $upright(#body)$
}

#let reaction(body) = {
  showybox(
    breakable: false,
    width: 100%,
    frame: (
      border-color: theme.colors.chemical.color,
      title-color: theme.colors.chemical.bg,
      body-color: theme.colors.chemical.bg,
      radius: 4pt,
      thickness: 1pt,
      inset: (x: 1.2em, y: .8em),
    ),
    title-style: (color: theme.colors.chemical.color, weight: "bold", align: left),
    body-style: (color: black, align: center),
    title: "Reaction",
    {
      set text(font: "New Computer Modern Math")
      set math.equation(numbering: "eq 1.")
      v(1em)
      process-chemistry(body)
    },
  )
}


#let chemical = body => [#process-chemistry(body)]


//------ 自定义常用模块 ------

#let red-highlight(body) = highlight(radius: 3pt, fill: rgb("dd16224a"))[#body]