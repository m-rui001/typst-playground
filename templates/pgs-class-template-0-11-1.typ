// MIT License:
//
// Copyright (c) 2024 PgBiel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// --- cetz-utils.typ (inlined)

#import "@preview/cetz:0.2.1"
#let show-canvas(..args) = align(center, cetz.canvas(..args))

#let canvas-3d(body, axes: false, axes-lens: (2, 2, 2), ..args) = {
  if type(axes-lens) in (int, float) {
    axes-lens = (axes-lens, axes-lens, axes-lens)
  } else if type(axes-lens) == array {
    assert.eq(3, axes-lens.len(), message: "Specify the lengths of the three axes.")
  } else {
    panic("'axes-lens' must be number or array.")
  }

  align(center, cetz.canvas(
    ..args.named(),
    {
      import cetz.draw: *
      set-transform(cetz.matrix.transform-rotate-dir((1, 1, -1.3), (0, 1, .3)))
      if axes {
        let (x-len, y-len, z-len) = axes-lens
        line((-x-len, 0, 0), (x-len, 0, 0), name: "x-axis", mark: (end: "stealth"))
        content((rel: (0.2, 0, 0)))[$x$]
        line((0, -y-len, 0), (0, y-len, 0), name: "y-axis", mark: (end: "stealth"))
        content((rel: (0, 0.2, 0)))[$y$]
        line((0, 0, z-len), (0, 0, -z-len), name: "z-axis", mark: (end: "stealth"))
        content((rel: (0, 0, -0.2)))[$z$]
      }
      body
    }
  ))
}

#let canvas-3d-x(body, preamble: (), axes: false, axes-labels: ($x$, $y$, $z$), axes-lens: (4, 4, 4), axes-min: (auto, auto, auto), ..args) = {
  if type(axes-lens) in (int, float) {
    axes-lens = (axes-lens, axes-lens, axes-lens)
  } else if type(axes-lens) == array {
    assert.eq(3, axes-lens.len(), message: "Specify the lengths of the three axes.")
  } else {
    panic("'axes-lens' must be number or array.")
  }

  align(center, cetz.canvas(
    ..args.named(),
    {
      import cetz.draw: *
      rotate(x: -90deg)
      preamble

      if axes {
        let (x-label, y-label, z-label) = axes-labels
        let (x-len, y-len, z-len) = axes-lens
        let (x-min, y-min, z-min) = axes-min.enumerate().map(((i, min)) => if min == auto { -axes-lens.at(i) } else { min })
        line((x-min, 0, 0), (x-len, 0, 0), name: "x-axis", mark: (end: "stealth"))
        if x-label != none { content((rel: (0.2, 0, 0)), x-label) }
        line((0, y-min, 0), (0, y-len, 0), name: "y-axis", mark: (end: "stealth"))
        if y-label != none { content((rel: (0, 0.2, 0)), y-label) }
        line((0, 0, z-min), (0, 0, z-len), name: "z-axis", mark: (end: "stealth"))
        if z-label != none { content((rel: (0, 0, 0.2)), z-label) }
      }
      body
    }
  ))
}

// ---

// graphs.typ (inlined)

// Normally this is imported under the module name 'graphs'
// so functions here would be qualified as graphs.make etc.
// and then you'd write '#import graphs: *' inside actual graphs

#import "@preview/fletcher:0.5.1"

#let make(..args) = {
  fletcher.diagram(node-stroke: .1em,  node-shape: "circle", ..args)
}

#let loop(reverse: false, ..args) = {
  let bend_direction = if reverse { -1 } else { 1 }
  fletcher.edge("rl", "->", bend: 120deg * bend_direction, ..args)
}

#let edge = fletcher.edge
#let edir(..args) = {
  fletcher.edge(..args, "->")
}

#let vtt(..args) = {
  let pos = if args.pos() == () { (hide[$x$],) } else { args.pos() }
  fletcher.node(shape: "circle", stroke: 0.1em, ..pos, ..args.named())
}

