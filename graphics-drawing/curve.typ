#import "@preview/lilaq:0.6.0" as lq

#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 1.1cm),
)
#set text(size: 10pt)

// The curve from the request, evaluated at a scalar parameter t.
#let curve(t) = {
  let c = calc.cos(2 * t)
  let a = 6.03 * c - 5.97
  let b = 1.99 * c - 2.01
  let denominator = a * a + b * b + 2 * a * b * c
  let factor = (15.9996 * c - 15.9204) / denominator
  (
    factor * (a * calc.cos(t) + b * calc.cos(3 * t)),
    factor * (a * calc.sin(t) + b * calc.sin(3 * t)),
  )
}


// Perpendicular distance from point p to the infinite line through a and b.
#let perpendicular-distance(p, a, b) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let length = calc.sqrt(dx * dx + dy * dy)
  if length == 0 {
    calc.sqrt((p.at(0) - a.at(0)) * (p.at(0) - a.at(0)) + (p.at(1) - a.at(1)) * (p.at(1) - a.at(1)))
  } else {
    calc.abs(dy * p.at(0) - dx * p.at(1) + b.at(0) * a.at(1) - b.at(1) * a.at(0)) / length
  }
}
// Recursive adaptive sampling for a parametric curve.
// Midpoint and quarter-point errors prevent symmetric turns from being missed.
#let adaptive-sample(start, stop, tolerance, max-segment, max-depth) = {
  let refine(t0, p0, t1, p1, depth) = {
    let tm = (t0 + t1) / 2
    let tl = (t0 + tm) / 2
    let tr = (tm + t1) / 2
    let pm = curve(tm)
    let pl = curve(tl)
    let pr = curve(tr)
    let error = perpendicular-distance(pl, p0, p1)
    let midpoint-error = perpendicular-distance(pm, p0, p1)
    let right-error = perpendicular-distance(pr, p0, p1)
    if midpoint-error > error {
      error = midpoint-error
    }
    if right-error > error {
      error = right-error
    }
    let span = calc.sqrt(
      (p1.at(0) - p0.at(0)) * (p1.at(0) - p0.at(0)) +
      (p1.at(1) - p0.at(1)) * (p1.at(1) - p0.at(1)),
    )

    if depth >= max-depth or (error <= tolerance and span <= max-segment) {
      (p0, p1)
    } else {
      let left = refine(t0, p0, tm, pm, depth + 1)
      let right = refine(tm, pm, t1, p1, depth + 1)
      left.slice(0, left.len() - 1) + right
    }
  }

  refine(start, curve(start), stop, curve(stop), 0)
}


#let t-start = -3.14
#let t-stop = 3.14
#let adaptive-tolerance = 0.001
#let max-segment = 0.2
#let max-depth = 16
#let sampled = adaptive-sample(t-start, t-stop, adaptive-tolerance, max-segment, max-depth)
#let xs = sampled.map(point => point.at(0))
#let ys = sampled.map(point => point.at(1))

#set align(center)
#text(size: 17pt, weight: "bold")[Adaptive Parametric Curve Sampling]

#v(0.35em)
#text(size: 9pt)[
  Adaptive points: #sampled.len(); Chord tolerance: #adaptive-tolerance; Max segment: #max-segment
]

#v(0.6em)
#lq.diagram(
  width: 17cm,
  height: 12.5cm,
  title: [病态参数曲线的自适应采样结果],
  xlabel: $x$,
  ylabel: $y$,
  lq.plot(
    xs,
    ys,
    color: rgb("#1769aa"),
    stroke: 1.05pt,
    mark: none,
  ),
)

#v(0.5em)
#align(left)[
  #text(size: 8.5pt, fill: gray)[
    Each parameter interval is recursively split when midpoint or
    quarter-point samples deviate from the endpoint chord, or when the
    chord is too long. This concentrates samples near the singular region.
  ]
]
