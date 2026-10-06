#let tblock = (title: none, fill: none, it) => {
  block(title)
  rect(fill: fill)
  block(it)
}

#tblock(title: [Hello, Typst!])[Hello, Touying!]
#tblock(title: [Hello, Typst!], fill: gradient.linear(red, red.lighten(90%), angle: 90deg))[Hello, Touying!]
