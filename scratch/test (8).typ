
#import "@preview/numbly:0.1.0": numbly
#set heading(numbering: numbly("第{1:一}章", "{2:(1)}", "{3:①}"))
#import "@preview/cuti:0.3.0": show-cn-fakebold
#show: show-cn-fakebold //伪粗体，部分字体无粗体
#let fakepar=context{let b=par(box());b;v(-measure(b+b).height)}
#show math.equation.where(block: true): it=>it+fakepar // 公式后缩进
#show heading: it=>it+fakepar // 标题后缩进
#show figure: it=>it+fakepar // 图表后缩进
#show enum.item: it=>it+fakepar
#show list.item: it=>it+fakepar // 列表后缩进
// #show xxx: it=>it+fakepar // 其他需要修复缩进的元素
#let noem = h(-2em)
#let em = h(2em) //手动段落缩进
#set par(first-line-indent: 2em,) //段落缩进2em
#set par(justify: false) //段落等宽
#set text(lang:"zh",region: "cn",cjk-latin-spacing: none)
//#set text(font: ("KaiTi",)) //字体设置
#set block(breakable: false) //段落分页设置
/*#set page(margin: (
x: 1cm,
y: 1cm,
))*/

#set page(
  width: 720pt,
  height: 1280pt,
  margin: (
  x:10pt,
  y:20pt,
)
)
//#set rect(inset:pt)
#set par(leading: 0.65em,spacing:0.65em)
#let 字体大小= 30pt
#set text(字体大小)
#let (线粗,长,宽)=(1pt,字体大小+(0.65em/2),700pt)
#set page(background:rotate(0deg,[
  #move(dy:0.35em)[
  #rect(stroke:red+2pt, )[
  #stack(
  //spacing: 0.65em-5pt,
  dir: ttb,
  let k={rect(stroke:red+线粗,width: 宽,height:长,)},
  k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k
)]
  ]
]))
夫伤寒论，盖祖述大圣人之意，诸家莫其伦拟，故晋·皇甫谧序《甲乙针经》云：伊尹以元圣之才，撰用神农本草，以为汤液；汉·张仲景论广汤液，为十数卷，用之多验；近世太医令王叔和，撰次仲景遗论甚精，皆可施用。是仲景本伊尹之法，伊尹本神农之经，得不谓祖述大圣人之意乎？张仲景，《汉书》无传，见《名医录》云：南阳人，名机，仲景乃其字也。举孝廉，官至长沙太守，始受术于同郡张伯祖，时人言，识用精微过其师，所著论，其言精而奥，其法简而详，非浅闻寡见者所能及。自仲景于今八百余年，惟王叔和能学之，其间如葛洪、陶景、胡洽、徐之才、孙思邈辈，非不才也，但各自名家，而不能修明之。开宝中，节度使高继冲，曾编录进上，其文理舛错，未尝考正；历代虽藏之书府，亦缺于仇校。是使治病之流，举天下无或知者。国家诏濡臣校正医书，臣奇续被其选。以为百病之急，无急于伤寒，今先校定张仲景《伤寒论》十卷，总二十二篇，证外合三百九十七法，除复重，定有一百一十二方，今请颁行。

#set rect(inset:0pt,outset:0pt)
#rect(fill:red)[是]
#rect(fill:red)[是]

