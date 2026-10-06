#import "@preview/itemize:0.1.2" as el
#import "@preview/cetz:0.4.2"
#import "@preview/numbly:0.1.0": numbly

#show: el.default-enum-list
#show ref: el.ref-enum

#set text(
  font: (
    (
      name: "Source Han Serif SC",
      covers: regex("[·“”‘’…|\[\]\{\}<>—]"),
    ),
    (
      name: "TeX Gyre Termes",
    ),
    "Source Han Serif SC",
  ),
  size: 12pt,
  lang: "zh",
  region: "cn",
)

#show strong: set text(
  font: "Source Han Sans SC",
  weight: "medium",
)

#let latin-number-regex = state("latin-number-regex")
#latin-number-regex.update(true)

#show regex("[\p{Latin}\p{Number}]+"): it => context {
  if latin-number-regex.get() {
    set text(1.1em)
    it
  } else {
    it
  }
}

#show math.equation: it => {
  latin-number-regex.update(false)
  it
  latin-number-regex.update(true)
}

#show math.equation: set text(
  font: "TeX Gyre Termes Math",
  size: 1.1em,
)

#set par(justify: true)

#show math.equation.where(block: false): set text(
  top-edge: "bounds",
  bottom-edge: "bounds",
)

#show math.equation.where(block: false): math.display

#set page(
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
)

#show heading.where(level: 1): set text(size: 24pt)
#show heading.where(level: 2): set text(size: 20pt)
#show heading.where(level: 3): set text(size: 16pt)
#show heading.where(level: 4): set text(size: 14pt)

#show math.equation.where(block: true): set align(left)

#let zh(body) = text(font: "Source Han Serif SC", weight: "regular", size: 12pt)[#body]

#let ns = h(0.15em)

#let underline(width, body) = box(align(center, body), width: width, stroke: (bottom: 0.5pt), outset: (bottom: 2pt))

#let h-space(width, body) = box(align(center, body), width: width, outset: (bottom: 2pt))

#let blue(body) = text(fill: rgb("#1d5dff"))[#body]

#show: el.default-enum-list.with(enum-spacing: 1.2em)

#set list(indent: 0.5em, marker: (
  [•],
  [◦],
  [▪],
  [▫],
  [▸],
  [▹],
))

#set heading(numbering: (..n) => numbering("1.1", ..n) + h(0.5em))

#show quote.where(block: true): it => block(
  fill: luma(90.2%), // 浅灰背景
  stroke: (left: 2pt + gray, rest: none), // 只画左边竖线
  inset: (top: 1em, right: 1em, bottom: 1em, left: 1em + 1pt), // 内边距
  spacing: 1.2em,
  outset: (left: -1pt),
  width: 100%,
)[
  #it.body
]

#let fake-italic(body) = box(text([#skew(ax: -12deg)[#body]]))

#let correct_spacing(body) = table(
  columns: 1fr,
  // 无边框
  stroke: none,
  // 对齐方式（可选）
  align: left + horizon,

  table.cell(inset: (left: 0pt, right: 0pt, top: 0pt, bottom: 0em))[
    #body
  ],
)

#align(center + horizon)[
  #set text(size: 64pt, weight: "bold")
  语文笔记
]

#pagebreak()

#counter(page).update(1)
#set page(numbering: "1")

#heading(level: 1, numbering: none)[目录]

#show outline.entry: set outline.entry(
  fill: repeat([·], gap: 0.2em),
)

#outline(
  title: none, // 已经手写了“目录”标题
  depth: 6, // 显示到 3 级标题
)

#pagebreak()

= 表达方式

-
  *记叙：*时间、地点、人物、事件的起因、经过、结果。

-
  *议论：*对人、事、物的是非善恶好坏发表观点。

-
  *说明：*对人、事、物作客观评价。

-
  *抒情：*将主观感受和思想感情在作品中抒发。

-
  *描写：*

  -
    *根据表现手法分类：*

    -
      正面描写（直接描写）

    -
      侧面描写（间接描写）

    -
      白描

  -
    *根据对象分类：*

    -
      人物描写

    -
      环境描写