#let vt(..args) = {
  let pos = if args.pos() == () { (hide[$x$],) } else { ($#args.pos().first()$, ..args.pos().slice(1)) }

  vtt(..pos, ..args.named())
}

// ---


#import "@preview/physica:0.9.2"
#import "@preview/hydra:0.4.0": hydra

// --- Titles and headings ---
#let intro(title, subtitle: none, date: none, author: none) = [
  #align(center, text(56pt)[_*#title;*_])
  #v(-2em)
  #if subtitle != none { align(center, text(28pt, subtitle)) }
  #if author != none { align(center, text(22pt, author)) }
  #if date != none { align(center, text(20pt, date.display("[year]-[month]-[day]"))) }
  #v(2em)
  #outline()
  #pagebreak(weak: true)
]

#let page-footer(doc) = {
  set page(footer: context {
    if counter(page).get() == counter(page).final() {
      grid(
        columns: (1fr,) * 3,
        align(left)[_Document made with Typst_],
        align(center, counter(page).display("1")),
      )
    } else {
        align(center, counter(page).display("1"))
    }
  })
  doc
}

#let top-heading(head) = {
  let number = if head.numbering != none { emph(counter(heading).display()) + h(10pt, weak: true) }
  set text(white)
  set text(2em)
  pagebreak(weak: true)
  block(fill: gradient.linear(..color.map.crest.rev()), width: 100%, inset: 10pt)[
    #if number != none { grid(columns: 2, column-gutter: 10pt, number, head.body) } else { head.body }
  ]
}

#let top-heading-entry(entry) = {
  let head = entry.element
  let number = if head.numbering != none { emph(numbering(head.numbering, ..counter(heading).at(head.location()))) + h(10pt, weak: true) }
  set text(white)
  set text(1.5em)
  v(1.5em, weak: true)

  let inner-content = [#head.body#h(1fr)#entry.page]

  link(head.location(), box(fill: gradient.linear(..color.map.crest.rev()), width: 100%, inset: 7.5pt)[
    *#if head.numbering != none { grid(columns: 2, column-gutter: 10pt, number, inner-content) } else { inner-content }*
  ])
}

#let secondary-heading(head) = {
  set text(1.3em)
  head
}

#let tertiary-heading(head) = {
  set text(1.2em)
  head
}

// --- Figure ---
#let start-figure(body, ..args) = {
  assert.eq(args.pos().len(), 0, message: "'start-figure' takes a single argument.")
  figure(
    block(width: 100%, align(start, body)),
    ..args.named()
  )
}

// --- Outline ---
#let outline-config(doc) = {
  set outline(indent: 2em)
  show outline.where(target: heading.where(outlined: true)): it => {
    show outline.entry.where(level: 1): top-heading-entry
    show outline.entry.where(level: 2): it => {
      [*#it*]
    }
    it
  }
  doc
}

// --- Envs ---
#let make-env(label, body, kind: none, box-args: (:)) = {
  assert.ne(kind, none)
  show figure.where(kind: kind): set block(breakable: true)
  start-figure(
    box(label, inset: 3pt, baseline: 3pt, ..box-args) + h(5pt, weak: true) + body,
    kind: kind,
    supplement: []
  )
}

#let make-fill-env(fill, ..args, box-args: (:)) = {
  make-env(
    box-args: (fill: fill, ..box-args),
    ..args
  )
  
}

#let make-inferno-env = make-fill-env.with(gradient.linear(..color.map.flare.rev()))

#let make-turbo-env = make-fill-env.with(gradient.linear(..color.map.turbo.map(c => c.darken(25%))))

#let example(body) = {
  make-fill-env(
    orange.darken(10%),
    text(luma(240))[*_Example_*],
    body,
    kind: "example"
  )
}

#let solution(body) = {
  make-inferno-env(
    text(luma(240))[*_Solution_*],
    body,
    kind: "solution"
  )
}

#let define(body) = {
  make-fill-env(
    gradient.linear(..color.map.crest.rev().map(x => x.darken(6%))),
    text(luma(240))[*_Definition_*],
    body,
    kind: "definition"
  )
}

#let property(body) = {
  make-inferno-env(
    text(luma(240))[*_Property_*],
    body,
    kind: "property"
  )
}

#let obs(body) = {
  make-inferno-env(
    text(luma(240))[*_Obs._*],
    body,
    kind: "obs"
  )
}

