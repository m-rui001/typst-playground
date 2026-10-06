// 两向量相减
#let arry-dif(a1, a2) = a1.zip(a2, exact: true).map(vector => vector.first() - vector.at(1))
// 向量的模
#let vector-norm(v) = calc.pow(calc.pow(v.first(), 2) + calc.pow(v.at(1), 2), 0.5)
// 单位向量
#let unit-vector(v) = v.map(vector => vector / vector-norm(v))
// 两向量相乘
#let vector-times(v1, v2) = {
  let arry-times(v1, v2) = v1.zip(v2, exact: true).map(v => v.first() * v.at(1))
  arry-times(v1, v2).first() + arry-times(v1, v2).at(1)
}
// 两向量的夹角
#let theta(v1, v2) = {
  calc.acos(vector-times(unit-vector(v1), unit-vector(v2)))
  // 注意，如果转弧度：theta(v1, v2) * calc.pi / 180deg
}

// 返回内切圆的圆心坐标和 p1,p2 所在边的切点坐标
#let center(p1, vertex, p2, r) = {
  let a = arry-dif(p1, vertex) // vertex -> p1
  let b = arry-dif(p2, vertex) // vertex -> p2
  // 夹角 theta 的 cos 值
  let sin-theta = calc.sin(theta(a, b) * calc.pi / 180deg)
  // 圆心坐标
  let circle-center = (
    // x
    vertex.first() + r / sin-theta * (unit-vector(a).first() + unit-vector(b).first()),
    // y
    vertex.at(1) + r / sin-theta * (unit-vector(a).at(1) + unit-vector(b).at(1)),
  )
  let p1p = unit-vector(arry-dif(p1, vertex))
  let p2p = unit-vector(arry-dif(p2, vertex))
  (
    // 圆心坐标
    circle-center,
    // p1 所在边的切点坐标
    arry-dif(vertex, p1p.map(v => vector-times(arry-dif(vertex, circle-center), p1p) * v)),
    // p2 所在边的切点坐标
    arry-dif(vertex, p2p.map(v => vector-times(arry-dif(vertex, circle-center), p2p) * v)),
  )
}

#let plot2(p1, vertex, p2, r, color, thickness) = {
  import "@preview/tiptoe:0.4.0": * // 引入 arc
  let t1o = arry-dif(center(p1, vertex, p2, r).at(1), center(p1, vertex, p2, r).at(0))
  let t2o = arry-dif(center(p1, vertex, p2, r).at(2), center(p1, vertex, p2, r).at(0))
  let thp1 = if t1o.at(1) <= 0 {
    // 注意：typst y 的上方向是负
    theta(t1o, (1, 0))
  } else if t1o.at(1) > 0 {
    360deg - theta(t1o, (1, 0))
  }

  let thp2 = if t2o.at(1) <= 0 {
    theta(t2o, (1, 0))
  } else if t2o.at(1) > 0 {
    360deg - theta(t2o, (1, 0))
  }

  (
    // 圆弧
    arc(
      origin: center(p1, vertex, p2, r).first().map(h => h * 1pt),
      angle: -thp1, // Start angle
      arc: -60deg,
      radius: r * 1pt,
      stroke: (paint: color, thickness: thickness),
    ),
  )
    .map(element => place(element))
    .join()
}

// 绘制 hexagon
#let plotx(hexagon-r, circle-r, color, thickness) = {
  // 正六边形的顶点
  let vertex = (
    // hexagon-r 是正六边形外接圆的半径
    (hexagon-r * calc.cos(60deg), -hexagon-r * calc.sin(60deg)), // 上右
    (-hexagon-r * calc.cos(60deg), -hexagon-r * calc.sin(60deg)), // 上左
    (-hexagon-r, 0), // 左
    (-hexagon-r * calc.cos(60deg), hexagon-r * calc.sin(60deg)), // 下左
    (hexagon-r * calc.cos(60deg), hexagon-r * calc.sin(60deg)), // 下右
    (hexagon-r, 0), // 右
  )

  // 正六边形中任意两边与其内切圆的切点
  let tangent = {
    // circle-r 是正六边形内切圆的半径
    for i in range(1, 3) {
      (
        center(vertex.at(0), vertex.at(1), vertex.at(2), circle-r).at(i),
        center(vertex.at(1), vertex.at(2), vertex.at(3), circle-r).at(i),
        center(vertex.at(2), vertex.at(3), vertex.at(4), circle-r).at(i),
        center(vertex.at(3), vertex.at(4), vertex.at(5), circle-r).at(i),
        center(vertex.at(4), vertex.at(5), vertex.at(0), circle-r).at(i),
        center(vertex.at(5), vertex.at(0), vertex.at(1), circle-r).at(i),
      )
    }
  }

  // 连接切线的直线
  set line(stroke: (paint: color, thickness: thickness))

  for i in range(6) {
    (
      if i == 0 {
        line(
          start: tangent.at(i).map(x => x * 1pt),
          end: tangent.at(11).map(x => x * 1pt),
        )
      } else {
        line(
          start: tangent.at(i).map(x => x * 1pt),
          end: tangent.at(i + 5).map(x => x * 1pt),
        )
      },
    )
  }
    .map(element => place(element))
    .join()

  // 圆弧
  for i in range(4) {
    plot2(vertex.at(i), vertex.at(i + 1), vertex.at(i + 2), circle-r, color, thickness)
  }
  plot2(vertex.at(4), vertex.at(5), vertex.at(0), circle-r, color, thickness)
  plot2(vertex.at(5), vertex.at(0), vertex.at(1), circle-r, color, thickness)
}


// 绘制多层 hexagon
#let layer-hexagon(hexagon-r, circle-r, color, thickness, layer-r, layer, x, y) = place(
  for i in range(layer) {
    plotx(hexagon-r + layer-r * i, circle-r, color, thickness)
  },
  dx: x,
  dy: y,
)
