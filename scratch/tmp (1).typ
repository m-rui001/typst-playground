#import "@preview/touying:0.6.1": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#let indent() = {
  box(width: 2em)
}

#let myque(x) = {
  [「#x」]
}


== 标题杂谈 <touying:hidden>

#slide(composer: (16em, auto))[
  #align(center, image("images/bookcover.png", width: 75%))
][
  #v(2em)
  
  #text(size: 1.2em, weight: "bold")[
    《当我谈跑步时 我谈些什么》
  ]
  
  #text(size: 0.9em, style: "italic")[
    村上春树
  ]

  // 先显示村上春树介绍
  #only("1")[
    #align()[
      #text(size: 0.9em, fill: gray)[
        日本后现代主义作家，1949年生于京都。……
      ]
    ]
  ]


  // 点击后显示引用内容
  #uncover("2-")[
    #align()[
      #indent()#quote()[
         不再是浮华迷茫，不再是旖旎感伤，……
      ]
    ]
  ]

  #uncover("3-")[
    #v(2em)
    #text(size:1.1em,weight: "bold")[当我写代码时……]
  ]
]