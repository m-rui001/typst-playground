#let column-major-table(rows: 1, ..args) = {
  assert.eq(
    args
      .pos()
      .find(
        it => it == auto,
      ),
    none,
    message: "Invalid data type found: auto.",
  )
  let coords-out-of-bounds = (:)
  let is-obstacle(item) = {
    // 包含所有非 content 类型（其中只有 str 和 none 是合法的，其他的类型需要报错，但是报错交由 table 函数处理）
    // 包含所有非 table.cell 且非 table.line 的 content 类型
    // 包含所有 x, y 均为 auto 的 table.cell 类型（含默认值）
    if type(item) != content { return true }
    // item is of type content
    let f = item.func()
    if f != table.cell and f != table.hline and f != table.vline { return true }
    if (
      f == table.cell
        and {
          let (at-x, at-y) = {
            (item.at("x", default: auto), item.at("y", default: auto))
          }
          (at-x, at-y) == (auto, auto)
        }
    ) { return true }
    return false
  }
  let is-line(item) = {
    if type(item) != content { return false }
    let f = item.func()
    if f != table.vline and f != table.hline { return false }
    return true
  }
  // 根据 x、y 推导实际坐标。
  // (auto,auto) -> flow 对应坐标
  // (auto,int)  -> 该行第一个空位
  // (int,auto)  -> 该列第一个空位
  // (int,int)   -> 原样返回
  let resolve-coords(dict, x: auto, y: auto) = {
    let (flow, matrix) = dict
    let rows = matrix.len()
    assert.ne(rows, 0, message: "Matrix field in dict can not be empty array.")
    assert.eq(type(flow), int, message: "Bad data type: field flow must be of type int.")
    assert(flow >= 0, message: "Bad data: field flow must be at least zero.")
    if x != auto {
      assert.eq(type(x), int, message: "Coordinate x must be of type auto or of type int.")
      assert(x >= 0, message: "Coordinate x is out of bounds.")
    }
    if y != auto {
      assert.eq(type(y), int, message: "Coordinate y must be of type auto or of type int.")
      assert(y >= 0 and y < rows, message: "Coordinate y is out of bounds.")
    }

    let (target-x, target-y) = if (x, y) == (auto, auto) {
      (calc.div-euclid(flow, rows), calc.rem-euclid(flow, rows))
    } else if x == auto {
      // (x, y) == (auto, int)
      let row-cells = matrix.at(y)
      let pos-x = row-cells.position(
        // 沿 X 轴线性探测首个空位（内容为 auto 的位置）
        it => it == auto,
      )
      (if pos-x == none { row-cells.len() } else { pos-x }, y) // 没找到，则为末尾
    } else if y == auto {
      // (x, y) == (int, auto)
      // 沿 Y 轴扫描所有行，寻找指定的 target-x 为空位的行
      let pos-y = range(rows).position(
        idx-y => {
          let row-cells = matrix.at(idx-y)
          x >= row-cells.len() or row-cells.at(x) == auto
        },
      )
      // 若所有行的 target-x 位置都被占用，则说明该列已满
      if pos-y == none {
        panic("Cell could not be placed in column " + str(x) + ", because it was full.")
      }
      (x, pos-y)
    } else {
      (x, y)
    }

    return (x: target-x, y: target-y)
  }
  let read-at(dict, x: auto, y: auto) = {
    // 如果 (x,y) == (auto,auto) ，就读取 dict.flow 对应的行和列
    // 如果 x != auto and y != auto ，就读取指定位置的单元格
    // 否则报错
    let (matrix,) = dict
    if (x == auto) != (y == auto) {
      // 即 xor
      panic("Coordinates must be both auto or both of type int.")
    }

    let (x, y) = resolve-coords(dict, x: x, y: y)

    let a = matrix.at(y, default: coords-out-of-bounds)
    if a == coords-out-of-bounds {
      return coords-out-of-bounds
    } else {
      return a.at(x, default: coords-out-of-bounds)
    }
  }

  /// 在 dict.at("matrix") 的 (x,y) 处插入单元格
  ///
  /// - dict (dictionary): 含有 flow 键和 matrix 键
  /// - value (any):
  /// - x (auto | int):
  /// - y (auto | int):
  /// -> dictionary
  ///
  /// 执行流程：
  /// 1. 坐标寻址阶段（主循环控制）：
  ///    根据单元格的坐标属性，显式解析出最终的绝对坐标 (target-x, target-y)：
  ///    - 流布局 (auto, auto)：利用 flow 指针映射坐标。若网格已被占用，flow 严格自增探测，直至找到空位。
  ///    - 双显式定位 (int, int)：直接指定目标坐标，不改变 flow 指针。
  ///    - 单坐标定位（单 X 或单 Y）：固定已知轴，沿未知轴线性递增探测首个空位。若超出最大行限制，直接抛出越界异常（row index out of bounds）。
  ///
  /// 2. 矩阵写入阶段（原子纯函数）：
  ///    接收确定的绝对坐标，不再承担寻找位置的职责，仅对矩阵状态进行分类处理：
  ///    - 状态 A（越界）：目标坐标超出当前矩阵边界，在前方自动填充 auto 补齐后执行插入。
  ///    - 状态 B（空位）：目标位置存在且内容为 auto，直接替换该网格内容。
  ///    - 状态 C（冲突）：目标位置已被其他单元格占用，直接触发 panic 终止程序。
  let insert-at(dict, value, x: auto, y: auto) = {
    let (flow, matrix) = dict
    let rows = matrix.len()
    if (x, y) == (auto, auto) {
      // 全 auto ，自动寻找空位
      let item = none
      while {
        item = read-at((flow: flow, matrix: matrix)) // 一定注意别写成 dict 了
        item != auto and item != coords-out-of-bounds
      } {
        flow += 1
      }
      let (x, y) = resolve-coords((flow: flow, matrix: matrix), x: x, y: y)
      if item == auto {
        matrix.at(y).at(x) = value
      } else {
        // item == coords-out-of-bounds
        let (x: _, y: new-y) = resolve-coords((flow: flow, matrix: matrix)) // 一定注意别写成 dict 了
        matrix.at(new-y).push(value)
      }
    } else if x != auto and y != auto {
      // 全指定，要么指定位置写入，要么报错
      let item = read-at(dict, x: x, y: y)
      if item != auto and item != coords-out-of-bounds {
        panic("Attempted to place a second cell at column " + str(x) + ", row " + str(y) + ".")
      } else if item == auto {
        // 覆写 auto
        matrix.at(y).at(x) = value
      } else {
        // item == coords-out-of-bounds
        // 自动在前面补若干 auto
        let size = matrix.at(y).len()
        matrix.at(y) += (auto,) * (x - size)
        matrix.at(y).push(value)
      }
    } else if x == auto {
      // (x,y) == (auto, int)
      // 允许在 x 方向上递增
      let (x, y) = resolve-coords(dict, x: x, y: y) // 注意这个函数在这种情形下返回的直接就是空位
      let item = read-at(dict, x: x, y: y)
      if item != auto and item != coords-out-of-bounds {
        panic("I am amazed that you will reach here! Maybe there are some bugs in get-abs-coords.") // unpossible
      } else if item == auto {
        matrix.at(y).at(x) = value
      } else {
        // item == coords-out-of-bounds
        // 这种情况下不需要在前面补充 auto
        matrix.at(y).push(value)
      }
    } else if y == auto {
      // (x,y) == (int, auto)
      // 允许在 y 方向上递增，注意 y < rows
      let (x, y) = resolve-coords(dict, x: x, y: y) // 注意这个函数在这种情形下返回的直接就是空位
      let item = read-at(dict, x: x, y: y)
      if item != auto and item != coords-out-of-bounds {
        panic("I am amazed that you will reach here! Maybe there are some bugs in get-abs-coords.") // unpossible
      } else if item == auto {
        matrix.at(y).at(x) = value
      } else {
        // item == coords-out-of-bounds
        // 超出 rows 的 panic 已经由 get-abs-coords 做了
        // 需要填充 auto
        let size = matrix.at(y).len()
        matrix.at(y) += (auto,) * (x - size)
        matrix.at(y).push(value)
      }
    } else {
      panic("I am amazed that you will reach here!") // unpossible
    }
    return (flow: flow, matrix: matrix)
  }
  let get-lines(stack-args) = {
    // 记录所有应该被 attach 的 table.line
    let arr = stack-args.rev()
    // 查找反转后第一个阻碍物的索引
    let idx = arr.position(is-obstacle)
    // 截取阻碍物之前的元素（即原数组中阻碍物之后的元素）
    let targets = if idx != none {
      arr.slice(0, idx)
    } else {
      arr
    }
    // 直接过滤并追加
    return targets.filter(is-line)
  }

  let rows = rows
  let stack-args = args.pos().rev()
  let dict = (flow: 0, matrix: ((),) * rows) // flow 是当前应写入位置
  while stack-args != () {
    // let dict = (flow: flow, matrix: matrix)
    let item = stack-args.pop()
    if is-line(item) { continue } // 排除 table.line
    let lines = get-lines(stack-args)
    lines.insert(0, item)
    let binded-item = lines
    if is-obstacle(item) {
      // 按照 flow 填入 matrix
      dict = insert-at(dict, binded-item) // 注意插入的时候要用 binded-item
    } else {
      // is-line(item)
      // and ((x != auto) or (y != auto))
      // 不能有 lines attached ，插入的时候用 item
      let x = item.at("x", default: auto)
      let y = item.at("y", default: auto)
      dict = insert-at(dict, item, x: x, y: y) // 注意要用 item
    }
  }
  let (matrix,) = dict
  let cols = calc.max(..matrix.map(
    it => it.len(),
  ))
  // layout alignment
  let contents = matrix.map(
    it => {
      it + range(cols - it.len()).map(_ => none)
    },
  )
  // replace auto with none
  contents = contents
    .flatten()
    .map(
      it => {
        if it == auto {
          none
        } else {
          it
        }
      },
    )
  table(
    columns: cols,
    ..args.named(),
    ..contents
  )
}




