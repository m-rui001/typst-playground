#show list: it => {
  let abc = ("A.","B.","C.","D.","E.","F.","G.","H.")
  let n = it.children.len()
  layout( size => style(styles => {
    let contentWidth = size.width - 70pt
    let lineMaxWidth = measure( it.children.enumerate().first().last().body, styles ).width
    for i in range(n) {
      let lineWidth = measure( it.children.enumerate().at(i).last().body, styles ).width
      if (lineMaxWidth < lineWidth) { lineMaxWidth = lineWidth }
    }
    let cols = 1
    if contentWidth >= (lineMaxWidth * 400%) { cols = 4 }
    else if contentWidth >= (lineMaxWidth * 200%) { cols = 2 }
    grid(
      columns: (1fr,) * calc.min( cols,n),
      gutter: 0.75em,
      ..it.children.enumerate().map(item => [#abc.at(item.first())#item.last().body]),
    )
  }))
}

+ 我是选择题1
    - 我是选项A
    - 我是选项B
    - 我是选项C
    - 我是选项D

+ 我是选择题2
    - 我是单位圆：$x^2+y^2=1$
    - 我是选项B
    - 我是选项C
    - 我是选项D

+ 我是选择题3
    - 我是选项A:$integral_a^b f(x) dif x = F(x)|_a^b = F(b)-F(a)$
    - 我是选项B
    - 我是选项C
    - 我是选项D
