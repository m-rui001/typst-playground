#let lineno-color = olive
#let code-font = (
  "Victor Mono",
  "LXGW WenKai Mono",
)
#let text-font = (
  "Libertinus Serif",
  "Noto Serif CJK SC",
)

#set text(font: text-font)
#show raw: set text(font: code-font)

#show raw.where(block: true): it => {
  set par(justify: false)
  grid(
    columns: (auto, auto),
    column-gutter: 1%,
    block(for (i, line) in it.text.split("\n").enumerate() {
      box(align(left, text(lineno-color.darken(-50%), "#" + str(i + 1))))
      linebreak()
    }),
    block(it),
  )
}

#let codefig(cap, code) = context {
  let cnt = (
    {
      let (fst, ..lst) = counter(heading).get()
      (str(fst), ..lst.map(x => str(x)))
    }.join("_")
      + "."
      + str(counter(figure).get().at(0) + 1)
  )
  [#figure(
      caption: cap,
      numbering: _ => cnt,
      kind: "code",
      supplement: [Code],
      box(align(left, [#code <dummy>]), inset: (
        top: .5em,
        bottom: .5em,
      )),
    )#label("lst_" + cnt)]
}

#show raw.where(block: true): it => {
  if it.has("label") { return it }
  set text(size: 1.1em)
  let lang = if it.lang != none {
    let c = it.lang.match(regex("(\w+)fig"))
    if c != none { c.captures.at(0) } else { it.lang }
  } else { none }
  let (first-line, ..rest-lines) = it.text.split("\n")
  let title = first-line.match(regex(```^\[(.+?)\]```.text))
  if title != none {
    codefig(title.captures.at(0), raw(rest-lines.join("\n"), lang: lang, block: true))
  } else {
    codefig(none, {
      set raw(lang: lang)
      it
    })
  }
}

#show raw.where(block: false, lang: none): set raw(lang: "c")
#show raw.where(block: false): it => {
  box(stroke: .1pt, baseline: .3em, inset: (top: 2pt, bottom: 4pt, left: 2pt, right: 2pt), it)
}
#show figure: set block(breakable: true)

#set heading(numbering: "1.1.1.1")

#show heading: it => {
  if it.level == 1 { return it }
  let m = measure(it)
  it
  v(-m.height)
  line(length: m.width, stroke: gray)
}

#show heading.where(level: 1): it => {
  let m = measure(it)
  set align(center)
  counter(figure).update(0)
  it
  v(-m.height)
  line(length: 100%)
}

= Header A

```rustfig[Rust 代码]
pub fn fbnc(n: i64) -> i64 {
  match n {
    0 | 1 => 1,
    _ => fbnc(n - 1) + fbnc(n - 2),
  }
}
```

= Header B

```pyfig[Python 代码]
def fbnc(n):
  match n:
    case 0: return 1
    case 1: return 1
    case _: return fbnc(n - 1) + fbnc(n - 2)
```

```ocamlfig[Ocaml 代码]
let rec fbnc = function
  | 0 | 1 -> 1
  | n -> fbnc (n - 1) + fbnc (n - 2)
```

```cfig[C 代码]
int fbnc(int n) {
  switch n {
    case 0: case 1: return 1;
    default: return fbnc(n - 1) + fbnc(n - 2);
  }
}
```

```py
fbnc = lambda n: 1 if n <= 1 else fbnc(n - 1) + fbnc(n - 2)
```

= Header C

@lst_1.1 与 @lst_2.1 以及 @lst_2.2 和 @lst_2.3 还有 @lst_2.4 都在说同样的废话。