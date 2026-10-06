#set text(lang: "zh", region: "cn")
#show outline: ol => {
  show heading: it => {
    align(center, it)
  }
  ol
}
#show outline.entry: set text(size: 10pt)


#set page(
  numbering: (..nums) => {
    "第" + str(nums.pos().at(0)) + "页，共" + str(nums.pos().at(-1)) + "页"
  },
  number-align: center, 
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 1.5cm),
)

#outline()

= test

#pagebreak()

= test2