#let contents = (
  $a$,
  $b$,
  table.hline(start: 0, end: 2),
  $c$,
  $d$,
  table.vline(),
  $e$,
  $f$,
  table.cell(x: 2, y: 3, "x"),
  $g$,
  $h$,
  table.vline(),
  $i$,
  $j$,
  table.cell([你]),
  $k$,
  $l$,
  $m$,
)

#column-major-table(
  rows: 5,
  stroke: none,
  ..contents,
)


#divider()

#table(
  columns: 5,
  stroke: none,
  ..contents
)

#divider()

#import "@preview/tyipa:0.1.1" as tyipa
#import "@preview/theorion:0.6.0": remark, show-remark
#show: show-remark

// 自定义下划线函数(#u)：
// width 参数为必填命名参数，指定固定宽度，内容自动居中
// 使用: #u(width: )[]
// 来自 "@preview/zh-format:0.1.0"
#let u(width: none, offset: 0.2em, stroke: 0.05em + black, body) = {
  assert.ne(width, none, message: "参数 width 是必填的")
  // context {
  let line_width = width

  box(width: line_width)[
    #align(center, body)
    #place(
      bottom + left,
      dy: offset,
      line(length: line_width, stroke: stroke),
    )
  ]
  // }
}
#let blank-uline(width: auto, offset: 0.2em, stroke: 0.05em + black, body: none) = context {
  assert.ne(width, none, message: "参数 width 不能为 none")
  // 如果 width 是 auto ，那么 width 是 max{4em, 内容宽度}
  h(0pt, weak: true)
  u(
    width: { if width == auto { calc.max(4em.to-absolute(), measure(body).width) } else { width } },
    // width: width,
    offset: offset,
    stroke: stroke,
    body,
  )
  h(0pt, weak: true)
}

