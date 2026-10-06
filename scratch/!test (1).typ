#import "@preview/pinit:0.2.1": *
#import "@preview/fletcher:0.5.1"
#import "@preview/touying:0.5.3": *
#import themes.metropolis: *

// 修改幻灯片模板参数
#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [算法及其实现],
    subtitle: [信息的处理],
    author: [吴启新],
    date: datetime.today(),
    institution: [贵阳市第十八中学],
    logo: emoji.computer,
  ),
)


#title-slide()
#set text(lang: "zh")
#components.adaptive-columns(outline(title: text(size: 28pt)[目录], indent: 1em, depth: 1))

= 内存数据的访问与修改

#pagebreak()

// 凡是程序能够直接进行运算的各种类型数据,均存放在计算机的内存中
#align(center)[
凡是程序能够直接进行#underline[运#pin(1)算]的各种类型数据,均存放在计算机的#underline[内#pin(2)存]中
]

#pinit-fletcher-edge(fletcher, 1, end: 2,start-dx: 0pt, start-dy: 8pt, end-dx: 0pt, end-dy: 8pt, [?], bend: -40deg, "<->")


