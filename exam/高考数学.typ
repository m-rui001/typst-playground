#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#set text(size: 12pt, font: ("New Computer Modern", "SimSun"), lang: "zh")
#set page(margin: 2cm)
#set par(justify: true, leading: 1em)
#set block(above: 1.2em)
#let fakepar=context{box();v(-measure(block()+block()).height)}
#show heading: it=>it+fakepar
#set math.mat(delim: "[")
#show heading.where(level: 1): set align(center)
#show heading.where(level: 2): set text(size: 12pt)

#let quiz(body1, body2, cols: 4)={
  let c1 = counter("quiz")
  c1.step()
  let choices=body2.children.filter(e=>e.func()==list.item)
  grid(columns: (1.6em, auto), c1.display("1."), {
    body1
    parbreak()
    if cols==4{
      for (i, e) in choices.enumerate(){
        box(width: 25%, {numbering("A. ", i+1); e.body});
      }
      parbreak()
    }else if cols==2{
      for (i, e) in choices.enumerate(){
        box(width: 50%, {numbering("A. ", i+1); e.body});
        if calc.rem(i, 2)==1{parbreak()}
      }
      parbreak()
    }else if cols==1{
      for (i, e) in choices.enumerate(){numbering("A. ", i+1); e.body; parbreak()}
    }
  })
  v(0.6cm)
}
#let quiz2(body)={
  let c1 = counter("quiz")
  c1.step()
  grid(
    columns: (1.6em, auto),
    c1.display("1."),
    body,
  )
  v(0.6cm)
}
#let quiz3(body1, body2)={
  let c1 = counter("quiz")
  c1.step()
  grid(
    columns: (1.6em, auto),
    c1.display("1."),
    body1,
  )
  {
    set par(first-line-indent: 1.6em)
    body2
  }
}
#let ubox(width)=box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))
#let ident()=h(1.6em)

= 2023 高考试题（新高考全国卷 1）数学

== 一、选择题：本题共8个小题，每小题5分，共40分。在每小题给出的四个选项中，只有一项是符合题目要求的。

#quiz[已知集合 $M={−2,−1,0,1,2}$，$N={x|x^2−x−6>=0}$，则 $M sect N=$][
- ${-2,-1,0,1}$
- ${0,1,2}$
- ${-2}$
- ${2}$
]

#quiz[已知 $z=(1-i)/(2+2i)$，则 $z-overline(z)=$][
- $-i$
- $i$
- $0$
- $1$
]

== 二、选择题：本题共4个小题，每小题5分，共20分。在每小题给出的选项中，有多项符合题目要求。全部选对的得5分，部分选对的得2分，有选错的得0分。

#quiz(cols:2)[已知函数 $f(x)$ 的定义域为 $RR$，$f(x y)=y^2 f(x)+x^2 f(y)$，则][
- $f(0)=0$
- $f(1)=0$
- $f(x)$ 是偶函数
- $x=0$ 为 $f(x)$ 的极小值点
]

#quiz(cols:2)[下列物体中，能够被整体放入棱长为1（单位：m）的正方体容器（容器壁厚度忽略不计）内的有][
- 直径为 0.99m 的球体
- 所有棱长为 1.4m 的四面体
- 底面直径为 0.01m，高为 1.8m 的圆柱体
- 底面直径为 1.2m，高为 0.01m 的圆柱体
]

== 三、填空题：本题共 4 个小题，每小题 5 分，满分 20 分。

#quiz2[某学校开设了 4 门体育类选修课和 4 门艺术类选修课，学生需从这 8 门课中选修 2 门或 3 门课，并且每类选修课至少选修 1 门，则不同的选修方案共有#ubox(3em)种（用数字作答）。]

#quiz2[正四棱台 $A B C D-A_1 B_1 C_1 D_1$ 中，$A B = 2$, $A_1 B_1 = 1$，$A A_1=sqrt(2)$，则该棱台的体积为#ubox(3em)。]

== 四、解答题：共 6 个小题，满分 70 分，解答应写出文字说明、证明过程或演算步骤。

#quiz3[（12分）][
#ident()在直角坐标系 $x O y$ 中，点 $P$ 到 $x$ 轴的距离等于 $P$ 到点 $(0,1/2)$ 的距离，记动点 $P$ 的轨迹为 $W$。

（1）求 $W$ 的方程；

（2）已知矩形 $A B C D$ 有三个顶点在 $W$上，证明：矩形 $A B C D$ 的周长大于 $3√3$。
]
