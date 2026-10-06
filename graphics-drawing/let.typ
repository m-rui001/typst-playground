#let i = h(2em)
#let di = h(-2em)
#let indent = h(2em)
#let myblock(body) = context {
  let is-even = calc.even(counter(page).get().first())
  align(
 center,
    block(
      width: 100%,
      stroke: blue + 1pt,
      fill: rgb(235, 245, 255),
      inset: 10pt,
      radius: 4pt,
      align(left,body)
    )
  )
}
#let title(body) = place(top + center, text(24pt,body))
#let tips(body) = place(bottom + center, text(9pt,body))
#let bigin() = {set page(
  numbering: "1",
  margin:(inside:2cm,outside:6cm,y:3cm),
  footer: context {
    let is-even = calc.even(counter(page).get().first())
    if is-even {
      align(left, counter(page).display("1"))
    } else {
      align(right, counter(page).display("1"))
    }
  }
)}