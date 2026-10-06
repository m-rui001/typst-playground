#import "@preview/colorful-boxes:1.2.0": *
#import "@preview/gentle-clues:0.8.0": *
#set page(paper: "a4",
margin: (top:2cm,left:1cm, right:1.5cm),
numbering: "1")
#set par(justify: false)
#set text(fill: black,font: ("Linux Libertine",
"Noto Serif CJK SC",),size: 10.5pt)
#set par(justify: true)
#show: rest => columns(2, rest)
#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(center)
  #set text(12pt, weight: "regular")
  #smallcaps(it.body)
]

#show heading.where(
  level: 2
): it => text(
  size: 12pt,
  weight: "extrabold",
  style: "oblique",
  it.body + [.],
)
#outline(depth: 2)
#set box(height: 10em)


= 数学
#outlinebox(title: "每临大事有静气",
  color: none,
  width: auto,
  radius: 2pt,
  centering: true,)[#strong[ 
+ 解题时必须全神贯注，全身心投入 
+ 读题，一目十行，过目不忘，用自己语言重新叙述问题，不断变更问题
+ 能很快抓住问题的大意与中心，短暂的强记，将问题的条件与结论牢记心中
+ 尽可能心算. 运算一要准确，二要迅速. 草稿纸尽可能整齐，尽可能节约使用
+ 探索思考，想清关键步骤，多动点脑子，想一想下一步如何走，走下去后果如何
+ 引入适当字母，使问题简化，规律变明显. 向基本量靠拢. 寻找规律，从简单做起，待规律看清后再向前迈进. 双轨迹模式.
+ 从不同角度看问题，应当养成井井有条的习惯，既要有整体观点，又能将问题分解
+ 解法以简单、自然为上. 解题单刀直入，直剖问题核心，切忌兜圈子.
+ 保持清醒的头脑]]
== 预备知识

#slantedColorbox(
  title:"遇到多个变元问题，消元、对称化" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  1) $a>b>c>0 ,2a^2+display(1/(a c)+1/(a(a-c))-10a c+25c^2) $ 最小值\
  
]
#slantedColorbox(
  title:"处理高次问题，换元" ,
  color: "",
  radius: 5pt,
  width: auto,
  
)[
  
]
#slantedColorbox(
  title:"三角换元" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"对称换元" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"求值域，求最值，判别式法" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"三次方程韦达定理" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"含参二次方程根的分布" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"引入参数" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

== 函数

#slantedColorbox(
  title:"阿贝尔求和" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"绝对值函数几何意义" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"进制" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"分段函数零点" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"根与系数" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"分离变量" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"数形结合" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"零点问题" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"复合函数" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"合理选参" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"迭代函数法与不动点法" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"三角恒等式" ,
  color: "",
  radius: 5pt,
  width: auto
)[
   $cos 3theta=&4cos^3theta-3cos theta\ sin 3theta=&3sin theta-4sin^3theta$\
   $sin A+sin B+sin C=4cos display(A/2)cos display(B/2) cos display(C/2) $\
   $tan A+tan B +tan C=tan A tan B tan C$
   
]
#table(
  columns: (1fr, auto, auto,auto,),
  inset: 10pt,
  align: horizon,
  table.header(
    [], [*导数*], [*极小值*],[*极大值*]
  ),
  
  $ e^x\/ x $,
  $ display(((x-1)e^x) /x)$,
  $ 1,e $,
  [],
  $  display((ln x)/x) $,
  $ display((1-ln x)/x^2) $,
  [],
  $ e,display(1/e) $
)
#slantedColorbox(
  title:"海伦公式" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 几何与代数

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 概率与统计

#slantedColorbox(
  title:"排列组合" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"样本估计总体" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
= 物理
== 一、选择题
=== （一）近代物理及物理思想与方法
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

=== （二）力学题
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
=== （三）万有引力
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

=== （四）机械振动与机械波
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
=== （五）热学
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
=== （六）光学
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

=== （七）交流电
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
=== （八）带电粒子在电场和磁场中的运动
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 二、实验题

=== （一）力学
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

=== （二）电学实验
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 三、计算题

=== （一）力学计算
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
=== （二）电磁学计算
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
= 化学
== 一、化学科学与实验探究

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]


== 二、物质结构与性质

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 三、无机物及其应用

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 四、有机化学基础

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 五、化学反应原理

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 六、化学与社会发展

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

= 生物
== 必修一：分子与细胞

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

== 必修二：遗传与进化

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 选择性必修一：稳态与调节

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

== 选择性必修二：生物与环境

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

== 选择性必修三：生物技术与工程

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]

= 语文
#outlinebox(title:"问什么？几条？角度？")[（一）答案就在文本，作用题？分析评价题？比较题？\ （二）明体达用？仕和隐？虚构非虚构？\ （三）选择你的观点要明确，不要模糊]
== 语言文字运用

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 论述类文本阅读

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 古代诗文阅读
#info(title:"手法，用词，语言，情感")[
  （一） 人物形象：正面，侧面衬托
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 古代名篇名句
#info(title:"默写")[
  1. 惟有饮者留其名\ 惟有泪千行 \ 惟觉时之枕席\ 
  2. 吞声踯躅不敢言\ 搔首踟蹰\
  3. 舟遥遥以轻飏\ 皭然泥而不滓者也
  
]
== 文学类文本阅读

#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
#slantedColorbox(
  title:"" ,
  color: "",
  radius: 5pt,
  width: auto
)[
  
]
== 写作
#warning(title:"扣关键词")[
  （一）审题。材料作文，任务驱动，多元关系。\
  （二）并列式，递进式（不能一直驳斥对方，正面：A是B的基础前提，B是A的升华；反面：若A丢掉B则，若B丢掉A则）\
  （三）论证要具体，多用比喻论证。多引用诗文，多用排比论证有气势，假设论证。
]
= 英语

== 语法填空

== 完型填空

== 阅读理解

== 书面表达