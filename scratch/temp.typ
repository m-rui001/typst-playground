/// Convert a stroke object to a dictionary
#let stroke-to-dict(s) = {
  if type(s) == dictionary {
    s = stroke(s)
  }
  let t = type(s)
  if t in (color, gradient, tiling) {
    return (paint: s)
  } else if t == length {
    return (thickness: s)
  } else if t == stroke {
    return (
      paint: s.paint,
      thickness: s.thickness,
      join: s.join,
      cap: s.cap,
      miter-limit: s.miter-limit,
      dash: s.dash,
    )
  }
  return (thickness: 0pt)
}

/// Merge two stroke with `top` overriding `bottom`.
/// Attributes missing or set to `auto` in `top` inherit values from `bottom`.
///
/// - top (stroke): High-priority stroke style.
/// - bottom (stroke): Base stroke style.
/// -> dictionary
#let merge-stroke(top, bottom) = {
  let expand-auto(top-dict, bottom-dict) = {
    let res = top-dict
    for (k, v) in bottom-dict {
      if res.at(k, default: auto) == auto {
        // 对于同名的键，非 auto 时覆盖，auto 时继承
        res.insert(k, v)
      }
    }
    return res
  }
  let b-stroke = stroke-to-dict(bottom)
  let t-stroke = stroke-to-dict(top)
  expand-auto(t-stroke, b-stroke)
}



#let _base-stroke = (
  paint: blue,
  thickness: 0.03em,
  cap: "round",
  join: "round",
  // dash: "dashed",
)

#let parametric-curve-2d(
  x: t => none,
  y: t => none,
  t-range: (0, 0),
  max-dist: 1, // 距离临界值（默认 1，对应 1pt / 1 绘图坐标单位）
  max-angle: 1deg, // 角度临界值（默认 10deg，即 MAX_BEND）
  max-depth: 12, // 最大二分深度（GeoGebra 为 16，Typst 推荐 10~12 兼顾性能）
  init-steps: 80, // 初始均匀采样段数（GeoGebra 默认至少 80 段）
  length: 1em,
  fill: none,
  stroke: _base-stroke,
  inline: false,
) = {
  // 1. 参数校验
  let start = t-range.first()
  let end = t-range.last()
  let numeric = (int, float, decimal)

  assert(type(x) == function, message: "x must be a function")
  assert(type(y) == function, message: "y must be a function")
  assert(type(t-range) == array and t-range.len() == 2, message: "t-range must be an array of length 2")
  assert(type(start) in numeric and type(end) in numeric, message: "elements of t-range must be numeric")
  assert(start < end, message: "t-range start cannot be greater than end")
  assert(type(max-dist) in numeric and max-dist > 0, message: "max-dist must be a positive number")
  assert(type(max-depth) == int and max-depth > 0, message: "max-depth must be a positive integer")
  assert(type(init-steps) == int and init-steps > 0, message: "init-steps must be a positive integer")

  import "@preview/cetz:0.5.2": canvas, draw
  import draw: line

  // 将角度统一转换为弧度值
  let max-angle-rad = if type(max-angle) == angle { max-angle / 1rad } else { max-angle * calc.pi / 180 }

  // 2. 轴安全求值函数（含 NaN/Inf/无定义 检测，仿 GeoGebra isCurveUndefinedAt）
  let safe-eval(t) = {
    let vx = x(t)
    let vy = y(t)
    if vx == none or vy == none { return (pt: none, valid: false) }
    let fx = float(vx)
    let fy = float(vy)
    if float.is-nan(fx) or float.is-nan(fy) or float.is-infinite(fx) or float.is-infinite(fy) {
      return (pt: none, valid: false)
    }
    return (pt: (fx, fy), valid: true)
  }

  // 3. 计算折线偏转角 (向量 Pa-Pm 与 Pm-Pb 的夹角)
  let calc-bend-angle(pa, pm, pb) = {
    let u = (pm.at(0) - pa.at(0), pm.at(1) - pa.at(1))
    let v = (pb.at(0) - pm.at(0), pb.at(1) - pm.at(1))
    let lu = calc.sqrt(u.at(0) * u.at(0) + u.at(1) * u.at(1))
    let lv = calc.sqrt(v.at(0) * v.at(0) + v.at(1) * v.at(1))
    if lu == 0 or lv == 0 { return 0.0 }
    let dot = u.at(0) * v.at(0) + u.at(1) * v.at(1)
    let cos-val = calc.max(-1.0, calc.min(1.0, dot / (lu * lv)))
    return calc.acos(cos-val)
  }

  // 4. 两点间欧式距离
  let dist(pa, pb) = {
    calc.sqrt(calc.pow(pb.at(0) - pa.at(0), 2) + calc.pow(pb.at(1) - pa.at(1), 2))
  }

  // 5. 自适应二分递归（John Gillam 算法核心 logic）
  // 传入已求值节点 (t, pt, valid)，实现节点复用与栈缓存，不重复计算已评估的点
  let subdivide(node-a, node-b, depth) = {
    // 若端点存在未定义点/奇点，递归二分定位断点边界
    if not node-a.valid or not node-b.valid {
      if depth >= max-depth { return (node-b,) }
      let tm = (node-a.t + node-b.t) / 2
      let node-m = (t: tm) + safe-eval(tm)
      let left = subdivide(node-a, node-m, depth + 1)
      let right = subdivide(node-m, node-b, depth + 1)
      return left + right
    }

    // 达到最大递归深度，强制停止
    if depth >= max-depth {
      return (node-b,)
    }

    let pa = node-a.pt
    let pb = node-b.pt
    let d = dist(pa, pb)

    let tm = (node-a.t + node-b.t) / 2
    let node-m = (t: tm) + safe-eval(tm)

    // 中点遭遇奇点
    if not node-m.valid {
      let left = subdivide(node-a, node-m, depth + 1)
      let right = subdivide(node-m, node-b, depth + 1)
      return left + right
    }

    let pm = node-m.pt
    let bend-angle = calc-bend-angle(pa, pm, pb)

    // GeoGebra 核心判定：两点间距离过大 OR 相邻线段弯曲角度过大
    let need-subdivide = (d > max-dist) or (bend-angle.rad() > max-angle-rad)

    if need-subdivide {
      let left = subdivide(node-a, node-m, depth + 1)
      let right = subdivide(node-m, node-b, depth + 1)
      left + right
    } else {
      (node-b,)
    }
  }

  // 6. 初始采样划分 (CurvePlotter 逻辑，确保宏观不遗漏细节)
  let dt = (end - start) / init-steps
  let node-start = (t: start) + safe-eval(start)
  let raw-nodes = (node-start,)

  for i in range(0, init-steps) {
    let ta = start + i * dt
    let tb = start + (i + 1) * dt
    let node-a = (t: ta) + safe-eval(ta)
    let node-b = (t: tb) + safe-eval(tb)
    let sub-nodes = subdivide(node-a, node-b, 0)
    raw-nodes = raw-nodes + sub-nodes
  }

  // 7. 奇点截断与路径拆分（遇到无定义点自动换笔，避免跨越渐近线错误连线）
  let paths = ()
  let current-path = ()

  for node in raw-nodes {
    if node.valid {
      current-path.push(node.pt)
    } else {
      if current-path.len() >= 2 {
        paths.push(current-path)
      }
      current-path = ()
    }
  }
  if current-path.len() >= 2 {
    paths.push(current-path)
  }

  // 8. 绘制渲染
  let final-stroke = merge-stroke(stroke, _base-stroke)
  let core = {
    for p in paths {
      line(..p, fill: fill, stroke: final-stroke)
    }
  }

  if inline {
    core
  } else {
    canvas(length: length, {
      core
    })
  }
}