= 记叙文

== 标题

=== 含义

-
  *表层：*

  #pad(left: 1em)[
    *答题格式：*

    #pad(left: 1em)[
      #quote(block: true)[
        /\* 需结合标题概括其在文中具体所指（结合文章）。 \*/
      ]
    ]
  ]

-
  *深层：*

  #pad(left: 1em)[
    *答题格式：*

    #pad(left: 1em)[
      #quote(block: true)[
        /\* 需结合标题分析其体现出的文章主旨（包括主要情感，赞颂主人公性格）。 \*/
      ]
    ]
  ]

-
  *启示：*

  #pad(left: 1em)[
    *答题格式：*

    #pad(left: 1em)[
      #quote(block: true)[
        /\* 主要是文章所反映的社会意义、人性呼吁、对社会人们的期望号召。 \*/
      ]
    ]
  ]


-
  *示例：*

  #pad(left: 1em)[
    1. 选文标题的含义是什么？

      #pad(left: 1em)[
        #quote(block: true)[
          标题中的“那盏不灭的灯”在表层上指的是王师傅修鞋铺里为晚归人照明的灯光。在深层上，它象征着一种温暖的坚守和信赖，代表着王师傅对徒弟的承诺以及对社会的默默奉献，照亮了人们内心深处的希望。
        ]
      ]

    2. 从文中你得到了什么启示？


      #pad(left: 1em)[
        #quote(block: true)[
          文章反映了现代社会中对人与人之间关怀与信任的呼唤，呼吁每个人都能像王师傅一样，坚守心中的善念，在自己的位置上发光发热，成为带给他人温暖和希望的“不灭的灯”。
        ]
      ]
  ]

=== 作用

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    /\* *需从以下内容中依情况选取并组合：* \*/

    #set block(above: 1.2em, below: 1.2em)

    #pad(left: 1em)[
      -
        点明文章的(叙事线索 | 中心思想)，指出文章主要人物。

      -
        概括文章的主要内容（如有修辞要具体指出）。

      -
        突出文章的主旨情感。

      -
        设置悬念，吸引读者，激发读者阅读兴趣。
    ]
  ]
]

== 段落

=== 首段的作用

-
  *内容：*

  #pad(left: 1em)[
    *答题格式：*

    #pad(left: 1em)[
      #quote(block: true)[
        /\* 需分析概括段落主要内容，分析表达出的情感态度（倒叙类的文章的首段如有情感态度则要加上“确立情感基调”）。 \*\/
      ]
    ]
  ]

-
  *结构：*

  #pad(left: 1em)[
    *答题格式：*

    #pad(left: 1em)[
      #quote(block: true)[
        点明主题，(总领全文 | 引出下文)，为后文……的情节作铺垫。
      ]
    ]
  ]

=== 中间段的作用
-
  *内容：*

  #pad(left: 1em)[
    *答题格式：*

    #pad(left: 1em)[
      #quote(block: true)[
        /\* 需简要概括内容大意，分析情感态度。 \*/
      ]
    ]
  ]

-
  *结构：*
  #pad(left: 1em)[
    *答题格式：*

    #pad(left: 1em)[
      #quote(block: true)[
        起到了承上启下的过渡作用，与前后文内容形成呼应。
      ]
    ]
  ]

=== 结尾段的作用
*答题格式：*

#pad(left: 1em)[
  -
    *内容：*

    #pad(left: 1em)[
      #quote(block: true)[
        #fake-italic[[\<文章段落大意\>]]。深化中心、突出主旨。(表达……的情感态度 | 赞颂了……的品质精神)。
      ]
    ]

  -
    *结构：*

    #pad(left: 1em)[
      #quote(block: true)[
        总结全文、照应标题、首尾呼应，使文章结构完整严谨。
      ]
    ]
]

== 概括中心

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    本文(记叙了 | 描写了)……的(故事 | 事迹 | 经过 | 事件 | 景物)，(表现了 | 反映了 | 歌颂了 | 揭露了 | 批判了)……的(思想 | 性格 | 精神 | 实质)。抒发了作者……的情感。
  ]
]

