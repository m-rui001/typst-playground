#let thu_purple = rgb(102, 0, 153)
#let soft-purple = rgb("#7736d9")
// beamer_content 中 page -> header 的计数器
#let header-1 = state("header-1")
#let header-2 = state("header-2")

// math 的 counter
#let theorem-counter = counter("thm")
#let definition-counter = counter("def")
#let proposition-counter = counter("prop")
#let corollary-counter = counter("cor")

// math-block style
#let math-block(
  math-title: none,
  title: none,
  top-par-color-and-container-par-stroke,
  container-par-fill,
  counter,
  body,
) = layout(
  size => {
    let top-par = block(
      width: auto,
      height: auto,
      inset: (x: 1em, rest: 0.5em),
      fill: top-par-color-and-container-par-stroke,
      breakable: true,
      align(horizon)[#text(fill: white)[
          *
          #math-title #context { numbering("1.1", ..counter.get()) }
          #{ if title == none { none } else { [(#title)] } }
          *
        ]
      ],
    )
    let length = measure(top-par, width: size.width - 2em).height / 2
    let container-par = [#block(
      width: 100%,
      radius: 3pt,
      height: auto,
      inset: 1em,
      breakable: true,
      fill: container-par-fill,
      stroke: (paint: top-par-color-and-container-par-stroke, thickness: 0.5pt),
      [
        #set block(spacing: 0em)
        #place(top-par, dy: -length - 1em)
        #v(length)
        #body
      ],
    )]
    v(length)
    // 先更新 corollary-counter
    if counter != corollary-counter {
      context {
        let temp = counter.get()
        temp.push(1)
        corollary-counter.update(temp)
      }
    } else { none }
    // 输出
    container-par
    // 再更新
    context { counter.step(level: counter.get().len()) }
  },
)
// 定理
#let theorem-block(title: none, body) = math-block(
  math-title: "Theorem",
  title: title,
  rgb("#FF0000"),
  rgb("#FFF2F2"),
  theorem-counter,
  body,
)

// 定义
#let definition-block(title: none, body) = math-block(
  math-title: "Definition",
  title: title,
  rgb("#208F2D"),
  rgb("#F5FCF5"),
  definition-counter,
  body,
)

// 命题
#let proposition-block(title: none, body) = math-block(
  math-title: "Proposition",
  title: title,
  rgb("#005198"),
  rgb("#F2F8FD"),
  proposition-counter,
  body,
)

// 推论
#let corollary-block(title: none, body) = math-block(
  math-title: "Corollary",
  title: title,
  rgb("#00AEF7"),
  rgb("#F2FBFF"),
  corollary-counter,
  body,
)