#let tip(body) = {
  make-inferno-env(
    text(luma(240))[*_Tip_*],
    body,
    kind: "tip"
  )
}

#let warning(body) = {
  make-fill-env(
    red.lighten(20%),
    text(luma(240))[*_Warning_*],
    body,
    kind: "warning"
  )
}

#let theorem(body) = {
  make-turbo-env(
    text(luma(240))[*_Theorem_*],
    body,
    kind: "theorem"
  )
}

#let proof(body) = {
  make-inferno-env(
    text(luma(240))[*_Proof_*],
    body + h(1fr) + $square.stroked$,
    kind: "proof"
  )
}

// --- Theorem stuff ---
#let make-env(label, body, kind: none, box-args: (:)) = {
  assert.ne(kind, none)
  start-figure(
    box(label, inset: 3pt, baseline: 3pt, ..box-args) + h(5pt, weak: true) + body,
    kind: kind,
    supplement: []
  )
}

// --- Raw ---
#let load-syntaxes(doc) = {
  // set raw(syntaxes: "/assets/syntaxes/syntax.sublime-syntax")
  doc
}

// --- Etc ---
#let link-settings(doc) = {
  show link: set text(blue.darken(15%))
  doc
}

// --- Math ---
#import physica: pdv, dv
#let sen = math.op("sen")
#let tg = math.op("tg")
#let intprod(..args) = $lr(angle.l #args.pos().join([, ]) angle.r)$
#let boxed(body) = align(center, rect(body))

// --- Main ---
#let main(doc, title: "Subject Name", subtitle: none, doctitle: auto, date: none, author: [_Your Name_]) = {
  set document(title: if doctitle == auto {
    if subtitle != none [#title - #subtitle] else { title }
  } else {
    doctitle
  })

  set document(date: date)

  set text(lang: "en")
  set text(font: "Source Sans Pro")
  set heading(numbering: "1.")
  set list(marker: ($circle.filled.small$, $circle.small$, $square.filled.small$))

  show: load-syntaxes
  show: outline-config
  show: page-footer
  intro(title, subtitle: subtitle, date: date, author: author)

  show: link-settings
  show heading.where(level: 1): top-heading
  show heading.where(level: 2): secondary-heading
  show heading.where(level: 3): tertiary-heading

  // Section header
  set page(header: context {
    if calc.odd(here().page()) {
      align(right, emph(hydra(1)))
    } else {
      align(left, emph(hydra(2)))
    }
  })

  doc
}

// Sample document

#show: main.with(
  subtitle: [Class: More on Derivatives],
  date: datetime(day: 1, month: 1, year: 2024),
)

= Functions

== Concept

#lorem(30)

== Derivatives


#lorem(30)

#boxed[$ dif z = f_x (x, y) dif x + f_y (x, y) dif y$]

#lorem(20)

#boxed[$ dif z = pdv(z, x) dif x + pdv(z, y) dif y $]

#lorem(20)

#let pdv = physica.pdv
#[
  #let matdisp(..args) = math.mat(..args.pos().map(row => row.map(math.display)), ..args.named())
  $
F'(X_0) = matdisp(
  pdv(f_1 (X_0), x_1), pdv(f_1 (X_0), x_2), dots.c, pdv(f_1 (X_0), x_n);
  pdv(f_2 (X_0), x_1), pdv(f_2 (X_0), x_2), dots.c, pdv(f_2 (X_0), x_n);
  dots.v, dots.v, dots.down, dots.v;
  pdv(f_m (X_0), x_1), pdv(f_m (X_0), x_2), dots.c, pdv(f_m (X_0), x_n)
)
$]

== Types

=== Bijections

Here are some equations:

#stack(dir: ltr, spacing: 1fr,
    $
      x &= 3/(1 - lambda)\
      x &= 3/(1 - (1 + sqrt(11)/2))\
      x &= -3/(sqrt(11)/2) = -6/sqrt(11)\
      x &= -(6sqrt(11))/ 11
    $,
    $
      y &= 1/(1 - lambda)\
      y &= 1/(1 - (1 + sqrt(11)/2))\
      y &= -1/(sqrt(11)/2) = -2/sqrt(11)\
      y &= -(2sqrt(11))/ 11
    $,
    $
      z &= -1/(1 - lambda)\
      z &= -1/(1 - (1 + sqrt(11)/2))\
      z &= 1/(sqrt(11)/2) = 2/sqrt(11)\
      z &= (2sqrt(11))/ 11
    $,
  
    )