= 议论文

== 论点

通常为一个陈述句，需要有明确、唯一的观点（最好有表达态度的词语，例如：“能”“可以”“应该”等）。

-
  *标题做论点：*必须符合论点要求且在文中要出现。

-
  *起始部分出现论点句：*必须符合论题核心（往往标题为论题）。

-
  *结尾出现论点句：*起始部分无体现，结尾更有概括性、指向性。

== 论据类型

-
  *事实论据：*用来证明论点的事实，包括有代表性的、确凿的事例，历史事实及统计数字。

-
  *道理论据：*包括名人名言、农谚俗语及科学原理论据。

  -
    *作用：*使论证更概括、深入。

== 论证方法及其作用

=== 举例论证

列举典型事例证明观点。

==== 答题格式
#quote(block: true)[
  通过……的示例，真实具体地论证了……，进而证明中心论点。使论证更加真实可信，更有说服力。
]

*示例：*
#pad(left: 1em)[
  #quote(block: true)[
    通过*雷锋助人为乐的事例*，真实具体地论证了*助人为乐是一种高尚的品质*，进而证明了中心论点，使论证更加真实可信，更有说服力。
  ]
]

=== 道理论证
引用经典著作中的精辟见解、名人的言论，以及公认的定理、公式等。

==== 答题格式
#quote(block: true)[
  通过引用……的话来证明……观点，使论证更概括、更深入、更权威、更有说服力。
]
*示例：*
#pad(left: 1em)[
  #quote(block: true)[
    通过引用*孔子“学而不思则罔，思而不学则殆”的话*来证明*学习应当学思结合*的观点，使论证更概括、更深入、更权威、更有说服力。
  ]
]

=== 对比论证
将两种性质相反或有差异的事物、道理进行比较。

==== 答题格式
#quote(block: true)[
  通过举……和……的例子并比较，构成正反对比论证，使论点更加鲜明突出。
]
*示例：*
#pad(left: 1em)[
  #quote(block: true)[
    通过举*勤奋的爱迪生*和*懒惰的凡人甲*的例子并比较，构成正反对比论证，使论点更加鲜明突出。
  ]
]

=== 比喻论证
通过形象类比来阐明抽象的道理。

==== 答题格式
#quote(block: true)[
  通过将……比作……来展开论证，生动形象地论证了<#fake-italic[论点或分论点]>，增强了文章的趣味性。
]
*示例：*
#pad(left: 1em)[
  #quote(block: true)[
    通过将*人生*比作*一条航行在海上的船*来展开论证，生动形象地论证了*只有明确方向并坚持不懈才能到达成功的彼岸*，增强了文章的趣味性。
  ]
]

=== 组合示例

==== 举例论证和道理论证

#quote(block: true)[
  通过*雷锋助人为乐的事例*，真实具体地论证了*助人为乐是一种高尚的品质*。
  正如孔子所言：“己欲立而立人，己欲达而达人。”这句话进一步从道理上印证了乐于助人能提升自身品格，使论证更深入、更有说服力。
]
==== 举例论证和对比论证

#quote(block: true)[
  通过*小明勤奋学习、刻苦钻研的事例*，真实具体地论证了*努力是成功的关键*。
  同时，将他与*贪玩懒惰、成绩下滑的小刚*进行对比，更加突出勤奋与懒惰的差异，使论点更加鲜明突出，论证更具说服力。
]

== 论证思路

=== 论点在起始

==== 答题格式

#quote(block: true)[
  首先提出……的观点，接着(从……几方面 | 运用……的方法)进行论证，最后(得出……的结论 | 进一步强调了……的观点)。
]
*示例 1：*

#pad(left: 1em)[
  #quote(block: true)[
    首先提出*“阅读能拓宽视野、提升思维品质”*的观点，接着从*阅读增长知识、培养审美、塑造人格几方面*进行论证，最后*得出“阅读是促进个人全面发展的重要途径”的结论*。
  ]
]