#let beamer_start(
  title: none,
  author: none,
  organization: none,
  date: none,
  version1: none,
) = {
  {
    set page(
      fill: black,
      //margin: 1cm,
      background: place(
        dx: 245pt,
        dy: 675pt,
        rotate(-60deg, image(
          "thu-cn-logo.png",
          width: 150pt,
        )),
      ),
    )

    import "circle-corner.typ": * // 引入圆角函数

    // 左下
    layer-hexagon(30, 10, blue, 2pt, 13, 22, 0pt, 490pt)

    place(
      top + left,
      polygon.regular(
        stroke: blue,
        size: 58pt,
        vertices: 6,
        fill: blue,
      ),
      dx: -29pt,
      dy: 465pt,
    )

    // 右下
    layer-hexagon(90, 15, blue, 1.3pt, 12, 19, 537pt, 783pt)
    //layer-hexagon(92, 15, soft-purple, 1pt, 4, 54, 525pt, 769pt)

    // 左上
    layer-hexagon(25, 7, blue, 1pt, 13, 20, 5pt, -57pt)

    // 右上
    layer-hexagon(108, 10, yellow, 1pt, 13, 16, 537pt, 200pt)
    layer-hexagon(56, 10, rgb("#282828"), 1pt, 13, 2, 537pt, 200pt)
    for i in range(3) {
      layer-hexagon(82 + 8 * 13 * i, 10, rgb("#282828"), 1pt, 13, 2, 537pt, 200pt)
    }

    // 标题
    set text(
      font: (
        (name: "Futura", covers: "latin-in-cjk"), // 在拉丁字母范围内用 Times New Roman 字体
        //"simsun", // 一般用 simsun 宋体
        "Microsoft Yahei UI", // 微软雅黑
      ),
      fill: white,
    )

    place(
      left,
      block(
        text(
          title,
          size: 30pt,
          weight: "light",
        ),
      ),
      dy: 26.5%,
    )


    place(
      left,
      block(
        text(
          size: 15pt,
          //weight: "regular",
        )[
          author: #author\ // 作者
          organization: #organization\ // 组织
          datetime: #date.display()\ // 时间
          version: #version(..version1)\ // 版本
        ],
      ),
      dy: 33%,
    )
  }

  image("THU-background-1.jpg")
}
#let beamer_outline(o-part) = {
  // 页码
  set page(
    numbering: "I",
  )
  counter(page).update(1)

  // 标题
  set heading(numbering: none)
  show heading.where(level: 1): set heading(numbering: none)
  show heading: set align(center + top)
  show heading: set text(fill: thu_purple, weight: "bold")

  align(
    (
      text(
        size: 16pt,
        fill: thu_purple,
        weight: "black",
      )[目录]
    ),
    center,
  )

  columns(2, gutter: 40pt)[
    #context {
      let part(part-number, start-chapter, end-chapter) = {
        // 第 n 部分
        align(
          (
            text(
              size: 13.5pt,
              fill: thu_purple,
              weight: "black",
            )[第#{ part-number }部分]
          ),
          center,
        )
        // 筛选章节
        let chapters = query(heading.where()).filter(
          h => (
            // 规定范围
            counter(heading).at(h.location()).first() in range(start-chapter, end-chapter + 1)
          ),
        )
        // 显示
        for chapter in chapters {
          let loc = chapter.location()
          let nr = numbering(
            loc.page-numbering(),
            ..counter(page).at(loc), // 将页码数组分解成单个值
          )
          let counter-arry = counter(heading).at(loc)
          if counter-arry.len() == 1 [
            // link 是为了建立 pdf 的跳转链接
            // 因为 link 后 vscode 预览又无法跳转了，所以章节部分先采用 numbering 可 pdf 跳转，#chapter.body 可用 vscode 跳转
            #text(
              fill: thu_purple,
            )[#link(loc)[*第 #counter-arry.first() 章 #h(0.5em)*] *#chapter.body* #box(width: 1fr, repeat[·]) #nr\ ]
          ] else if counter-arry.len() == 2 {
            link(loc)[
              #par(first-line-indent: 2.3em)[ // 首行缩进
                #counter-arry.first().#counter-arry.at(1) #chapter.body #box(width: 1fr, repeat[·]) #nr
              ]
            ]
          } else if counter-arry.len() == 3 {
            link(loc)[
              #par(first-line-indent: 3.1em)[ // 首行缩进
                #counter-arry.first().#counter-arry.at(1).#counter-arry.at(2) #chapter.body #box(width: 1fr, repeat[·]) #nr
              ]
            ]
          }
        }
      }
      if o-part != () {
        for i in range(o-part.len()) {
          part(..o-part.at(i))
        }
      }
    }
  ]
}
#let beamer_content(body) = {
  // 字体大小
  set text(
    size: 10pt,
  )
  // page 中 header 样式
  let header = grid(
    columns: (1fr, 1fr),
    rows: 1fr,
    context {
      if calc.even(counter(page).get().first()) {
        grid.cell(
          move(
            [
              // 尽管在下面的 header 中调用在 context 环境，但还需要嵌套 context 环境
              // 以获取更新后的 context 环境中的 header-1，否则是更新前的
              #text(fill: thu_purple, size: 11pt)[*#context { header-1.get() }*]
            ],
            dy: -5pt,
          ),
          align: left,
        )
      } else { none }
    },
    context {
      if calc.odd(counter(page).get().first()) {
        grid.cell(
          // 文本
          move(
            [
              // 尽管在下面的 header 中调用在 context 环境，但还需要嵌套 context 环境
              // 以获取更新后的 context 环境中的 header-2，否则是更新前的
              #text(fill: thu_purple, size: 11pt)[*#context { header-2.get() }*]
            ],
            dy: -5pt,
          ),
          align: right,
        )
      } else { none }
    },
    grid.hline(start: 0, end: 2, stroke: (paint: thu_purple)),
  )

  set page(
    // 页码
    numbering: "1",
    // 水印
    background: rotate(-60deg, text(font: (name: "Times New Roman"), 41pt, fill: rgb("#EDF3F6"))[
      Maki's Lab Mathematical Analysis I
    ]),
    // 页眉
    header: context {
      let h1 = query(heading.where(level: 1)).filter(
        x => x.location().page() == locate(here()).page(),
      )
      let h2 = query(heading.where(level: 2)).filter(
        x => x.location().page() == locate(here()).page(),
      )
      // 更新 header-1
      if h1 != () {
        header-1.update[#numbering(
            "第 1 章",
            ..counter(heading).at(h1.first().location()),
          )#h(0.5em)#h1.first().body
        ]
      }
      // 更新 header-2
      if h2 != () {
        header-2.update[#numbering(
            "1.1",
            ..counter(heading).at(h2.first().location()),
          )#h(0.5em)#h2.first().body
        ]
      }
      // 一页内出现一级标题且没有二级标题的情况下，更新 header-2 为 none
      if h1 != () {
        if h2 == () {
          header-2.update[#none]
        }
        // 一级标题所在页无样式
        none
      } else {
        header
      }
      // 再次更新 header：
      // 如果一页出现多次二级标题，前面那次更新的第一个，我们现在需要更新为最后一个
      if h2.len() >= 2 {
        header-2.update[#numbering(
            "1.1",
            ..counter(heading).at(h2.last().location()),
          )#h(0.5em)#h2.last().body
        ]
      }
    },
  )

  counter(page).update(1)

  // 两端对齐
  set par(justify: true)

  // 标题
  show heading: set text(fill: thu_purple, weight: "bold")
  set heading(numbering: "1.1")
  // 不能放到一级标题的 set 中，莫名其妙的原因不生效，这里单独设置
  show heading.where(level: 1): set heading(numbering: "第 1 章")

  // 一级标题
  show heading.where(level: 1): it => {
    set align(center)
    set block(spacing: 3 / 1.4 * 1em)
    set text(size: 2 / 1.4 * 1em)
    // context 1em.to-absolute() // 一级标题的默认字体大小 = 普通文本大小 * 1.4
    pagebreak() // 为一级标题自动添加分页

    // 设置间距
    block([#counter(heading).display() #h(.5em) #it.body], spacing: 3 / 1.4 * 1em)
  }

  // 二级标题
  show heading.where(level: 2): it => {
    set text(size: 1.6 / 1.2 * 1em)
    // context 1em.to-absolute() // 二级标题的默认字体大小 = 普通文本大小 * 1.2

    // 设置间距
    block([#counter(heading).display() #h(.3em) #it.body], spacing: 1.5 / 1.2 * 1em)
  }

  // 三级标题
  show heading.where(level: 3): it => {
    set text(size: 1.3em)
    // context 1em.to-absolute() // 三级标题的默认字体大小 = 普通文本大小 * 1

    // 设置间距
    block([#counter(heading).display() #h(.2em) #it.body], spacing: 1em)
  }

  // 四级标题
  show heading.where(level: 4): it => {
    set text(size: 1em)
    // context 1em.to-absolute() // 四级标题的默认字体大小 = 普通文本大小 * 1

    // 设置间距
    block([#counter(heading).display() #it.body], spacing: 1em)
  }

  // 标题更新 math counter
  show heading.where(): it => {
    it
    context {
      let current-h = counter(heading).get()
      current-h.push(1)
      (
        theorem-counter,
        definition-counter,
        proposition-counter,
      )
        .map(c => c.update(current-h))
        .join()
    }
  }

  body
}
#let beamer_end() = {
  set page(
    fill: thu_purple,
  )
  align(
    center + horizon,
    text(
      fill: white,
      weight: "bold",
      size: 40pt,
      [End of Beamer!],
    ),
  )
}
#let beamer(
  title: none,
  author: none,
  organization: none,
  date: datetime.today(),
  version: none,
  // 章节部分
  o-part: (),
  body,
) = {
  set page(
    paper: "a4",
    margin: 2cm,
    // numbering: "1 / 1", // 显示页码
  )
  set text(
    //font: "Firacode",
    font: (
      (name: "Times New Roman", covers: "latin-in-cjk"), // 在拉丁字母范围内用 Times New Roman 字体
      //"simsun", // 一般用 simsun 宋体
      "Microsoft Yahei UI", // 微软雅黑
    ),
  )

  // 数学字体
  show math.equation: set text(font: (
    "New Computer Modern Math", // 数学
    "kaiti", // 中文
  ))

  beamer_start(
    title: title,
    author: author,
    organization: organization,
    date: date,
    version1: version,
  )
  beamer_outline(o-part)
  beamer_content(body)
  beamer_end()
}
// 在其他文件中引用：
// #import "beamer": beamer

// 在一个文件中
#show: beamer.with(
  title: [Mathematical Analysis I],
  author: "Ran",
  organization: [Maki's Lab],
  //date: datetime(year: 2026, month: 1, day: 1),
  version: (0, 0, 1),
  o-part: (([一], 1, 3), ([二], 4, 6), ([三], 0, 0)),
)
= First
已知角的顶点 $V(x_v,y_v)$，两边上点 $A(x_a,y_a)$ 和 $B(x_b,y_b)$，以及内切圆半径 $r$。求内切圆圆心坐标 $I(x_i,y_i)$.

解：$      arrow(a) & = arrow(V A)=(x_a-x_v,y_a-y_v),arrow(b)=arrow(V B)=(x_b-x_v,y_b-y_v) \
abs(arrow(a)) & = sqrt((x_a-x_v)^2 + (y_a-y_v)^2),abs(arrow(b))=sqrt((x_b-x_v)^2+(y_b-y_v)^2) \
   arrow(u_a) & =arrow(a)/abs(arrow(a))=(u_(a x),u_(a y)),arrow(u_b)=arrow(b)/abs(arrow(b))=(u_(b x),u_(b y)) \
    cos theta & = u_a dot u_b = u_(a x)u_(b x)+ u_(a y)u_(b y) $
设 $arrow(d)=(x_i-x_v,y_i-y_v)$，
$stretch(->)^"菱形的对角线平分其内角"$角平分线方向的单位向量：
$
  arrow(m)
  =(arrow(u_a)+arrow(u_b))/abs(arrow(u_a)+arrow(u_b))
  =(arrow(u_a)+arrow(u_b))/sqrt(abs(arrow(u_a)+arrow(u_b))^2)
  =(arrow(u_a)+arrow(u_b))/sqrt(abs(arrow(u_a))^2+abs(arrow(u_b))^2+2 arrow(u_a) dot arrow(u_b))
  =(arrow(u_a)+arrow(u_b))/sqrt(2 +2 cos theta)
  =(arrow(u_a)+arrow(u_b))/sqrt(4 cos^2 theta/2)
  =(arrow(u_a)+arrow(u_b))/(2 cos theta/2)
$

因为 $I$ 在角平分线上，设
$
  arrow(d)=r/(sin theta/2) times arrow(m)=r/(sin theta/2) times (arrow(u_a)+arrow(u_b))/(2cos theta/2)=r(arrow(u_a)+arrow(u_b))/(sin theta)
$

$t=abs(arrow(d))$ 是 $V$ 到 $I$ 的长度。
由点到直线距离公式得圆心 $I$ 到直线 $V A$ 的距离为：
$
  r=abs(arrow(d)times arrow(u_a))/abs(arrow(u_a))
  =abs(arrow(d) times arrow(u_a))
$

设 $arrow(d)=lambda(arrow(u_a)+arrow(u_b))$

计算 $I$ 到边 $V A$ 的距离：
直线的单位法向量 $arrow(n_a) = (-u_(a y),u_(a x))$
== x_a
#lorem(2100)
= Typst create local package
创建本地 Typst package
+ 确定系统路径：按 Win + R，输入 `%APPDATA%` 回车，会打开 `C:\Users\你的用户名\AppData\Roaming`
+ 创建必要的文件夹结构：`C:\Users\你的用户名\AppData\Roaming\typst\packages\local\<你的包名>\<1.0.0>\`
+ 创建包内容：在 `1.0.0` 文件夹中，你需要创建：
  + `typst.toml` 文件：
  ```toml
  [package]
  name = "mystyle"
  version = "1.0.0"
  authors = ["你的名字"]
  description = "我的本地样式包"
  entrypoint = "lib.typ"
  ```
  + 创建 lib.typ 文件
  ```typst
  // 这里是你包功能实现
  ```
+ 在项目中使用本地包：在你的 Typst 文档找那个这样使用：
  ```typst
  #import "@local/mystyle:1.0.0": *

  #show: mystyle

  = 标题
  这是我的文档内容。

  #myfunction()
  ```
= 测试
#theorem-block(title: "fafaf")[fafaaf]
#definition-block()[fafaaf]
#proposition-block()[fafaf]
#theorem-block()[fafaaf]
#definition-block()[fafaaf]
```typst
// 1. State 测试
#let s = state("demo-state", 0)

// 输出初始值
State 初始值：#context s.get()

// 更新 state
#s.update(3)
State 更新后：#context s.final()

// 2. 插入 metadata / label
#metadata((kind: "demo-meta", value: "first")) #label("demo:one")

#metadata((kind: "demo-meta", value: "second")) #label("demo:two")

// 3. 使用 query/selector 查找 label 并输出信息
#context {
  let items = query(
    selector(label("demo:one")).or(selector(label("demo:two"))),
  )
  [
    #items\
    #items.len()\
    #for it in items [
      #it.value.kind #it.value.value\
    ]
  ]
}

// 4. 遍历所有 demo-meta 类型的 metadata（不依赖具体 label）
// 这里用 selector 来查找 metadata 里 value.kind == "demo-meta" 的条目
#context {
  let a = query(metadata.where()).filter(
    a => a.value.kind == "demo-meta",
  )
  [
    #a\
    #a.len()\
    #for m in a [
      #m.value.kind " / " #m.value.value\

    ]
  ]
  //assert(a.len() < 2, message: "期望至少有两个 demo 标签")
}
```
// 1. State 测试
#let s = state("demo-state", 0)

// 输出初始值
State 初始值：#context s.get()

// 更新 state
#s.update(3)
State 更新后：#context s.final()

// 2. 插入 metadata / label
#metadata((kind: "demo-meta", value: "first")) #label("demo:one")

#metadata((kind: "demo-meta", value: "second")) #label("demo:two")

// 3. 使用 query/selector 查找 label 并输出信息
#context {
  let items = query(
    selector(label("demo:one")).or(selector(label("demo:two"))),
  )
  [
    #items\
    #items.len()\
    #for it in items [
      #it.value.kind #it.value.value\
    ]
  ]
}

// 4. 遍历所有 demo-meta 类型的 metadata（不依赖具体 label）
// 这里用 selector 来查找 metadata 里 value.kind == "demo-meta" 的条目
#context {
  let a = query(metadata.where()).filter(
    a => a.value.at("kind", default: none) == "demo-meta",
  )
  [
    #a\
    #a.len()\
    #for m in a [
      #m.value.kind " / " #m.value.value\

    ]
  ]
  //assert(a.len() < 2, message: "期望至少有两个 demo 标签")
}
-----------------------------------------------------------------------------------------------
= 测试
#theorem-block(
  title: [#lorem(50)],
)[
  #lorem(100)
]
== fafa
#theorem-block(
  title: [#lorem(50)],
)[
  #lorem(100)
]
== 我
#theorem-block(
  title: [#lorem(50)],
)[
  #lorem(100)
]
#lorem(10)
== 我
#theorem-block(
  title: [#lorem(50)],
)[
  #lorem(100)
]
======
#definition-block[#lorem(100)]
#definition-block[#lorem(100)]
#definition-block[#lorem(100)]
#theorem-block(
  title: [#lorem(50)],
)[
  #lorem(100)
]
#corollary-block[
  #lorem(100)
]
#corollary-block[
  #lorem(100)
]


#import "@preview/theorion:0.4.1": *
#import cosmos.fancy: *
// #import cosmos.rainbow: *
// #import cosmos.clouds: *
#show: show-theorion



/// 1. Change the counters and numbering:
// #set-inherited-levels(1)
// #set-zero-fill(true)
// #set-leading-zero(true)
// #set-theorion-numbering("1.1")

/// 2. Other options:
// #set-result("noanswer")
// #set-qed-symbol[#math.qed]

/// 3. Custom theorem environment for yourself
// #let (theorem-counter, theorem-box, theorem, show-theorem) = make-frame(
//   "theorem",
//   "Theorem",  // supplement, string or dictionary like `(en: "Theorem")`, or `theorion-i18n-map.at("theorem")` for built-in i18n support
//   counter: theorem-counter,  // inherit the counter, `none` by default
//   inherited-levels: 2,  // useful when you need a new counter
//   inherited-from: heading,  // heading or another counter
//   render: (prefix: none, title: "", full-title: auto, body) => [#strong[#full-title.]#sym.space#emph(body)],
// )
// #show: show-theorem

/// 4. Just use it.
// #theorem(title: "Euclid's Theorem")[
//   There are infinitely many prime numbers.
// ] <thm:euclid>
// #theorem-box(title: "Theorem without numbering", outlined: false)[
//   This theorem is not numbered.
// ]

/// 5. Example of appendix
// #counter(heading).update(0)
// #set heading(numbering: "A.1")
// #set-theorion-numbering("A.1")

/// 6. Table of contents
// #outline(title: none, target: figure.where(kind: "theorem"))

= Theorion Environments

== Table of Theorems

#outline(title: none, target: figure.where(kind: "theorem"))

== Basic Theorem Environments

Let's start with the most fundamental definition.

#definition[
  A natural number is called a #highlight[_prime number_] if it is greater than 1
  and cannot be written as the product of two smaller natural numbers.
] <def:prime>

#definition-block()[faf]
#example[
  The numbers $2$, $3$, and $17$ are prime. As proven in @cor:infinite-prime,
]

#theorem(title: "Euclid's Theorem")[
  There are infinitely many prime numbers.
] <thm:euclid>

#proof[
  By contradiction: Suppose $p_1, p_2, dots, p_n$ is a finite enumeration of all primes.
  Let $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
  it cannot be prime. Thus, some prime $p_j$ divides $P + 1$.
  Since $p_j$ also divides $P$, it must divide their difference $(P + 1) - P = 1$,
  a contradiction.
]

#corollary[
  There is no largest prime number.
] <cor:infinite-prime>

#lemma[
  There are infinitely many composite numbers.
]

== Functions and Continuity

#theorem(title: "Continuity Theorem")[
  If a function $f$ is differentiable at every point, then $f$ is continuous.
] <thm:continuous>

#tip-box[
  @thm:continuous tells us that differentiability implies continuity,
  but not vice versa. For example, $f(x) = |x|$ is continuous but not differentiable at $x = 0$.
  For a deeper understanding of continuous functions, see @thm:max-value in the appendix.
]

== Geometric Theorems

#theorem(title: "Pythagorean Theorem")[
  In a right triangle, the square of the hypotenuse equals the sum of squares of the other two sides:
  $x^2 + y^2 = z^2$
] <thm:pythagoras>

#important-box[
  @thm:pythagoras is one of the most fundamental and important theorems in plane geometry,
  bridging geometry and algebra.
]

#corollary[
  There exists no right triangle with sides measuring 3cm, 4cm, and 6cm.
  This directly follows from @thm:pythagoras.
] <cor:pythagoras>

#lemma[
  Given two line segments of lengths $a$ and $b$, there exists a real number $r$
  such that $b = r a$.
] <lem:proportion>

== Algebraic Structures

#definition(title: "Ring")[
  Let $R$ be a non-empty set with two binary operations $+$ and $dot$, satisfying:
  1. $(R, +)$ is an abelian group
  2. $(R, dot)$ is a semigroup
  3. The distributive laws hold
  Then $(R, +, dot)$ is called a ring.
] <def:ring>

#proposition[
  Every field is a ring, but not every ring is a field. This concept builds upon @def:ring.
] <prop:ring-field>

#proposition-block[
  Every field is a ring, but not every ring is a field. This concept builds upon @def:ring.
] <prop:ring-field>

#example[
  Consider @def:ring. The ring of integers $ZZ$ is not a field, as no elements except $plus.minus 1$
  have multiplicative inverses.
]
#corollary-block[
  Every field is a ring, but not every ring is a field. This concept builds upon @def:ring.
]
/// Appendix
#counter(heading).update(0)
#set heading(numbering: "A.1")
#set-theorion-numbering("A.1")

= Theorion Appendices

== Advanced Analysis

#theorem(title: "Maximum Value Theorem")[
  A continuous function on a closed interval must attain both a maximum and a minimum value.
] <thm:max-value>

#warning-box[
  Both conditions of this theorem are essential:
  - The function must be continuous
  - The domain must be a closed interval
]

== Advanced Algebra Supplements

#axiom(title: "Group Axioms")[
  A group $(G, \cdot)$ must satisfy:
  1. Closure
  2. Associativity
  3. Identity element exists
  4. Inverse elements exist
] <axiom:group>

#postulate(title: "Fundamental Theorem of Algebra")[
  Every non-zero polynomial with complex coefficients has a complex root.
] <post:fta>

#remark[
  This theorem is also known as Gauss's theorem, as it was first rigorously proved by Gauss.
]

== Common Problems and Solutions

#problem[
  Prove: For any integer $n > 1$, there exists a sequence of $n$ consecutive composite numbers.
]

#solution[
  Consider the sequence: $n! + 2, n! + 3, ..., n! + n$

  For any $2 <= k <= n$, $n! + k$ is divisible by $k$ because:
  $n! + k = k(n! / k + 1)$

  Thus, this forms a sequence of $n-1$ consecutive composite numbers.
]

#exercise[
  1. Prove: The twin prime conjecture remains unproven.
  2. Try to explain why this problem is so difficult.
]

#conclusion[
  Number theory contains many unsolved problems that appear deceptively simple
  yet are profoundly complex.
]

== Important Notes

#note-box[
  Remember that mathematical proofs should be both rigorous and clear.
  Clarity without rigor is insufficient, and rigor without clarity is ineffective.
]

#caution-box[
  When dealing with infinite series, always verify convergence before discussing other properties.
]

#quote-box[
  Mathematics is the queen of sciences, and number theory is the queen of mathematics.
  — Gauss
]

#emph-box[
  Chapter Summary:
  - We introduced basic number theory concepts
  - Proved several important theorems
  - Demonstrated different types of mathematical environments
]

== Restated Theorems

// 1. Restate all theorems
#theorion-restate(filter: it => it.outlined and it.identifier == "theorem", render: it => it.render)
// 2. Restate all theorems with custom render function
// #theorion-restate(
//   filter: it => it.outlined and it.identifier == "theorem",
//   render: it => (prefix: none, title: "", full-title: auto, body) => block[#strong[#full-title.]#sym.space#emph(body)],
// )
// 3. Restate a specific theorem
// #theorion-restate(filter: it => it.label == <thm:euclid>)