=== Sine

#lorem(30)

= Boxes

#define[$f$ is a function.]

#property[$f(x) = 5$]
#warning[Careful!]

#tip[You can subtract $A$ from $B$.]

#theorem[$x + y = 5$]
#proof[It is self-evident.]


= Some Figures

#figure(canvas-3d(axes: false, {
  import cetz.draw: *
  rect((0, 0, 0), (3, 3, 0))
  line((0.5, 1, 0), (rel: (0, 0, -1)), mark: (end: "stealth"))
  content((rel: (0, 0, -0.2)))[$arrow(u)$]
  line((1.5, 1.5, 0), (rel: (0, 0, -1)), mark: (end: "stealth"))
  content((rel: (0, 0, -0.2)))[$arrow(u)$]

  let A = (1.5, 1.5, 0)
  let B = (2.6, 1.5, 0)
  content((rel: (-0.2, -0.2, 0), to: A), name: "A")[$A$]
  content((rel: (0.05, 0.2, 0), to: B), name: "B")[$B$]
  line(A, B, mark: (end: "stealth"))
}), caption: [Some vectors])

#show-canvas({
  import cetz.draw: *
  cetz.plot.plot(
    size: (4, 4),
    axis-style: "school-book",
    x-tick-step: 1,
    y-tick-step: 1,
    x-min: -1,
    x-max: 4,
    y-min: -2,
    y-max: 4,
    {
      cetz.plot.add(
        ((1, 3), (2, 1), (3, -1))
      )
    }
  )
})

#canvas-3d(axes: true, {
  import cetz.draw: *
  let A = (0.75, 0, -1)
  let B = (4, 0, -1.5)
  circle(A, radius: 2pt, fill: black, name: "A")
  content((rel: (-0.25, 0, 0)), align(center)[$A$\ $alpha(t)$])
  circle(B, radius: 2pt, fill: black, name: "B")
  content((rel: (1, 0, 0.25)), align(left)[$B$\ $alpha(t + h)$])
  line(A, B, stroke: red, mark: (end: "stealth"), name: "arrow")
  content((rel: (-0.25, 0, -1), to: (name: "arrow", anchor: 50%)))[$text(#red, alpha(t + h) - alpha(t))$]
})


#figure(cetz.canvas({
    import cetz.draw: *
    import cetz: plot
    plot.plot(
      size: (8, 6),
      x-min: 0,
      x-max: 2,
      y-min: 0,
      y-max: 2,
      x-tick-step: 1,
      y-tick-step: 1,
      axis-style: "left",
      {
        plot.add-vline(
          1,
          style: (stroke: (dash: "dashed", paint: red))
        )
        plot.add-hline(
          1,
          style: (stroke: (dash: "dashed", paint: red))
        )
        plot.annotate(
          content((1.5, 1.5))[Section 1]
        )
        plot.annotate(
          content((0.5, 1.5))[Section 2]
        )
        plot.annotate(
          content((0.5, 0.5))[Section 3]
        )
        plot.annotate(
          content((1.5, 0.5))[Section 4]
        )
      }
    )
  }), caption: [Sections])