*示例 2：*

#pad(left: 1em)[
  #quote(block: true)[
    首先提出*“团队合作能显著提升学习效率”*的观点，接着*运用对比论证与举例论证的方法*进行论证，最后*进一步强调了“合作学习能激发思维、共同进步”的观点*。
  ]
]

=== 论点在结尾

==== 答题格式

#quote(block: true)[
  首先(列举 | 引用)……的(示例 | 典故 | 名言)，通过分析说明得出……的结论，(从而证明……的观点 | 揭示……的主题)，最后提出……的中心论点。
]
*示例 1：*

#pad(left: 1em)[
  #quote(block: true)[
    首先*列举雷锋助人为乐的事例*，通过分析说明得出*助人为乐能增进人与人之间的温情与信任*的结论，*从而证明无私奉献是一种高尚的品质的观点*，最后提出*应当在日常生活中践行助人为乐的精神*的中心论点。
  ]
]

*示例 2：*

#pad(left: 1em)[
  #quote(block: true)[
    首先*引用“宝剑锋从磨砺出，梅花香自苦寒来”*的*名言*，通过分析说明得出*只有经历磨练才能取得真正的成功*的结论，*揭示奋斗与坚持是通向理想的必经之路的主题*，最后提出*青少年应以坚韧的意志面对困难与挑战*的中心论点。
  ]
]

== 补充论述段

明确该段论点，分清补充的是事实论据还是道理论据。补充事实论据，应交代清楚名言诗句的作者、国别或朝代。

-
  *事实论据：*人物、事件、结果。

-
  *道理论据：*(时代 | 国籍)、作者、言论。

== A、B 段不能交换的原因

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    A 段论述了……，B 段论述了……。两段(是时间顺序 | 是逻辑关系 | 是递进关系 | 与上文相照应)。所以不能交换。
  ]
]

== 答题点

-
  *举例论证：*具体准确。

-
  *道理论证：*权威有力。

-
  *比喻论证：*生动形象。

-
  *对比论证：*突出强调。

== 首尾段落的作用

=== 首段（或起始部分）的作用

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    /\* *需从以下内容中依情况选取并组合：* \*/

    #set block(above: 1.2em, below: 1.2em)

    #pad(left: 1em)[
      -
        概括段落内容（主要概括论据内容）。

      -
        点明或引出中心论点或中心论题（论点或论题应具体写出）。

      -
        作为事实或道理论据证明中心论点

      -
        (吸引读者 | 引发读者思考)自然引出后文的具体论述内容。
    ]
  ]
]

=== 结尾段的作用

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    /\* *需从以下内容中依情况选取并组合：* \*/

    #set block(above: 1.2em, below: 1.2em)

    #pad(left: 1em)[
      -
        概况(段落内容 | 论据内容)。

      -
        深化中心论点，(再次提出……的观点态度 | (号召 | 希望) 人们……)。

      -
        总结全文，照应标题，使论述的结构更加完整。
    ]
  ]
]

= 说明文

== 定义

一种以说明为主要表达方式的文章体裁。

== 分类

-
  *事物说明文：*以事物为具体的说明对象。

-
  *事理说明文：*分析事物的因果关系，介绍科学道理。

== 说明文的内容

=== 说明对象

说明对象，也称*被说明事物*或*说明中心*，是说明文所要介绍、解释或阐述的*核心事物、事理或现象*。它是整篇文章围绕的中心。

==== 定义

说明对象是说明文所要介绍或阐明的主体，回答了“这篇文章写的是什么？”的核心问题。

==== 作用

它决定了文章的选材、结构、说明顺序和说明方法。

==== 如何判断和获取说明对象？

-
  *找文题：*说明对象通常在文章的*标题*中直接体现。

-
  *看首尾：*注意文章的*起始部分和结尾部分*，它们经常会点明或总结说明对象。

-
  *看内容：*浏览全文，找出文章中反复出现或着重介绍的那个*事物或概念*。

