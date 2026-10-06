#import("@preview/polylux:0.3.1"):*
#import("@preview/tablex:0.0.6"):*
#import("@preview/pinit:0.1.1"): *
#import themes.simple: *

#set page(paper: "presentation-16-9",margin: (bottom: 20pt))
#set text(size: 22.5pt,font: ("Times New Roman","simsun"))
// #set par(leading: 1em)

#slide[
  #show math.equation: set text(size:1.4em)
  #table(
    columns: (auto,auto,auto),
    align: center,
    table(
      columns: (auto),
      stroke: none,
      align: center,
      row-gutter: 5pt,
      [1],
      [1#h(15pt)1],
      [1#h(15pt)2#h(15pt)1],
      [1#h(15pt)3#h(15pt)3#h(15pt)1],
      [1#h(15pt)4#h(15pt)6#h(15pt)4#h(15pt)1],
      [1#h(12pt)5#h(12pt)10#h(12pt)10#h(12pt)5#h(12pt)1],
      [……]
    ),
    text(size:1.5em,$⇒$),
    $mat(
      delim: "[",
      1;
      1,1;
      1,2,1;
      1,3,3,1;
      1,4,6,4,1;
      1,5,10,10,5,1;
      dots;
    )$,
  )
]