#import "@preview/cetz:0.2.0"


#let fill(lineplace,f,lower_limit,upper_limit,ystep) = {
  cetz.canvas(
    {
    let line_place=lineplace
    import cetz.plot
    cetz.plot.plot(
      size: (2,3),
      x-tick-step: 1,
      y-tick-step: ystep,
      axis-style: "school-book",
      {
        cetz.plot.add-fill-between(domain:(0,calc.floor(line_place)),f,((line_place,0),(line_place,f(line_place))))
        plot.add(domain:(lower_limit,upper_limit),f,style: (mark: (stroke: blue)))
      }
    )
  }
)
}
#let f(x)=calc.pow(x,1)
#fill(1.5,f,-1,3,0.5)