#figure(cetz.canvas({
    import cetz.draw: *
    import cetz: plot
    plot.plot(
      size: (8, 6),
      x-min: 0,
      x-max: 4,
      y-min: 0,
      y-max: 3,
      x-ticks: ((1, $a$), (4, $b$)),
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        let data1 = x => 2 + 1/3 * calc.sin(2*x - 2)
        let data2 = x => 1 + 1/3 * calc.sin(2*x - 2)
        plot.add-fill-between(
          domain: (1, 4),
          samples: 150,
          style: (fill: blue.transparentize(75%)),
          data1,
          data2
        )
        plot.add(
          domain: (1, 4),
          samples: 150,
          data1
        )
        plot.add(
          domain: (1, 4),
          samples: 150,
          data2
        )

        plot.annotate(
          content((2.5, 1.5), text(blue.darken(20%))[$D$])
        )
        plot.annotate(
          content((2.5, 2.25), anchor: "south")[#text(red.darken(20%), $h(x)$)]
        )
        plot.annotate(
          content((2.5, 0.85), anchor: "north")[#text(green.darken(30%), $g(x)$)]
        )
        plot.add-vline(1, max: data2(1), style: (stroke: (dash: "dashed", paint: luma(150))))
        plot.add-vline(4, max: data2(4), style: (stroke: (dash: "dashed", paint: luma(150))))
      }
    )
  }), caption: [Area between two function graphs])

  #figure(cetz.canvas({
    import cetz.draw: *
    import cetz: plot
    plot.plot(
      size: (8, 6),
      x-min: 0,
      x-max: 4,
      y-min: 0,
      y-max: 3,
      x-ticks: ((1, $a$), (4, $b$)),
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        let data1 = x => 2 + 1/3 * calc.sin(2*x - 2)
        let data2 = x => 1 + 1/3 * calc.sin(2*x - 2)
        plot.add-fill-between(
          domain: (1, 4),
          samples: 150,
          style: (fill: blue.transparentize(75%)),
          data1,
          data2
        )
        plot.add(
          domain: (1, 4),
          samples: 150,
          data1
        )
        plot.add(
          domain: (1, 4),
          samples: 150,
          data2
        )

        plot.annotate(
          content((2.5, 1.5), text(blue.darken(20%))[$D$])
        )
        plot.annotate(
          content((2.5, 2.25), anchor: "south")[#text(red.darken(20%), $h(x)$)]
        )
        plot.annotate(
          content((2.5, 0.85), anchor: "north")[#text(green.darken(30%), $g(x)$)]
        )
        plot.add-vline(1.5, style: (stroke: orange, mark: (end: (symbol: ">", pos: 40%, fill: orange, shorten-to: none))))
        plot.annotate(
          content((1.6, data2(1.5) - 0.1), anchor: "north-west")[#text(orange.darken(30%))[In]]
        )
        plot.annotate(
          content((1.6, data1(1.5) + 0.15), anchor: "south-west")[#text(orange.darken(30%))[Out]]
        )
      }
    )
  }), caption: [There's an arrow])

  #figure(cetz.canvas({
    import cetz.draw: *
    import cetz: plot
    let transpose-points(p) = p.map(((x, y)) => (y, x))

    plot.plot(
      size: (8, 6),
      x-min: 0,
      x-max: 3,
      y-min: 0,
      y-max: 5,
      y-ticks: ((1, $c$), (4, $d$)),
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        let data1 = x => 2 + 1/3 * calc.sin(2*x - 2)
        let data2 = x => 1 + 1/3 * calc.sin(2*x - 2)

        let tdata1 = transpose-points(
          plot.sample-fn(
            data1,
            (1, 4),
            150
          )
        )
        let tdata2 = transpose-points(
          plot.sample-fn(
            data2,
            (1, 4),
            150
          )
        )

        plot.add-fill-between(
          domain: (1, 4),
          samples: 150,
          style: (fill: blue.transparentize(75%)),
          tdata1,
          tdata2
        )
        plot.add(tdata1)
        plot.add(tdata2)

        

        plot.annotate(
          content(((data1(2.5) + data2(2.5)) / 2, 2.5), text(blue.darken(20%))[$D$])
        )
        plot.annotate(
          content((data1(2.5) + 0.15, 2.5), anchor: "west")[#text(red.darken(20%), $h(y)$)]
        )
        plot.annotate(
          content((data2(2.5) - 0.15, 2.5), anchor: "east")[#text(green.darken(30%), $g(y)$)]
        )
        plot.add-hline(1, max: data2(1), style: (stroke: (dash: "dashed", paint: luma(150))))
        plot.add-hline(4, max: data2(4), style: (stroke: (dash: "dashed", paint: luma(150))))
      }
    )
  }), caption: [Sideways])

