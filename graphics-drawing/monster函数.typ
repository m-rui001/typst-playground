// Colors used across the template.
#let stroke-color = luma(200)
#let fill-color = luma(25)
#let main-color = rgb("#EA6953")
#let sub-color = rgb("#EC9084")
#let contrast-color = aqua

#let monster_property(name:"",data) = {
  if data != none {box(stroke: 1pt+red)[*#name* #data]}
}

//怪物块
#let monster_ose(
    // monster_id:array(),
    monster,
  ) = {
  v(2em, weak: true)
  //block(breakable: false)
  [#{
  block(
    fill: luma(220),
    inset: 5pt,
    outset: 5pt,
    below: 1em,
  grid(
    rows:5,
    row-gutter:0.5em,
    stroke: 1pt,
//    fill: gray,
    grid(
      columns: (auto,0.5em,0.5em,1em,auto),
      text(
        weight: "bold",
        size:1.2em,
        //fill: main-color,
      )[#align(start+horizon,[#monster.name])],h(0.5em),

      align(start+horizon)[#rect(fill:sub-color, height: 1.2em, width: 0.5em)],h(1em),

      emph[#align(horizon,[#monster.disc])],
    ),
    line(length: 100%, stroke: 1pt+sub-color),
    [
      #set text(size:0.9em)
      #if "ac" in monster {monster_property(name:"AC",monster.ac)}
      #if "hd" in monster {monster_property(name:"HD",monster.hd)}
      #if "att" in monster {monster_property(name:"攻击",monster.att)}
      #if "thac0" in monster {monster_property(name:"THAC0",monster.thac0)}
      #if "mv" in monster {monster_property(name:"移动",monster.mv)}
      #if "na" in monster {monster_property(name:"NA",monster.na)}
      #if "sv" in monster {monster_property(name:"豁免",monster.sv)}
      #if "ml" in monster {monster_property(name:"士气",monster.ml)}
      #if "tt" in monster {monster_property(name:"奖励",monster.tt)}
      #if "al" in monster {monster_property(name:"阵营",monster.al)}
      #if "xp" in monster {monster_property(name:"XP",monster.xp)}
    ],
    line(length: 100%, stroke: 1pt+sub-color),
    {
      set text(size:0.9em)
      set list(marker: sym.arrow.r.curve)
      eval(monster.ability,mode: "markup")

    }
  ))
  v(1.8em,weak: true)
  }]
}


//下面是json格式的怪物数据

{
  "鼠地精嘎子": {
    "name": "鼠地精嘎子",
    "ac": "7 [12]",
    "hd": "1-1\\*（3hp）",
    "att": "1×匕首（1d4），1×噬咬（1d4 + 仅第一口带毒素）",
    "thac0": "19 [+0]",
    "mv": "90'（30'）",
    "sv-v": 14,
    "sv-w": 15,
    "sv-p": 16,
    "sv-b": 17,
    "sv-s": 18,
    "sv": "D14 W15 P16 B17 S18",
    "ml": 7,
    "al": "混乱",
    "xp": 8,
    "ability": "- *毒素：*须通过*毒素豁免*，否则会变成鼠脸混种，持续 1d6 天。\n- *战利品！*7cp，被嚼过的半死不活的癞蛤蟆。",
    "disc": ""
  },
  "蜘蛛鼠": {
    "name": "蜘蛛鼠",
    "ac": "7 [12]",
    "hd": "1-1\\*（3hp）",
    "att": "1×噬咬（1d4）",
    "thac0": "19 [+0]",
    "mv": "90'（30'）",
    "sv-v": 14,
    "sv-w": 15,
    "sv-p": 16,
    "sv-b": 17,
    "sv-s": 18,
    "sv": "D14 W15 P16 B17 S18",
    "ml": 7,
    "al": "中立",
    "xp": 8,
    "ability": "- *蜘蛛攀爬：*可以爬墙和天花板作为正常移动",
    "disc": ""
  }
}