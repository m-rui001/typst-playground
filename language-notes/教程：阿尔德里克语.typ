#import "../../let.typ":*
#set page(paper: "a4")
#set text(12pt, font: ("Kmaj", "Times New Roman", "SimSun"))
#set heading(numbering: "1.")
#set par(first-line-indent: 2em)
#show strong: it => {
  text(
    weight: "bold",
    font: ("Times New Roman","SimHei"),
    it.body
  )
}
#show emph: it => {
  text(
    style: "italic",
    font: ("Times New Roman","KaiTi"),
    it.body
  )
}

#title([阿尔德里克语简明教程\
#text(font:"Kmaj")[   ]])
#tips([作者 欧阳狮子])
#pagebreak()
#outline(title: [目录],indent:1em)
#pagebreak()
#bigin()

= 语音文字

= 构词法

= 词法

= 句法
