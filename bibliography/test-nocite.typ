#set text(lang: "zh", font: "Noto Serif CJK SC")
#set par(justify: true)
#import "gb7714.typ": gb7714
#let (init-gb7714, bibliography, print-bib) = gb7714(read("test-nocite.bib"))
#show: init-gb7714

= 正文
正文里完全不引用任何成果，下面三个清单依然能输出@andrew2026。

= 攻读学位期间发表论文（场景 A：默认按年份/姓名/标题排序）
#print-bib(
  keys: [@p1@p2@p3@p4@p5],
  sorting: "nyt",
  title: none,
)

= 场景 B：把 p3（顶刊一作）置顶，其余按 ynt 排
#print-bib(
  keys: [@p1@p2@p3@p4@p5],
  sort-keys: [@p3],
  sorting: "ynt",
  title: none,
)

= 场景 C：完全按用户写入顺序（sorting: "none"）
#print-bib(
  keys: [@p3@p1@p5@p2@p4],
  sorting: "none",
  title: none,
)

#bibliography
