#import "@preview/cetz:0.4.2": canvas, draw
#import "@preview/cetz-plot:0.1.3": plot

#set page(width: auto, height: auto, margin: .5cm)
#set text(size: 10pt)

// 更详细的DVH测试数据（50个点每条曲线）
#let dvh-data = (
  "External": (
    (0, 100), (200, 99), (400, 98), (600, 96), (800, 94),
    (1000, 92), (1200, 90), (1400, 87), (1600, 84), (1800, 80),
    (2000, 75), (2200, 70), (2400, 65), (2600, 60), (2800, 55),
    (3000, 50), (3200, 45), (3400, 40), (3600, 35), (3800, 30),
    (4000, 25), (4200, 20), (4400, 15), (4600, 10), (4800, 7),
    (5000, 5), (5200, 3), (5400, 2), (5600, 1), (5800, 0.5), (6000, 0)
  ),
  "Left Femur": (
    (0, 100), (500, 100), (1000, 100), (1500, 99), (2000, 97),
    (2500, 94), (3000, 90), (3500, 85), (4000, 78), (4500, 70),
    (5000, 60), (5500, 48), (6000, 35), (6500, 22), (7000, 10)
  ),
  "Right Femur": (
    (0, 100), (600, 100), (1200, 100), (1800, 99), (2400, 97),
    (3000, 94), (3600, 90), (4200, 85), (4800, 78), (5400, 70),
    (6000, 60), (6600, 48), (7200, 35), (7800, 22), (8400, 10)
  ),
  "PTV1": (
    (0, 100), (1000, 100), (2000, 100), (3000, 100), (3500, 99),
    (4000, 98), (4500, 96), (5000, 94), (5500, 90), (6000, 85),
    (6500, 78), (7000, 68), (7500, 55), (8000, 40), (8500, 25),
    (9000, 12), (9500, 5), (10000, 0)
  ),
  "PTV1 Margin": (
    (0, 100), (1500, 100), (3000, 100), (4000, 99), (5000, 97),
    (6000, 94), (7000, 90), (8000, 84), (9000, 75), (10000, 65),
    (11000, 52), (12000, 38), (13000, 25), (14000, 12), (15000, 0)
  )
)

// 1. 单独定义每个结构的「颜色」（供折线和图例共用）
#let structure-colors = (
  "External": rgb("#da1b7d"),
  "Left Femur": rgb("#2acc75"),
  "Right Femur": rgb("#af691e"),
  "PTV1": rgb("#cd0606"),
  "PTV1 Margin": rgb("#2b4143"),
  "Marked Value": rgb("#5f8488")
)

// 2. 结构样式
#let structure-styles = (
  "External": (stroke: (paint: structure-colors.at("External"), thickness: 1pt)),
  "Left Femur": (stroke: (paint: structure-colors.at("Left Femur"), thickness: 1pt)),
  "Right Femur": (stroke: (paint: structure-colors.at("Right Femur"), thickness: 1pt)),
  "PTV1": (stroke: (paint: structure-colors.at("PTV1"), thickness: 1pt)), 
  "PTV1 Margin": (stroke: (paint: structure-colors.at("PTV1 Margin"), thickness: 1pt))
)

// 3. 定义图例圆形标记
#let legend-markers = (
  "External": circle(radius: 5pt, fill: structure-colors.at("External"), stroke: none),
  "Left Femur": circle(radius: 5pt, fill: structure-colors.at("Left Femur"), stroke: none),
  "Right Femur": circle(radius: 5pt, fill: structure-colors.at("Right Femur"), stroke: none),
  "PTV1": circle(radius: 5pt, fill: structure-colors.at("PTV1"), stroke: none),
  "PTV1 Margin": circle(radius: 5pt, fill: structure-colors.at("PTV1 Margin"), stroke: none)
)

#canvas({
  import draw: *
  
  set-style(
    axes: (stroke: 0.5pt, tick: (stroke: 0.5pt)),
    legend: (
      stroke: none,
      item: (spacing: 2pt),
      scale: 80%
    )
  )
  
  plot.plot(
    size: (16, 10),
    x-tick-step: 1000,
    x-min: 0,
    x-max: 10000,
    y-tick-step: 10,
    y-min: 0,
    y-max: 100,
    x-label: "Dose (cGy)",
    y-label: "Volume (%)",
    legend: "north-east", 
    {
      for (structure, t_data) in dvh-data {
        plot.add(
          t_data,
          style: structure-styles.at(structure),  
          label: [
            //#legend-markers.at(structure)  
            #structure 
          ]
        )
      }
      
      // 添加5000cGy的标记线
      plot.add(
        ((5000, 0), (5000, 100)),
        style: (stroke: (paint: structure-colors.at("Marked Value"), thickness: 1pt))
      )
    }
  )
})