#let envelope(
  omega_1: 3,
  omega_2: 2,
  r_1: 2,
  r_2: 0,
  ..args,
) = {
  assert(r_1 >= 0 and r_2 >= 0, message: "Radius must be non-negative.")
  let u(t) = omega_1 * (r_1 * calc.cos((omega_1 - omega_2) * t) - r_2)
  let v(t) = omega_2 * (r_2 * calc.cos((omega_1 - omega_2) * t) - r_1)
  let factor(t) = (
    (u(t) * r_2 + v(t) * r_1) / (u(t) * u(t) + v(t) * v(t) + 2 * u(t) * v(t) * calc.cos((omega_1 - omega_2) * t))
  )
  let para-x(t) = if r_1 - r_2 != 0 {
    factor(t) * (u(t) * calc.cos(omega_2 * t) + v(t) * calc.cos(omega_1 * t))
  } else {
    // r_1 == r_2
    let r = r_1
    (
      (r * (omega_1 + omega_2))
        / (omega_1 * omega_1 + omega_2 * omega_2 + 2 * omega_1 * omega_2 * calc.cos((omega_1 - omega_2) * t))
        * (omega_1 * calc.cos(omega_2 * t) + omega_2 * calc.cos(omega_1 * t))
    )
  }
  let para-y(t) = if r_1 != r_2 {
    factor(t) * (u(t) * calc.sin(omega_2 * t) + v(t) * calc.sin(omega_1 * t))
  } else {
    // r_1 == r_2
    let r = r_1
    (
      (r * (omega_1 + omega_2))
        / (omega_1 * omega_1 + omega_2 * omega_2 + 2 * omega_1 * omega_2 * calc.cos((omega_1 - omega_2) * t))
        * (omega_1 * calc.sin(omega_2 * t) + omega_2 * calc.sin(omega_1 * t))
    )
  }
  parametric-curve-2d(
    x: para-x,
    y: para-y,
    t-range: (-10, 10),
    ..args.named(),
  )
}

#set page(paper: "a3", flipped: true)




#{
  let inf = 1.9
  let sup = 2.1
  let step = 0.01
  align(
    center,
    table(
      columns: (8em,) * 8,
      stroke: 0.02em,
      gutter: 0.5em,
      ..for n in range(calc.ceil((sup - inf) / step)) {
        let i = n * step
        let r_1 = calc.round(inf + i, digits: 4)
        let r_2 = calc.round(sup - i, digits: 4)
        let omega_1 = 3
        let omega_2 = 1
        let arr = ()
        arr.push(
          [
            $
              r_1 & colon #r_1 \
              r_2 & colon #r_2 \
              // omega_1 & colon #omega_1 & quad thick omega_2 & colon #omega_2
            $
          ]
            + envelope(r_1: r_1, r_2: r_2, omega_1: omega_1, omega_2: omega_2, length: 0.5em),
        )
        arr
      },
    ),
  )
}

