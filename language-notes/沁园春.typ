#set text(font: "Noto Serif CJK SC")
#set page(width: auto, height: auto, margin: 2em)
#show heading: it => {
  set align(center)
  set text(fill: rgb("#2c3e50"))
  it
}

#columns(2)[
  // #heading(level: 2)[沁园春·长沙]
  // #align(center, text(size: 9pt, fill: rgb("555"))[毛泽东 · 1925])
  #par[
    独立寒秋，湘江北去，橘子洲头。\
    看万山红遍，层林尽染；\
    漫江碧透，百舸争流。\
    鹰击长空，鱼翔浅底，万类霜天竞自由。\
    怅寥廓，问苍茫大地，谁主沉浮？
  ]
  #par[携来百侣曾游，忆往昔峥嵘岁月稠。\
    恰同学少年，风华正茂；\
    书生意气，挥斥方遒。\
    指点江山，激扬文字，粪土当年万户侯。\
    曾记否，到中流击水，浪遏飞舟？
  ]
  #colbreak()
  // #heading(level: 2)[沁园春 · 雪]
  // #align(center, text(size: 9pt, fill: rgb("555"))[毛泽东 · 1936])
  #par[
    北国风光，千里冰封，万里雪飘。\
    望长城内外，惟余莽莽；\
    大河上下，顿失滔滔。\
    山舞银蛇，原驰蜡象，欲与天公试比高。\
    须晴日，看红装素裹，分外妖娆。
  ]
  #par[江山如此多娇，引无数英雄竞折腰。\
    惜秦皇汉武，略输文采；\
    唐宗宋祖，稍逊风骚。\
    一代天骄，成吉思汗，只识弯弓射大雕。\
    俱往矣，数风流人物，还看今朝。
  ]
]

/* #place(
  bottom + center,
  float: true,
  scope: "parent",
  align(center, text(size: 8pt, fill: gray, style: "italic")[------ 毛泽东 ------]),
) */
