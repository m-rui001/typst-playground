#import "@preview/cetz:0.3.4"

#let plot(unit-length: 3em, x-range: (0, 1), y-range: (0, 1), padding: .5, x-label: $x$, y-label: $y$, x-ticks: none, y-ticks: none, tick-size: .2, tick-padding: .1, body) = align(
    center,
    cetz.canvas(
        length: unit-length,
        {
            import cetz.draw: line, content

            let (x-min, x-max) = x-range
            let (y-min, y-max) = y-range

            tick-padding += tick-size / 2

            line((x-min - padding, 0), (x-max + padding, 0), mark: (end: "stealth", fill: black))
            line((0, y-min - padding), (0, y-max + padding), mark: (end: "stealth", fill: black))
            content((x-max + padding, 0), x-label, anchor: "north-east", padding: (tick-padding, 0))
            content((0, y-max + padding), y-label, anchor: "north-west", padding: (0, tick-padding))

            if x-ticks != none {
                for x in x-ticks {
                    let body = if type(x) != array {
                        $#x$
                    } else {
                        x.at(1)
                        x = x.at(0)
                    }

                    line((x, -tick-size / 2), (x, tick-size / 2))
                    content((x, 0), body, anchor: "north", padding: tick-padding)
                }
            }

            if y-ticks != none {
                for y in y-ticks {
                    let body = if type(y) != array {
                        $#y$
                    } else {
                        y.at(1)
                        y = y.at(0)
                    }

                    line((-tick-size / 2, y), (tick-size / 2, y))
                    content((0, y), body, anchor: "east", padding: tick-padding)
                }
            }

            body
        },
    ),
)

#let absolute(pos) = {
    if type(pos.at(0)) != array {
        if type(pos.at(0)) != angle {
            pos
        } else {
            let (θ, r) = pos
            (r * calc.cos(θ), r * calc.sin(θ))
        }
    } else {
        let ((x, y), (θ, r)) = pos
        (x + r * calc.cos(θ), y + r * calc.sin(θ))
    }
}

#let relative(pos, rel) = {
    let dx = pos.at(0) - rel.at(0)
    let dy = pos.at(1) - rel.at(1)
    (calc.atan2(dx, dy), calc.norm(dx, dy))
}

#let contour(..path) = {
    import cetz.draw: line, arc

    let prev = absolute(path.at(0))
    for pos in path.pos().slice(1) {
        let style = (mark: (end: "stealth", fill: black, pos: -50%)) + path.named()
        if type(pos) == dictionary {
            let t = pos.remove("pos")
            style += pos
            pos = t
        }
        if type(pos) == angle or type(pos.at(1)) == angle {
            let (center, end) = if type(pos) == angle {
                ((0, 0), pos)
            } else {
                (absolute(pos.at(0)), pos.at(1))
            }
            let (begin, radius) = relative(prev, center)
            arc((to: center, rel: (begin, radius)), start: begin, stop: end, radius: radius, ..style)
            prev = absolute((center, (end, radius)))
        } else {
            pos = absolute(pos)
            line(prev, pos, ..style)
            prev = pos
        }
    }
}

#let point(pos, body, size: .08, anchor: "south", padding: .2) = {
    import cetz.draw: circle, content

    pos = absolute(pos)
    circle(pos, radius: size, stroke: none, fill: black)
    if body != none {
        content(pos, body, anchor: anchor, padding: padding)
    }
}
