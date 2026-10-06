#let conf(
  title:[],
  authors:[],
  id:[],
  email:none,
  doc
) = {
  set page(
    paper: "a4",
    numbering: "1 of 1",
    margin: (left: 2cm,right: 2cm,top: 2cm,bottom: 2cm)
  )
  
  set text(
    font: ("TeX Gyre Termes","Noto Sans CJK SC"),
    size: 12pt,
  )

  set heading(
    numbering: "1.a.",
  )

  set align(center)
  text(title,17pt)

  grid(
    columns: 3*(1fr,),
    [#authors],[#id],[#link("mailto:"+email)]
  )

  set align(left)

  doc
}