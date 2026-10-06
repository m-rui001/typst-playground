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
        日本后现代主义作家，1949年生于京都。代表作有《挪威的森林》《海边的卡夫卡》等。其作品风格独特，擅长描写都市人的孤独感和疏离感……
      ]
    ]
  ]


  // 点击后显示引用内容
  #uncover("2-")[
    #align()[
      #indent()#quote()[
         不再是浮华迷茫，不再是旖旎感伤，不再羚羊挂角无迹可寻——写了几十年#myque([别人])的文字，他第一次只写自己：小说之外、故事之外、文字之外，均是不施雕琢娓娓道来，清淡如云，宁静如水……
      ]
    ]
  ]

  #uncover("3-")[
    #v(2em)
    #text(size:1.1em,weight: "bold")[当我写代码时，我写些什么。]
  ]
]