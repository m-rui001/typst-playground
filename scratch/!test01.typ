#import "@preview/showybox:2.0.1": showybox

#showybox(
  width: 50%,
  title: "TEST01",
)[AAA][BBB]

#showybox()[AAAA]

#let my-showybox(..body) = {
  showybox(
    width: 70%,
    title: "TEST02",
    ..body,
  )
}

#show: my-showybox

#showybox([AAA1])
#showybox()[AAA][BBB2]