==== 说明对象的特征

事物的特征主要表现在结构、形态（大小、长短等）、性质（软、硬、冷、热等）、变化（动、静、快、慢等）、成因（简单、复杂等）、功用等等。

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    /\* *需从以下内容中依情况选取并组合：* \*/

    #set block(above: 1.2em, below: 1.2em)

    #pad(left: 1em)[
      -
        <#fake-italic[标题中的修饰性语]>。

      -
        <#fake-italic[文章的起始部分]>。

      -
        <#fake-italic[各段的起始句]>。

      -
        /\* 需抓住最能揭示说明对象的本质词语进行归纳提取。 \*/
    ]
  ]
]

=== 如何获取说明文的内容？

-
  直接摘取中心句。

-
  连结并列文段首句，归纳出一个主要意思。

-
  从各段落中归纳出说明内容。

== 说明顺序

=== 说明顺序的种类

-
  *时间顺序：*以时间的先后为说明顺序（表示时间或先后的标志性词语）。

-
  *空间顺序：*按事物的空间存在的形式（以前、后、左、右、上、下、高、低、东、南、西、北等为顺序，一般用来说明事物的构造成形态）。

-
  *逻辑顺序：*按事物的内部联系或人们认识事物的过程来安排说明顺序。

==== 常用逻辑顺序

-
  由表及里

-
  由主到次

-
  由局部到细部

-
  由现象到本质

-
  由特点到用途

-
  由整体到部分

-
  由概括到具体

-
  由原因到结果

=== 说明文的结构

- *总分式：*文章按照“整体—局部”或“概要—具体”的思路组织材料，是说明文最常见的结构。

  -
    总分

  -
    分总

  -
    总分总

- *递进式：*事理说明文多用。

== 标题、起始部分和结尾部分的作用

=== 标题的作用

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    /\* *需从以下内容中依情况选取并组合：* \*/

    #set block(above: 1.2em, below: 1.2em)

    #pad(left: 1em)[
      -
        点名说明对象。

      -
        题目生动形象，能激发读者的阅读兴趣。

      -
        概括了文章的主要内容。

      -
        富有诗意、增强了文章的文学性。
    ]
  ]
]

=== 起始部分的作用

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    /\* *需从以下内容中依情况选取并组合：* \*/

    #set block(above: 1.2em, below: 1.2em)

    #pad(left: 1em)[
      -
        列出说明对象。

      -
        引发读者兴趣。

      -
        引出说明内容。

      -
        引发读者思考。

      -
        引出下文。
    ]
  ]
]

=== 结尾部分的作用

*答题格式：*

#pad(left: 1em)[
  #quote(block: true)[
    /\* *需从以下内容中依情况选取并组合：* \*/

    #set block(above: 1.2em, below: 1.2em)

    #pad(left: 1em)[
      -
        总结全文。

      -
        提出(希望 | 展望 | 思考 | 预测)。
    ]
  ]
]

== 说明方法的作用

=== 答题格式

#quote(block: true)[
  运用了<#fake-italic[说明方法]>的说明方法，(准确地 | 具体地 | 生动地)说明了<#fake-italic[说明对象]>的……特点。
]

= 新闻

== 定义

广义的新闻是指各种新闻体裁的总称，包括消息、通讯、特写、调查报告等。狭义的新闻指“消息”。消息报道迅速，传播面广，篇幅短小，成为新闻体裁的代表。

== 特点

观点鲜明、内容真实、报道及时、语言简明、准确客观。

== 新闻结构

-
  *标题：*高度概括事件（迅速了解新闻要看标题）。

-
  *导语：*扼要揭示新闻核心内容“电头”后一句或第一段（较详细了解新闻内容要看导语）。

-
  *主体：*对导语内容进行进一步的扩展和阐释，是新闻的主要部分。

-
  *背景：*说明新闻发生的社会或自然环境，是从属部分，常插入在主体中，也可出现在导语或结语中。

-
  *结语：*新闻的结尾，一般指新闻的最后一段或最后一句话，依内容需要可有可无。
