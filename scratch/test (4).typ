#set page(
  header: context {
      let numbering = if page.numbering != none { page.numbering } else { "1" }
      let page = counter(page).display(numbering)
      set text(size: 7pt, weight: "bold")

      stack(
        // 这里负责页码
        dir: if calc.odd(here().page()) { rtl } else { ltr }, 
        // 填充你的内容
        [#page], 1fr, [#lorem(5)], 1fr
      )
    },
    
  )

