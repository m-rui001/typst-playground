#import "@preview/cetz:0.3.4": canvas, draw

#set page(
  width: 14cm,
  height: 10cm,
  margin: 0.4cm,
  fill: rgb("#f5f0e8"),
)

#align(center)[
#canvas(length: 1cm, {
  import draw: *

  // ── constants ──────────────────────────────────────────────────
  let cx = 0
  let cy = 0
  // Arc spans from 200° (left) to -20° (right), total 220°
  let a-left  = 200deg
  let a-right = -20deg

  // Map t ∈ [0,1] → angle on arc (0 = left end, 1 = right end)
  let arc-angle(t) = a-left + t * (a-right - a-left)

  // Point on circle of radius r at angle a
  let pt(r, a) = (cx + r * calc.cos(a), cy + r * calc.sin(a))

  // ── panel border ───────────────────────────────────────────────
  rect((-6.5, -4.0), (6.5, 3.5),
       fill: rgb("#f5f0e8"),
       stroke: (thickness: 1.5pt, paint: black))

  // ── red accent arcs ────────────────────────────────────────────
  for r in (5.02, 5.18) {
    arc((cx, cy), radius: r,
        start: a-right, stop: a-left,
        stroke: (thickness: 1.2pt, paint: red))
  }

  // ── scale arc borders ──────────────────────────────────────────
  for r in (5.35, 4.70, 4.30, 3.90) {
    arc((cx, cy), radius: r,
        start: a-right, stop: a-left,
        stroke: (thickness: 0.7pt, paint: black))
  }

  // ══════════════════════════════════════════════════════════════
  // HELPER: draw a tick at fractional position t along the arc
  //   r0 = inner radius, len = outward length
  // ══════════════════════════════════════════════════════════════
  let tick(t, r0, len, w: 0.5pt) = {
    let a  = arc-angle(t)
    line(pt(r0, a), pt(r0 + len, a),
         stroke: (thickness: w, paint: black))
  }

  // ══════════════════════════════════════════════════════════════
  // HELPER: place a text label at position t, radius r
  // ══════════════════════════════════════════════════════════════
  let lbl(t, r, txt, sz: 0.17) = {
    content(pt(r, arc-angle(t)),
            text(size: sz * 1cm, fill: black, txt))
  }

  // ══════════════════════════════════════════════════════════════
  // ROW 1 — OHM scale (outermost, right=0 Ω, left=∞)
  //   Logarithmic mapping: t = 1 - log(val+1)/log(max+1)
  // ══════════════════════════════════════════════════════════════
  let ohm-max = 10000
  let op(val) = {
    if val <= 0 { 1.0 }
    else { 1.0 - calc.log(val + 1) / calc.log(ohm-max + 1) }
  }

  // Major labelled ticks
  let ohm-major = (
    (0,    "0"),
    (1,    "1"),
    (2,    "2"),
    (3,    "3"),
    (5,    "5"),
    (10,   "10"),
    (20,   "20"),
    (30,   "30"),
    (50,   "50"),
    (100,  "100"),
    (200,  "200"),
    (500,  "500"),
    (1000, "1k"),
    (4000, "4k"),
  )
  for (v, s) in ohm-major {
    tick(op(v), 5.35, 0.32, w: 0.9pt)
    lbl(op(v), 5.78, s, sz: 0.155)
  }

  // Minor ticks 0-10
  for v in range(0, 11) {
    tick(op(v), 5.35, 0.20)
  }
  // Medium ticks 10-100 by 5
  for v in range(10, 100, step: 5) {
    tick(op(v), 5.35, 0.24)
  }
  // Minor ticks 10-100 by 1
  for v in range(10, 100) {
    if calc.rem(v, 5) != 0 { tick(op(v), 5.35, 0.14) }
  }
  // Sparse ticks 100-1000
  for v in (150, 250, 300, 400, 600, 700, 800) {
    tick(op(v), 5.35, 0.14)
  }

  // Ω symbols at each end
  content(pt(5.90, arc-angle(0.02)), text(size: 0.22cm)[Ω])
  content(pt(5.90, arc-angle(0.97)), text(size: 0.22cm)[Ω])

  // ∞ symbol at far left
  content(pt(5.90, arc-angle(0.04)), text(size: 0.20cm)[∞])

  // ══════════════════════════════════════════════════════════════
  // ROW 2 — DC/AC Voltage & Current  (linear, 0-250 upper)
  // ══════════════════════════════════════════════════════════════
  let lp(v, vmax) = v / vmax   // linear position 0..1

  // Major ticks & labels: 250-scale
  let v250 = (
    (0,   "0"),
    (50,  "50"),
    (100, "100"),
    (150, "150"),
    (200, "200"),
    (250, "250"),
  )
  for (v, s) in v250 {
    tick(lp(v, 250), 4.70, 0.30, w: 0.9pt)
    lbl(lp(v, 250), 5.10, s, sz: 0.155)
  }

  // Sub-labels: 50-scale (10,20,30,40)
  for (v, s) in ((10,"10"),(20,"20"),(30,"30"),(40,"40")) {
    tick(lp(v, 250), 4.70, 0.22)
    lbl(lp(v, 250), 5.10, s, sz: 0.125)
  }

  // Sub-labels: 10-scale inside 0-250 span
  for (v, s) in ((2,"2"),(4,"4"),(6,"6"),(8,"8")) {
    // map 0-10 into the 0-250 arc
    lbl(lp(v, 10) * lp(10, 250), 4.58, s, sz: 0.130)
  }

  // Fine ticks: every 5 and every 1 on the 250 scale
  for i in range(0, 251) {
    let t = lp(i, 250)
    if calc.rem(i, 50) == 0      { }  // already drawn
    else if calc.rem(i, 10) == 0 { tick(t, 4.70, 0.22) }
    else if calc.rem(i, 5)  == 0 { tick(t, 4.70, 0.16) }
    else                          { tick(t, 4.70, 0.09) }
  }

  // ══════════════════════════════════════════════════════════════
  // ROW 3 — Lower linear scale  0-2.5 / 0-10
  // ══════════════════════════════════════════════════════════════
  let lo-major = (
    (0,   "0"),
    (0.5, "0.5"),
    (1,   "1"),
    (1.5, "1.5"),
    (2,   "2.0"),
    (2.5, "2.5"),
  )
  for (v, s) in lo-major {
    tick(lp(v, 2.5), 4.30, 0.26, w: 0.9pt)
    lbl(lp(v, 2.5), 3.96, s, sz: 0.148)
  }

  // Fine ticks on lower scale
  for i in range(0, 26) {
    let t = i / 25.0
    if calc.rem(i, 5) == 0      { }  // major
    else if calc.rem(i, 1) == 0 { tick(t, 4.30, 0.16) }
  }
  for i in range(0, 250) {
    let t = i / 250.0
    if calc.rem(i, 10) != 0 and calc.rem(i, 5) != 0 {
      tick(t, 4.30, 0.09)
    }
  }

  // ── needle ─────────────────────────────────────────────────────
  // Pivot
  circle((cx, cy), radius: 0.12, fill: black, stroke: none)
  circle((cx, cy), radius: 0.06, fill: white, stroke: none)

  // Needle tip at ~38% from left
  let needle-a = arc-angle(0.38)
  line(pt(-0.45, needle-a), pt(5.05, needle-a),
       stroke: (thickness: 1.1pt, paint: red))

  // ══════════════════════════════════════════════════════════════
  // LEFT PANEL MARKINGS
  // ══════════════════════════════════════════════════════════════
  // Polarity / function symbols
  content((-5.8, 2.8), text(size: 0.21cm)[∞])
  content((-5.8, 2.3), text(size: 0.19cm)[Ω])
  content((-5.8, 1.7), text(size: 0.22cm)[~])   // AC
  content((-5.8, 1.1), text(size: 0.22cm)[=])   // DC

  // Three terminal circles
  for x in (-5.7, -5.2, -4.7) {
    circle((x, 0.3), radius: 0.14, stroke: (thickness: 0.6pt, paint: black), fill: white)
  }

  // V~ box (bottom-left)
  rect((-6.3, -1.7), (-4.6, -1.0),
       stroke: (thickness: 0.7pt, paint: black), fill: none)
  content((-5.45, -1.35), text(size: 0.26cm, weight: "bold")[V])
  content((-5.45, -1.60), text(size: 0.17cm)[~])

  // Range labels top-left
  for (x, s) in ((-4.1, "500"), (-4.65, "1k"), (-5.15, "4k")) {
    content((x, 3.05), text(size: 0.15cm)[#s])
  }

  // ══════════════════════════════════════════════════════════════
  // RIGHT PANEL MARKINGS
  // ══════════════════════════════════════════════════════════════
  for (y, s) in ((-1.1, "250"), (-1.5, "50"), (-1.9, "10")) {
    content((5.55, y), text(size: 0.17cm)[#s])
  }

  // ══════════════════════════════════════════════════════════════
  // CENTRE LABEL
  // ══════════════════════════════════════════════════════════════
  content((0, -2.65),
    text(size: 0.78cm, weight: "bold",
         font: "New Computer Modern")[A-V-Ω])

  // ══════════════════════════════════════════════════════════════
  // BINDING POSTS (bottom corners)
  // ══════════════════════════════════════════════════════════════
  rect((-6.5, -3.95), (-5.4, -3.25),
       fill: rgb("#c8bfa0"), stroke: (thickness: 0.8pt, paint: black))
  rect((5.4,  -3.95), (6.5,  -3.25),
       fill: rgb("#c8bfa0"), stroke: (thickness: 0.8pt, paint: black))

  // Bottom terminal circles
  for x in (-2.6, 0.0, 2.6) {
    circle((x, -3.60), radius: 0.24,
           stroke: (thickness: 0.8pt, paint: black), fill: white)
  }
})
]
