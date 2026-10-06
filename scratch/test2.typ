#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#set page(
  width: 535pt, height: 737pt, 
  margin: (top: 85pt, bottom: 62pt, left: 25pt, right: 25pt),
)

#set text(size: 10pt)

// 读取 JSON 文件
#let json-data = json("test.json")
#let target-summary = json-data.TargetSummary

// 准备绘图数据
#let plot-entries = ()

#for target in target-summary {
  // 转换 DVH 数据：将字符串转换为数字
  let dvh-points = target.DVH
  let converted-points = ()
  for point in dvh-points {
    // 将每个点的字符串值转换为数字
    let x-value = float(point.at(0))
    let y-value = float(point.at(1))
    converted-points.push((x-value, y-value))
  }
  
  // 添加到绘图条目
  plot-entries.push((
    name: target.TargetName,
    data: converted-points,
    color: rgb(target.Color),
    style: (stroke: (paint: rgb(target.Color), thickness: 1pt))
  ))
}

#canvas({
  import draw: *
  
  set-style(
    axes: (stroke: 0.5pt, tick: (stroke: 0.5pt)),
    legend: (
      stroke: none,
      item: (spacing: 3pt)
    ),
    rect: (stroke: none)
  )
  
  plot.plot(
    size: (14,8),
    x-tick-step: 1000,
    x-min: 0,
    x-max: auto,
    y-tick-step: 10,
    y-min: 0,
    y-max: 100,
    x-label: "Dose (cGy)",
    y-label: "Volume (%)",
    legend: "inner-north-east", 
    {
      for entry in plot-entries {
        // 绘制折线图
        plot.add(
          entry.data,
          style: entry.style
        )

        // 绘制自定义图例
        plot.add-legend([#entry.name], preview: () => {
          import draw: *
          rect((0, 0), (1, 1), fill: entry.color)
        })
      }
      
      // 添加5000cGy的标记线
      plot.add(
        ((5000, 0), (5000, 100)),
        style: (stroke: (paint: rgb("#5f8488"), thickness: 1pt))
      )
    }
  )
})