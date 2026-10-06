#set heading(numbering: "1.1", supplement: [Chapter])
#show heading.where(level: 1): it => {
  set align(center)
  stack(
    "Chapter " + counter(heading).display(),
    v(0.8em),
    it.body,
  )
}


= Introduction <ch-intro>

== Background <background>

#lorem(20). The @ch-intro and @background is


= Theory

#lorem(20)