#figure(cetz.canvas({
  import cetz.draw: *
  import cetz: plot

  let r1 = 1
  let r2 = 1.5

  plot.plot(
    size: (6, 6),
    x-min: 0,
    x-max: 1.5,
    y-min: 0,
    y-max: 1.5,
    x-ticks: ((r1, $a$), (r2, $b$)),
    y-ticks: ((r1, $a$), (r2, $b$)),
    x-tick-step: none,
    y-tick-step: none,
    axis-style: "school-book",
    {
      let t1 = 15deg
      let t2 = 45deg
      plot.annotate({
        cetz.angle.angle((0, 0), (t1, r1), (t2, r2), radius: 0.6, label: text(red.darken(20%), $Delta theta$), label-radius: 120%, stroke: red)
        cetz.angle.angle((0, 0), (0deg, r1), (t1, r1), radius: 0.25, label: text(green.darken(20%), $c$), label-radius: 125%, stroke: green)
        cetz.angle.angle((0, 0), (0deg, r1), (t2, r1), radius: 0.4, label: text(green.darken(20%), $d$), label-radius: 120%, stroke: green)
      })

      plot.annotate(
        {
          line((0, 0), (t1, r1), stroke: (dash: "dashed", paint: blue))

          line((0, 0), (t2, r1), stroke: (dash: "dashed", paint: blue), name: "point-radius")
          // content((rel: (0.0, 0.1), to: "point-radius.mid"), anchor: "south-east", text(blue.darken(20%))[$a$])

          line((t1, r1), (t1, r2), stroke: (paint: blue))
          line((t2, r1), (t2, r2), stroke: (paint: blue))
        }
      )

      plot.annotate({
        merge-path(stroke: none, fill: blue.transparentize(70%), {
          line((t1, r1), (t1, r2), stroke: none)
          arc-through((t1, r1), ((t1 + t2) / 2, r1), (t2, r1))
          line((t2, r1), (t2, r2), stroke: none)
          arc-through((t2, r2), ((t1 + t2) / 2, r2), (t1, r2))
        }, name: "A")
        content(((t1 + t2) / 2, (r1 + r2) / 2))[$text(#blue.darken(20%), R)$]
      })

      let c-between(a, b, r: none, ..args) = plot.add(
        domain: (a, b),
        x => calc.sqrt(r*r - x*x),
        ..args
      )

      // INNER CIRCLE

      // 1. Dashed between 0 and r1 * cos(t2)
      // => Stop right before the rectangle
      c-between(
        0, r1*calc.cos(t2),
        r: r1,
        style: (stroke: (dash: "loosely-dashed", paint: luma(55%)))
      )

      // 2. Solid between r1*cos(t2) and r1*cos(t1)
      // => Rectangle border
      c-between(
        r1*calc.cos(t2), r1*calc.cos(t1),
        r: r1,
        style: (stroke: blue)
      )

      // 3. Dashed for the remainder of the circle (r1*cos(t1) - r1)
      c-between(
        r1*calc.cos(t1), r1,
        r: r1,
        style: (stroke: (dash: "loosely-dashed", paint: luma(55%)))
      )

      // OUTER CIRCLE

      // 1. Dashed between 0 and r2 * cos(t2)
      // => Stop right before the rectangle
      c-between(
        0, r2*calc.cos(t2),
        r: r2,
        style: (stroke: (dash: "loosely-dashed", paint: luma(55%)))
      )

      // 2. Solid between r2*cos(t2) and r2*cos(t1)
      // => Rectangle border
      c-between(
        r2*calc.cos(t2), r2*calc.cos(t1),
        r: r2,
        style: (stroke: blue)
      )

      // 3. Dashed for the remainder of the circle (r1*cos(t1) - r1)
      c-between(
        r2*calc.cos(t1), r2,
        r: r2,
        style: (stroke: (dash: "loosely-dashed", paint: luma(55%)))
      )
    }
  )
}), caption: [Polar coordinates])

