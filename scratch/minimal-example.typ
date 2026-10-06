#let text-font = (
  "Libertinus Serif",
  "Noto Serif CJK SC",
)

#set text(font: text-font)

#show selector(list.item).and(<mind>): it => {
  let text-cfg = (font: text-font)
  let aux(it) = if it.has("body") {
    if it.body.has("children") {
      let (hd, ..tl) = it.body.children.filter(x => x != [ ]).map(aux)
      math.display(
        text(..text-cfg, hd)
          + // if tl.len() > 1 {
          math.cases(delim: "{", gap: 1em, ..tl),
        // } else { " " + tl.at(0) },
      )
    } else { math.display(text(..text-cfg, it.body)) }
  } else { math.display(text(..text-cfg, it)) }
  aux(it)
}

#figure[
  - 逻辑结构
    - 线性结构
      - 一般线性表
      - 受限线性表
        - 栈
        - 队列
        - 串
      - 广义线性表
        - 数组
    - 非线性结构
      - 集合
      - 树
      - 图
        - 有向图
        - 无向图
  <mind>
]