#let ipa(body) = tyipa.text(delim: "/")[
  #set text(font: "Gentium", fill: white)
  // #h(0pt, weak: true)
  #box(radius: 1em, inset: 0.3em, fill: gray, body)
  #h(0pt, weak: true)
]


// #set page(columns: 2)


#grid(
  align(center, column-major-table(
    rows: 2,
    stroke: none,
    // table.cell(x:0)[]
    ipa("i length-mark"),
    ipa("I"),
    ipa("e"),
    ipa("ae"),
    ipa("epsilon.reversed length-mark"),
    ipa("schwa"),
    ipa("alpha length-mark"),
    ipa("wedge"), // ipa("v.turned"),
    ipa("o.open length-mark"),
    ipa("alpha.turned"),
    ipa("u length-mark"),
    ipa("upsilon"),
    // table.vline(),
    // none,
    ipa("e I"),
    ipa("a I"),
    ipa("o.open I"),
    ipa("schwa upsilon"),
    ipa("a upsilon"),
    ipa("I schwa"),
    ipa("e schwa"),
    ipa("upsilon schwa"),
  )),
  grid[
    #remark[#ipa("i") 是 #ipa("I") 的音位变体， #ipa("u") 是 #ipa("upsilon") 的音位变体，这两个变体音 #ipa("i") 和 #ipa("u") 是弱读音，出现在非重读音节中。
    ]
  ],
)


#import table.cell as cell
#grid(
  align(center, column-major-table(
    rows: 3,
    stroke: none,
    cell(x: 0)[清音],
    cell(x: 0)[浊音],
    cell(x: 0, none),
    cell(y: 2, ipa("m")),
    cell(y: 2, ipa("n")),
    cell(y: 2, ipa("engma")),
    cell(y: 2, ipa("l")),
    cell(y: 2, ipa("r")),
    cell(y: 2, ipa("w")),
    cell(y: 2, ipa("j")),
    cell(y: 2, none),
    // table.cell(y: 2, x: 0, colspan: 8)[
    //   #ipa("m") #ipa("n")
    // ],
    ipa("p"),
    ipa("b"),
    ipa("t"),
    ipa("d"),
    ipa("k"),
    ipa("g"),
    ipa("f"),
    ipa("v"),
    ipa("theta"),
    ipa("eth"),
    ipa("s"),
    ipa("z"),
    ipa("esh"),
    ipa("ezh"),
    ipa("t esh"), // ipa("tied(t esh)")
    ipa("d ezh"),
    ipa("h"),
  )),
  grid[
    #remark[
      不用连字形式写塞擦音。即写 #ipa("t esh") 而非 #ipa("tesh") ，写 #ipa("d ezh") 而非 #ipa("dezh") 。
    ]
  ][
    #remark[
      不将辅音连缀 #ipa("t r") #ipa("d r") #ipa("t s") #ipa("d z") 当做独立音素。
    ]
  ][
    #remark[
      注意不送气化与浊化的区别。如 pan #blank-uline(body: ipa("p h.raised ae n")) #h(1em) span #blank-uline(body: ipa("s p ae n")) ，其中 #ipa("h.raised") 代表送气。
    ]
  ],
)



语音教程可以看`英语兔`。