#figure(canvas-3d-x(axes: true, axes-min: (0, 0, 0), {
  import cetz.draw: *

  let z0 = 2
  let h = 2.5
  let center = (3, 3)
  let r0 = 1.5
  circle((..center, z0), radius: r0, stroke: (paint: luma(40%)), fill: blue.transparentize(50%), name: "main")
  circle((rel: (0, 0, h), to: "main"), radius: r0, fill: blue.transparentize(50%))

  circle((..center, 0), radius: r0, stroke: (dash: "dashed"), fill: red.lighten(90%))

  content((..center, z0), text(blue.darken(20%))[$mu_1(x, y)$])
  content((..center, z0 + h), text(blue.darken(20%))[$mu_2(x, y)$])

  let circle-pos(x, x0: 0, y0: 0, r: 1, factor: 1) = {
    // (x - 2)^2 + (y - 2)^2 = 1 => y - 2 = +- sqrt(1 - (x - 2)^2)
    let nx = x - x0
    y0 + factor * calc.sqrt(r * r - nx * nx)
  }

  let cc = circle-pos.with(x0: center.first(), y0: center.last(), r: 1)

  // merge-path(fill: red, {
  //   line((1, cc(1), 1), (3, cc(3), 1), (rel: (0, 0, h)), (rel: (0, 0, h), to: (1, cc(1), 1)), (1, cc(1), 1))
  // })

  let circle-rot(theta, r: 1, x0: 0, y0: 0) = {
    let x = x0 + r * calc.cos(theta)
    let y = y0 + r * calc.sin(theta)
    (x, y)
  }

  let ccr = circle-rot.with(x0: center.first(), y0: center.last(), r: r0)

  let all-samples = cetz.plot.sample-fn(
    ccr,
    // (-calc.pi / 6, 5 * calc.pi / 6),
    (-25deg, 180deg - 25deg),
    50
  )
  let top-samples = all-samples.map(x => (..x, z0 + h))
  let bot-samples = all-samples.map(x => (..x, z0))

  // for i in range(samples + 1) {
  //   let pos = 1 + i * (3 - 1) / samples
  //   line((pos, cc(pos), 1), (rel: (0, 0, h)))
  // }

  merge-path(fill: red.transparentize(75%), {
    line(..top-samples, ..bot-samples.rev(), top-samples.first())
  })

  line((..ccr(-25deg), 0), (..ccr(-25deg), z0), stroke: (dash: "dashed"))
  line((..ccr(180deg - 25deg), 0), (..ccr(180deg - 25deg), z0), stroke: (dash: "dashed"))

  content((center.first(), center.last(), z0 + h / 2), text(red.darken(5%))[$E$])
  content((..center, 0), text(red.darken(5%))[$D$])
}), caption: [Volume between two surfaces])

#canvas-3d-x(axes: true,
axes-min: (0, 0, 0), {
  import cetz.draw: *

  rotate(x: 90deg, z: 90deg)
  let z0 = 3
  let h = 4.25
  let center = (3, 3)
  let r0 = 1.5

  circle((..center, 0), radius: r0, stroke: (dash: "dashed"), fill: red.lighten(90%))
  circle((..center, z0), radius: r0, stroke: (paint: luma(40%)), fill: blue.transparentize(50%), name: "main")
  circle((rel: (0, 0, h), to: "main"), radius: r0, fill: blue.transparentize(50%))


  content((..center, z0), text(blue.darken(20%))[$mu_1(y, z)$])
  content((..center, z0 + h), text(blue.darken(20%))[$mu_2(y, z)$])

  let circle-pos(x, x0: 0, y0: 0, r: 1, factor: 1) = {
    // (x - 2)^2 + (y - 2)^2 = 1 => y - 2 = +- sqrt(1 - (x - 2)^2)
    let nx = x - x0
    y0 + factor * calc.sqrt(r * r - nx * nx)
  }

  let cc = circle-pos.with(x0: center.first(), y0: center.last(), r: 1)

  // merge-path(fill: red, {
  //   line((1, cc(1), 1), (3, cc(3), 1), (rel: (0, 0, h)), (rel: (0, 0, h), to: (1, cc(1), 1)), (1, cc(1), 1))
  // })

  let circle-rot(theta, r: 1, x0: 0, y0: 0) = {
    let x = x0 + r * calc.cos(theta)
    let y = y0 + r * calc.sin(theta)
    (x, y)
  }

  let ccr = circle-rot.with(x0: center.first(), y0: center.last(), r: r0)

  let line-base-rot = -65deg
  let all-samples = cetz.plot.sample-fn(
    ccr,
    // (-calc.pi / 6, 5 * calc.pi / 6),
    (line-base-rot, 180deg + line-base-rot),
    50
  )
  let top-samples = all-samples.map(x => (..x, z0 + h))
  let bot-samples = all-samples.map(x => (..x, z0))

  merge-path(fill: red.transparentize(75%), {
    line(..top-samples, ..bot-samples.rev(), top-samples.first())
  })

  line((..ccr(line-base-rot), 0), (..ccr(line-base-rot), z0), stroke: (dash: "dashed"))
  line((..ccr(180deg + line-base-rot), 0), (..ccr(180deg + line-base-rot), z0), stroke: (dash: "dashed"))

  content((center.first(), center.last(), z0 + h / 2), text(red.darken(5%))[$E$])
  content((..center, 0), text(red.darken(5%))[$D$])
})

