#import "@preview/showybox:2.0.1": showybox

#let sbox(
  title: [title],
  ..body,
) = showybox(frame: (
    border-color: rgb("5B8982"),
    title-color: rgb("5B8982"),
    body-color: rgb("F7F1ED"),
  ),
  title-style: (
    color: white,
    weight: "regular",
    align: center,
  ),
  shadow: (
    offset: 3pt,
  ),
  breakable: true,
  ..body
  )