#import "@preview/numbly:0.1.0": numbly

#let RP(
  English: false,
  doc,
) = {
  // Heading style
  if English {
    set heading(
      numbering: numbly(
        "{1:I}.",
        "{1}.{2}",
        "{1}.{2}.{3}",
        "{1}.{2}.{3}.{4}",
        "{1}.{2}.{3}.{4}.{5}",
        "{1}.{2}.{3}.{4}.{5}.{6}",
      ),
    )
  } else {
    show heading: it => {
      show h.where(amount: 0.3em): none
      it
    }
    show heading.where(level: 1): set text(font: hei)
    set heading(
      numbering: numbly(
        "{1:一}、",
        "{1}.{2} ",
        "{1}.{2}.{3} ",
        "{1}.{2}.{3}.{4} ",
        "{1}.{2}.{3}.{4}.{5} ",
        "{1}.{2}.{3}.{4}.{5}.{6} ",
      ),
    )
  }

  doc
}

#show: RP.with(English: true)


= 实验目的与要求


= 实验代码


= 代码解析


= 测试用例与结果


= 讨论与心得