#canvas-3d-x(axes: true,
axes-min: (0, 0, 0), {
  import cetz.draw: *

  rotate(y: -90deg, x: -90deg)

  let z0 = 3
  let h = 4.5
  let center = (3, 3)
  let r0 = 1.5

  circle((..center, 0), radius: r0, stroke: (dash: "dashed"), fill: red.lighten(90%))
  circle((..center, z0), radius: r0, stroke: (paint: luma(40%)), fill: blue.transparentize(50%), name: "main")
  circle((rel: (0, 0, h), to: "main"), radius: r0, fill: blue.transparentize(50%))


  content((..center, z0), text(blue.darken(20%))[$mu_1(x, z)$])
  content((..center, z0 + h), text(blue.darken(20%))[$mu_2(x, z)$])

  let circle-pos(x, x0: 0, y0: 0, r: 1, factor: 1) = {
    // (x - 2)^2 + (y - 2)^2 = 1 => y - 2 = +- sqrt(1 - (x - 2)^2)
    let nx = x - x0
    y0 + factor * calc.sqrt(r * r - nx * nx)
  }

  let cc = circle-pos.with(x0: center.first(), y0: center.last(), r: 1)

  // merge-path(fill: red, {
  //   line((1, cc(1), 1), (3, cc(3), 1), (rel: (0, 0, h)), (rel: (0, 0, h), to: (1, cc(1), 1)), (1, cc(1), 1))
  // })

  let circle-rot(theta, r: 1, x0: 0, y0: 0) = {
    let x = x0 + r * calc.cos(theta)
    let y = y0 + r * calc.sin(theta)
    (x, y)
  }

  let ccr = circle-rot.with(x0: center.first(), y0: center.last(), r: r0)

  let line-base-rot = -45deg
  let all-samples = cetz.plot.sample-fn(
    ccr,
    // (-calc.pi / 6, 5 * calc.pi / 6),
    (line-base-rot, 180deg + line-base-rot),
    50
  )
  let top-samples = all-samples.map(x => (..x, z0 + h))
  let bot-samples = all-samples.map(x => (..x, z0))

  merge-path(fill: red.transparentize(75%), {
    line(..top-samples, ..bot-samples.rev(), top-samples.first())
  })

  line((..ccr(line-base-rot), 0), (..ccr(line-base-rot), z0), stroke: (dash: "dashed"))
  line((..ccr(180deg + line-base-rot), 0), (..ccr(180deg + line-base-rot), z0), stroke: (dash: "dashed"))

  content((center.first(), center.last(), z0 + h / 3), text(red.darken(5%))[$E$])
  content((..center, 0), text(red.darken(5%))[$D$])
})

= Graphs

== Introduction

#lorem(30)

#figure(/*graphs.*/make($
  // #import graphs: *
  &4 edge("ld") edge("ddr") edge() &1 edge("dd") \
  2 edge("d") edge("urr") \
  6 & & vt(5)
$), caption: [Undirected graph])

#figure(/*graphs.*/make($
  // #import graphs: *
  a, b edir("ddd", bend: #(-45deg)) & vt(c\, d) \
  b, e edir() & d, e edir("d") \
  b, a edir("u") & d, c \
  e, b edir() & e, d edir("uuu", bend: #(-45deg))
$), caption: [Directed graph])
