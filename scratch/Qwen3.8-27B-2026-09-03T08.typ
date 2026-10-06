// =====================================================================
// Source Han Sans Version 2.005 — ReadMe (reproduction of the Adobe PDF)
// Fonts: manual/fonts (SourceSans3VF, SourceCodeVF, SourceHanSans-VF.ttc)
// =====================================================================

// ----- palette (sampled from the original PDF) -----------------------
#let linkblue = rgb("#215e9e")
#let markred  = rgb("#d2232a")
#let sampblue = rgb("#00aeef")
#let hdrgray  = rgb("#bcbec0")
#let hlblue   = rgb("#abdffa")
#let ellblue  = rgb(0, 174, 239, 40%)
#let ellmag   = rgb(236, 0, 140, 40%)
#let ellgrn   = rgb(65, 173, 73, 40%)

// ----- font families (Typst names as reported by `typst fonts`) ------
#let sans  = "SourceSans3VF"
#let cjksc = "Source Han Sans SC"
#let cjkjp = "Source Han Sans"     // Japanese default instance
#let cjkkr = "Source Han Sans K"
#let cjkck = "Source Han Sans HC"
#let cjktc = "思源黑體"             // Traditional Chinese instance
#let mono  = "SourceCodeVF"

#set text(font: (sans, cjksc, "DejaVu Sans"), size: 12pt, lang: "en")
#set par(justify: true, leading: 8.1pt, spacing: 13.7pt, first-line-indent: 0pt)
#show link: it => text(fill: linkblue, it)

// ----- page geometry (measured from the original) ---------------------
#set page(
  paper: "a4",
  margin: (top: 22.5pt, left: 28.3pt, right: 25.9pt, bottom: 37.9pt),
  numbering: none,
  footer: context[
    #set align(center)
    #set text(size: 14pt)
    #counter(page).display()
  ],
  footer-descent: 0%,
)

#let content-w = 541.1pt

// ----- small helpers ---------------------------------------------------
#let lnk = (url, ..txt) => link(url, ..txt)

// section heading (18pt bold)
#let h1 = it => v(12pt) + text(size: 18pt, weight: "bold", it) + v(8pt)
// subsection heading (16pt semibold)
#let h2 = it => v(10pt) + text(size: 16pt, weight: 600, it) + v(8pt)
// sub-subsection heading (12pt semibold)
#let h3 = it => v(9pt) + text(size: 12pt, weight: 600, it) + v(6pt)

// red variation-sequence corner marks around inline content
#let marks = (size, inner) => text(font: "DejaVu Sans", size: size, fill: markred, "⌍⌏") + inner + text(font: "DejaVu Sans", size: size, fill: markred, "⌌⌎")

// 18pt marked glyph (used in most glyph tables)
#let gm = (..g) => marks(18pt, text(size: 18pt, ..g))
// 24pt marked glyph (SVS tables)
#let gm24 = (..g) => marks(24pt, text(size: 24pt, ..g))

// blue context glyph (SVS tables)
#let bg = (..g) => text(size: 24pt, fill: sampblue, ..g)

// rotated (bottom-to-top) table label
#let rot = (..txt) => rotate(-90deg, reflow: true, text(size: 10.5pt, ..txt))

// gray table header cell
#let hc = (..txt) => table.cell(fill: hdrgray, align(center + top, text(size: 11pt, weight: 600, ..txt)))
// gray table header cell, left aligned
#let hcl = (..txt) => table.cell(fill: hdrgray, align(left + top, text(size: 11pt, weight: 600, ..txt)))

// multi-line cell content helper (10pt)
#let m10 = (lines, style: "normal") => {
  let f = if style == "italic" { (font: sans, style: "italic") } else { (:) }
  text(size: 10pt, f, lines.map(l => l + linebreak()).filter(_ => true))
}

// indented italic remark paragraph
#let remark = (..txt) => box(width: content-w, pad(left: 11.4pt, block(text(size: 12pt, style: "italic", ..txt))))

// =====================================================================
// Pages 1–2 — absolute layout matching the original geometry
// =====================================================================
// 107pt sample glyph placed so the ink matches the original.
// `cx`: cell center x (page coords); `target`: ink top, content-relative;
// `sx`/`sy`: scale factors; `K`: measured ink-top offset from the box top.
#let bign = (ch, cx, target, sx, sy, K, f: cjksc) => place(top + left, dx: cx - 28.3pt - 53.5pt * sx, dy: target - K, scale(x: sx * 100%, y: sy * 100%, text(size: 107pt, weight: 250, font: f, ch)))

// 40%-opacity ellipse as rendered in the original (content-relative)
#let ell = (x, y, w, h, c) => place(top + left, dx: x, dy: y, ellipse(width: w, height: h, fill: c))

// Full-width content placed at content-relative `dy`
#let para = (dy, ..txt) => place(top + left, dy: dy, block(width: content-w, ..txt))

// ----- page 1 -----------------------------------------------------------
#let page1 = block(width: content-w, height: 780pt, (
  para(10.2pt, align(center, text(size: 30pt, weight: "black", [Source Han Sans Version 2.005])))
  + para(52.6pt, align(center, text(size: 14pt, [Released on June 18, 2025])))
  + para(101.7pt, text(size: 18pt, weight: "bold", [Overview]))
  + para(129.5pt, [
    #lnk("https://github.com/adobe-fonts/source-han-sans/")[Source Han Sans], designed by
    #lnk("http://www.adobe.com/products/type/font-designers/ryoko-nishizuka.html")[Ryoko Nishizuka]
    (西塚涼子), is the companion sans serif–style Pan-CJK typeface family to
    #lnk("https://github.com/adobe-fonts/source-han-serif/")[Source Han Serif], and is offered in seven
    weights—ExtraLight, Light, Normal, Regular, Medium, Bold, and Heavy—and in several
    OpenType/CFF-based deployment configurations to accommodate various system requirements or, in
    some cases, limitations. Pan-CJK fonts, such as those provided by the _Source Han_ typeface
    families, are intended to support and render the most important characters for Simplified
    Chinese, Traditional Chinese, Japanese, and Korean.
  ])
  + para(232.0pt, [
    The samples on this page demonstrate that the differences for each language can be subtle or
    striking, depending on the ideograph, yet they all clearly share the same typeface style, design,
    weight, and other characteristics that are not necessarily tied to a particular language.

    The first sample shows the completely shared form of U+4E00, along with the shared
    Simplified/Traditional Chinese and shared Japanese/Korean forms of U+5B57:
  ])
  + bign("一", 163.8pt, 375.6pt, 1.0, 1.0, 34.4pt)
  + bign("字", 323.0pt, 343.0pt, 1.0, 1.0, 1.8pt)
  + bign("字", 431.4pt, 343.0pt, 1.0, 1.0, 1.8pt, f: cjkjp)
  + ell(277.9pt, 319.7pt, 35.1pt, 35.2pt, ellblue)
  + ell(385.6pt, 319.7pt, 35.1pt, 35.2pt, ellblue)
  + para(447.4pt, [
    The second sample below shows, from left to right, the Simplified Chinese form of U+9AA8, its
    Traditional Chinese (Taiwan) form, and the form shared by Traditional Chinese (Hong Kong),
    Japanese, and Korean:
  ])
  + bign("骨", 190.6pt, 497.0pt, 1.0, 0.995, -6.0pt)
  + bign("骨", 297.6pt, 497.0pt, 1.0, 0.995, -6.0pt, f: cjktc)
  + bign("骨", 404.6pt, 497.0pt, 1.0, 0.995, -6.0pt, f: cjkjp)
  + ell(123.4pt, 499.0pt, 54.9pt, 35.2pt, ellmag)
  + ell(253.1pt, 499.0pt, 54.9pt, 35.1pt, ellmag)
  + ell(122.0pt, 525.7pt, 80pt, 80.1pt, ellblue)
  + ell(229.2pt, 525.5pt, 80.1pt, 80pt, ellblue)
  + para(609.1pt, [
    The third sample shows, also from left to right, the almost completely unshared Simplified Chinese,
    Traditional Chinese (Taiwan and Hong Kong), Japanese, and Korean forms of U+66DC:
  ])
  + bign("曜", 137.1pt, 656.2pt, 1.005, 0.980, -8.7pt, f: cjktc)
  + bign("曜", 244.1pt, 656.2pt, 1.005, 1.013, -9.3pt, f: cjkck)
  + bign("曜", 351.1pt, 656.2pt, 1.005, 1.000, -8.1pt, f: cjkjp)
  + bign("曜", 458.1pt, 656.2pt, 1.005, 0.996, -7.8pt, f: cjkkr)
  + ell(88.0pt, 657.1pt, 39.4pt, 39.4pt, ellblue)
  + ell(195.0pt, 657.1pt, 39.4pt, 39.4pt, ellblue)
  + ell(303.4pt, 657.1pt, 39.4pt, 39.4pt, ellblue)
  + ell(410.4pt, 657.1pt, 39.4pt, 39.4pt, ellblue)
  + ell(117.7pt, 687.3pt, 23.4pt, 23.3pt, ellmag)
  + ell(332.7pt, 687.8pt, 23.3pt, 23.3pt, ellmag)
))
#page1
#pagebreak()

// ----- page 2 -----------------------------------------------------------
#let genlines = (
  [Now the whole world had one language and a common speech.],
  [那时，天下人的口音、言语都是一样。],
  [那時，天下人的口音、言語都是一樣。],
  [那時，天下人的口音、言語都是一樣。],
  [全地は同じ発音、同じ言葉であった。],
  [온 땅의 구음이 하나이요 언어가 하나이었더라.],
)

#let genblock = (w, label, dy) => {
  let c = para(dy, align(center, text(size: 14pt, weight: 600, label)))
  for (i, l) in genlines.enumerate() {
    c = c + para(dy + 8.1pt + i * 24pt,
      align(center, text(size: 16pt, weight: w, font: cjkjp, l)))
  }
  c
}

#let page2 = block(width: content-w, height: 780pt, (
  para(7.9pt, [
    The fourth and final example shows, again from left to right, the completely unshared Simplified
    Chinese, Traditional Chinese (Taiwan), Traditional Chinese (Hong Kong), Japanese, and Korean
    forms of U+8FD4:
  ])
  + bign("返", 83.6pt, 57.6pt, 1.004, 0.99, -5.1pt)
  + bign("返", 190.6pt, 57.6pt, 1.004, 0.99, -5.1pt, f: cjktc)
  + bign("返", 297.6pt, 57.6pt, 1.004, 0.99, -5.1pt, f: cjkck)
  + bign("返", 404.6pt, 57.6pt, 1.004, 0.99, -5.6pt, f: cjkjp)
  + bign("返", 511.6pt, 57.6pt, 1.004, 0.99, -5.6pt, f: cjkkr)
  + ell(39.1pt, 47.7pt, 64.4pt, 27.3pt, ellgrn)
  + ell(148.4pt, 48.0pt, 64.4pt, 27.3pt, ellgrn)
  + ell(35.0pt, 71.4pt, 72.1pt, 72.1pt, ellmag)
  + ell(356.5pt, 71.7pt, 72pt, 72pt, ellmag)
  + ell(0.8pt, 49.7pt, 34pt, 102.5pt, ellblue)
  + ell(109.1pt, 49.4pt, 34pt, 102.5pt, ellblue)
  + ell(321.6pt, 49.4pt, 34.1pt, 102.5pt, ellblue)
  + ell(430.8pt, 49.4pt, 34pt, 102.5pt, ellblue)
  + para(159.0pt, [
    The short passage shown below is Genesis 11:1 (创世记 11:1 in Simplified Chinese, 創世記 11:1 in
    Traditional Chinese, 創世記 11:1 in Japanese, and 창세기 11:1 in Korean) displayed in six
    languages and in three of the
  ])
  + para(201.6pt, [seven weights:])
  + genblock(250, [ExtraLight], 226.1pt)
  + genblock(400, [Regular], 394.5pt)
  + genblock(900, [Heavy], 562.8pt)
  + para(739.7pt, [
    The use of these open source Pan-CJK fonts and their sources is covered under the terms of the
    #lnk("http://scripts.sil.org/OFL")[SIL Open Font License, Version 1.1].
  ])
))
#page2
#pagebreak()

The pages that follow provide excruciating technical details about the font resources that are
included in this open source project, and the information corresponds to Version 2.005.

// =====================================================================
// Configurations
// =====================================================================
#h1[Configurations]

Source Han Sans is provided in a number of possible deployment configurations, each of which is
described below, along with typical usage scenarios:

#h2[Language-specific OpenType (OTF/TTF) variable fonts — 20 font resources]

This deployment configuration is available in five languages—Simplified Chinese, Traditional
Chinese (Taiwan), Traditional Chinese (Hong Kong), Japanese, and Korean—and sets one language as
the default (a default language is required due to the single ‘cmap’ table), and the ‘locl’
(Localized Forms) GSUB feature is expected to be used to access glyphs that are appropriate for
the other four supported languages. Five of the variable fonts differ only in that the default
glyphs for ASCII (U+0020 through U+007E), U+00A0 ( ), U+00A5 (¥), U+00AD (‑), U+2011 (‑), and
U+20A9 (₩) are half-width instead of proportional, and the default glyph for U+2423 (␣) is
half-width instead of full-width. These fonts include the additional “HW” identifier in their
names. The half-width variable fonts contain only the Regular and Bold weights. The other five
Pan-CJK variable fonts contains all seven of the original static weights.

#remark[
These fonts represent the most compact form that supports all languages and includes the complete
set of glyphs, but this comes at the expense of requiring an application to properly support the
‘locl’ GSUB feature in order to display glyphs for languages other than the default one. In
addition to using such an application, a good example of which is
#lnk("http://www.adobe.com/products/indesign.html")[Adobe InDesign], the text—at the character,
paragraph, or document level—must also be properly language-tagged. This configuration also
requires a system that supports OTF or TTF variable fonts.
]

#h2[Language-specific OpenType/CFF (OTF)—45 font resources]

This deployment configuration contains the same set of fonts as the OpenType/CFF2 variable font
configuration as 45 separate static fonts.

#h2[Region-specific Subset OpenType (Subset OTF/TTF) variable fonts — 10 font resources]

This deployment configuration includes five different subsets, and each subset includes only the
glyphs that are necessary for Simplified Chinese, Traditional Chinese (Taiwan), Traditional
Chinese (Hong Kong), Japanese, or Korean.

#remark[
These fonts are considered the most broadly usable because the ‘locl’ GSUB feature is not required
to access the region-specific glyphs. Instead, only the glyphs that are necessary for each region
are included. This deployment configuration is recommended for users who need only the glyphs for
a specific region, and also desire the smallest possible footprint. These fonts are expected to
behave the same as conventional Simplified Chinese, Traditional Chinese, Japanese, or Korean
fonts. This configuration also requires a system that supports OTF or TTF variable fonts.
]

#h2[Region-specific Subset OpenType/CFF (Subset OTF)—35 font resources]

This deployment configuration contains the same set of fonts as the Region-specific Subset
OpenType/CFF2 variable font configuration as 35 separate static fonts.

#h2[Variable font Collections (OTC)—4 font resources]

This deployment configuration represents a “best of all possible worlds” in that there are
separate font instances for each language, and while each font instance necessarily specifies a
default language, the ‘locl’ GSUB feature can still be used to access the glyphs for the other
languages. The OTC files contain the 5 language-specific variable OTFs/TTFs
(SourceHanSans-VF.otf.ttc/SourceHanSans-VF.ttf.ttc) and 5 half-width variable OTFs/TTFs
(SourceHanSansHW-VF.otf.ttc/SourceHanSansHW-VF.ttf.ttc).

#remark[
These fonts offer greater flexibility in that there is a single font resource that includes all
font instances, each with a different one of the five languages serving as the default. Users of
these fonts simply choose the appropriate font in an application’s font menu, and the glyphs that
are suitable for that language are displayed. However, OpenType Collections may not be supported
everywhere. Note that if you install the OTCs, you cannot install any of the corresponding
language-specific OTFs, because they share the same names. This configuration also requires a
system that supports OTF or TTF variable fonts.
]

#h2[OpenType/CFF Collection (OTC)—7 font resources]

This is the same as the OpenType/CFF2 variable font Collection except that it packages all of the
static fonts rather than the variable fonts. This deployment configuration represents a “best of
all possible worlds (for static fonts)” in that there are separate font instances for each
language, and while each font instance necessarily specifies a default language, the ‘locl’ GSUB
feature can still be used to access the glyphs for the other languages. Like the language-specific
OTFs, the Regular and Bold weights additionally include font instances for all five languages
whose ASCII and small number of additional characters are half-width instead of the usual
proportional.

#remark[
These fonts offer greater flexibility in that there is a single font resource that includes five
or ten font instances, each with a different one of the five languages serving as the default.
Users of these fonts simply choose the appropriate font in an application’s font menu, and the
glyphs that are suitable for that language are displayed. However, OpenType/CFF Collections may
not be supported everywhere. Note that if you install the OTCs, you cannot install any of the
corresponding language-specific OTFs, because they share the same names.
]

#h2[Super OpenType/CFF Collection (Super OTC)—a single font resource]

This deployment configuration packs all seven weights and all five languages, along with
half-width variations of two of the seven weights, into a single font resource that includes a
total of 45 font instances and 458,745 total glyphs. As a result of ‘sfnt’ table sharing, there
are seven unique ‘CFF ‘, ‘hmtx’, and ‘vmtx’ tables (one per weight), five unique ‘GSUB’ tables
(one per language), and ten unique ‘cmap’ tables (one per language and proportional/half-width
combination). These represent the largest tables, so greater sharing leads to a smaller overall
footprint. This saves over 13MB compared to the seven separate static OTCs. While each font
instance specifies a default language, the ‘locl’ GSUB feature can still be used to access the
glyphs for the four other supported languages.

#remark[
This font offers the greatest flexibility for static fonts in that there is a single font resource
that includes all 45 font instances, one for each of the seven weights and five languages, along
with half-width versions of the Regular and Bold weights. Users of this deployment format simply
choose the appropriate font in an application’s font menu, and the glyphs that are suitable for
that language are displayed. The Super OTC is subject to the same caveats and limitations as the
weight-specific OTCs. If your system supports both variable fonts and OpenType Collections then
the language-specific variable OTCs will save even more space.
]

// =====================================================================
// Font Resources
// =====================================================================
#h1[Font Resources]

The table below lists all font resources that are included in this release, organized by format
and language, and providing their file and PostScript names:

#let fname = (..lines) => table.cell(align: left + top, text(size: 10pt, style: "italic", ..lines))
#let pname = (..lines) => table.cell(align: left + top, text(size: 10pt, ..lines))
#let frot  = (rowspan: 1, ..lines) => table.cell(rowspan: rowspan, align: center, rot(..lines))
#let lrot  = (..lines) => table.cell(align: center, rot(..lines))

#let weights7 = (pre) => (
  (pre + "VF-ExtraLight", pre + "VF-Light", pre + "VF-Normal", pre + "VF-Regular", pre + "VF-Medium", pre + "VF-Bold", pre + "VF-Heavy")
)
#let psnames = (arr) => {
  let acc = none
  for l in arr {
    acc = if acc == none { [l] + linebreak() } else { acc + [l] + linebreak() }
  }
  acc
}
#let strsplit = (s, sep) => {
  let parts = ()
  let cur = ""
  for c in s {
    if c == sep {
      parts.push(cur)
      cur = ""
    } else {
      cur = cur + c
    }
  }
  parts.push(cur)
  parts
}
#set par(leading: 6.7pt)
#table(
  columns: (42.6pt, 56.7pt, 165.1pt, 274.1pt),
  inset: 3.34pt,
  stroke: 0.6pt,

  table.header(
    table.cell(fill: hdrgray, align(center + top, text(size: 11pt, weight: 600, [Format]))),
    table.cell(fill: hdrgray, align(center + top, text(size: 11pt, weight: 600, [Language]))),
    table.cell(fill: hdrgray, align(center + top, text(size: 11pt, weight: 600, [File Name]))),
    table.cell(fill: hdrgray, align(center + top, text(size: 11pt, weight: 600, [PostScript Name/Names]))),
  ),
  // --- Variable OTF/TTF (SC, TC, HC, J, K) ---
  frot(rowspan: 5, [Variable\ OTF/TTF]),
  lrot([Simplified\ Chinese]),
  fname([SourceHanSansSC-VF.otf, SourceHanSansSC-VF.ttf]),
  pname(psnames("SourceHanSansSC")),
  lrot([Traditional\ Chinese—\ Taiwan]),
  fname([SourceHanSansTC-VF.otf, SourceHanSansTC-VF.ttf]),
  pname(psnames("SourceHanSansTC")),
  lrot([Traditional\ Chinese—\ Hong\ Kong]),
  fname([SourceHanSansHC-VF.otf, SourceHanSansHC-VF.ttf]),
  pname(psnames("SourceHanSansHC")),
  lrot([Japanese]),
  fname([SourceHanSans-VF.otf, SourceHanSans-VF.ttf]),
  pname(psnames("SourceHanSans")),
  lrot([Korean]),
  fname([SourceHanSansK-VF.otf, SourceHanSansK-VF.ttf, SourceHanSansSCHW-VF.otf, SourceHanSansSCHW-VF.ttf]),
  pname(psnames(weights7("SourceHanSansK") + ("SourceHanSansSCHWVF-Regular",))),
  // --- Variable HW OTF (TC, HC, J, K) ---
  frot(rowspan: 4, [Variable\ HW\ OTF]),
  lrot([TC]),
  fname([SourceHanSansTCHW-VF.otf, SourceHanSansTCHW-VF.ttf]),
  pname(psnames(("SourceHanSansTCHWVF-Regular", "SourceHanSansTCHWVF-Bold"))),
  lrot([HC]),
  fname([SourceHanSansHCHW-VF.otf, SourceHanSansHCHW-VF.ttf]),
  pname(psnames(("SourceHanSansHCHWVF-Regular", "SourceHanSansHCHWVF-Bold"))),
  lrot([J]),
  fname([SourceHanSansHW-VF.otf, SourceHanSansHW-VF.ttf]),
  pname(psnames(("SourceHanSansHWVF-Regular", "SourceHanSansHWVF-Bold"))),
  lrot([K]),
  fname([SourceHanSansKHW-VF.otf, SourceHanSansKHW-VF.ttf]),
  pname(psnames(("SourceHanSansKHWVF-Regular", "SourceHanSansKHWVF-Bold"))),
  // --- Variable Subset OTF/TTF ---
  frot([Variable\ Subset\ OTF/TTF]),
  lrot([CN]),
  fname([SourceHanSansCN-VF.otf, SourceHanSansCN-VF.ttf]),
  pname(psnames("SourceHanSansCN")),
  lrot([TW]),
  fname([SourceHanSansTW-VF.otf, SourceHanSansTW-VF.ttf]),
  pname(psnames("SourceHanSansTW")),
  lrot([HK]),
  fname([SourceHanSansHK-VF.otf, SourceHanSansHK-VF.ttf]),
  pname(psnames("SourceHanSansHK")),
  lrot([JP]),
  fname([SourceHanSansJP-VF.otf, SourceHanSansJP-VF.ttf]),
  pname(psnames("SourceHanSansJP")),
  lrot([KR]),
  fname([SourceHanSansKR-VF.otf, SourceHanSansKR-VF.ttf]),
  pname(psnames("SourceHanSansKR")),
  // --- OTF (SC, TC, HC, JP, KR) ---
  frot(rowspan: 5, [OTF]),
  lrot([Simplified\ Chinese]),
  fname(psnames((
    "SourceHanSansSC-ExtraLight.otf", "SourceHanSansSC-Light.otf", "SourceHanSansSC-Normal.otf",
    "SourceHanSansSC-Regular.otf", "SourceHanSansHWSC-Regular.otf", "SourceHanSansSC-Medium.otf",
    "SourceHanSansSC-Bold.otf", "SourceHanSansHWSC-Bold.otf", "SourceHanSansSC-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansSC-ExtraLight", "SourceHanSansSC-Light", "SourceHanSansSC-Normal",
    "SourceHanSansSC-Regular", "SourceHanSansHWSC-Regular", "SourceHanSansSC-Medium",
    "SourceHanSansSC-Bold", "SourceHanSansHWSC-Bold", "SourceHanSansSC-Heavy",
  ))),
  lrot([Traditional\ Chinese—\ Taiwan]),
  fname(psnames((
    "SourceHanSansTC-ExtraLight.otf", "SourceHanSansTC-Light.otf", "SourceHanSansTC-Normal.otf",
    "SourceHanSansTC-Regular.otf", "SourceHanSansHWTC-Regular.otf", "SourceHanSansTC-Medium.otf",
    "SourceHanSansTC-Bold.otf", "SourceHanSansHWTC-Bold.otf", "SourceHanSansTC-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansTC-ExtraLight", "SourceHanSansTC-Light", "SourceHanSansTC-Normal",
    "SourceHanSansTC-Regular", "SourceHanSansHWTC-Regular", "SourceHanSansTC-Medium",
    "SourceHanSansTC-Bold", "SourceHanSansHWTC-Bold", "SourceHanSansTC-Heavy",
  ))),
  lrot([Traditional\ Chinese—\ Hong\ Kong]),
  fname(psnames((
    "SourceHanSansHC-ExtraLight.otf", "SourceHanSansHC-Light.otf", "SourceHanSansHC-Normal.otf",
    "SourceHanSansHC-Regular.otf", "SourceHanSansHWHC-Regular.otf", "SourceHanSansHC-Medium.otf",
    "SourceHanSansHC-Bold.otf", "SourceHanSansHWHC-Bold.otf", "SourceHanSansHC-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansHC-ExtraLight", "SourceHanSansHC-Light", "SourceHanSansHC-Normal",
    "SourceHanSansHC-Regular", "SourceHanSansHWHC-Regular", "SourceHanSansHC-Medium",
    "SourceHanSansHC-Bold", "SourceHanSansHWHC-Bold", "SourceHanSansHC-Heavy",
  ))),
  lrot([Japanese]),
  fname(psnames((
    "SourceHanSans-ExtraLight.otf", "SourceHanSans-Light.otf", "SourceHanSans-Normal.otf",
    "SourceHanSans-Regular.otf", "SourceHanSansHW-Regular.otf", "SourceHanSans-Medium.otf",
    "SourceHanSans-Bold.otf", "SourceHanSansHW-Bold.otf", "SourceHanSans-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSans-ExtraLight", "SourceHanSans-Light", "SourceHanSans-Normal",
    "SourceHanSans-Regular", "SourceHanSansHW-Regular", "SourceHanSans-Medium",
    "SourceHanSans-Bold", "SourceHanSansHW-Bold", "SourceHanSans-Heavy",
  ))),
  lrot([Korean]),
  fname(psnames((
    "SourceHanSansK-ExtraLight.otf", "SourceHanSansK-Light.otf", "SourceHanSansK-Normal.otf",
    "SourceHanSansK-Regular.otf", "SourceHanSansHWK-Regular.otf", "SourceHanSansK-Medium.otf",
    "SourceHanSansK-Bold.otf", "SourceHanSansHWK-Bold.otf", "SourceHanSansK-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansK-ExtraLight", "SourceHanSansK-Light", "SourceHanSansK-Normal",
    "SourceHanSansK-Regular", "SourceHanSansHWK-Regular", "SourceHanSansK-Medium",
    "SourceHanSansK-Bold", "SourceHanSansHWK-Bold", "SourceHanSansK-Heavy",
  ))),
  // --- Subset OTF (CN, TW, HK, JP, KR) ---
  frot(rowspan: 5, [Subset\ OTF]),
  lrot([CN]),
  fname(psnames((
    "SourceHanSansCN-ExtraLight.otf", "SourceHanSansCN-Light.otf", "SourceHanSansCN-Normal.otf",
    "SourceHanSansCN-Regular.otf", "SourceHanSansCN-Medium.otf", "SourceHanSansCN-Bold.otf",
    "SourceHanSansCN-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansCN-ExtraLight", "SourceHanSansCN-Light", "SourceHanSansCN-Normal",
    "SourceHanSansCN-Regular", "SourceHanSansCN-Medium", "SourceHanSansCN-Bold",
    "SourceHanSansCN-Heavy",
  ))),
  lrot([TW]),
  fname(psnames((
    "SourceHanSansTW-ExtraLight.otf", "SourceHanSansTW-Light.otf", "SourceHanSansTW-Normal.otf",
    "SourceHanSansTW-Regular.otf", "SourceHanSansTW-Medium.otf", "SourceHanSansTW-Bold.otf",
    "SourceHanSansTW-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansTW-ExtraLight", "SourceHanSansTW-Light", "SourceHanSansTW-Normal",
    "SourceHanSansTW-Regular", "SourceHanSansTW-Medium", "SourceHanSansTW-Bold",
    "SourceHanSansTW-Heavy",
  ))),
  lrot([HK]),
  fname(psnames((
    "SourceHanSansHK-ExtraLight.otf", "SourceHanSansHK-Light.otf", "SourceHanSansHK-Normal.otf",
    "SourceHanSansHK-Regular.otf", "SourceHanSansHK-Medium.otf", "SourceHanSansHK-Bold.otf",
    "SourceHanSansHK-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansHK-ExtraLight", "SourceHanSansHK-Light", "SourceHanSansHK-Normal",
    "SourceHanSansHK-Regular", "SourceHanSansHK-Medium", "SourceHanSansHK-Bold",
    "SourceHanSansHK-Heavy",
  ))),
  lrot([JP]),
  fname(psnames((
    "SourceHanSansJP-ExtraLight.otf", "SourceHanSansJP-Light.otf", "SourceHanSansJP-Normal.otf",
    "SourceHanSansJP-Regular.otf", "SourceHanSansJP-Medium.otf", "SourceHanSansJP-Bold.otf",
    "SourceHanSansJP-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansJP-ExtraLight", "SourceHanSansJP-Light", "SourceHanSansJP-Normal",
    "SourceHanSansJP-Regular", "SourceHanSansJP-Medium", "SourceHanSansJP-Bold",
    "SourceHanSansJP-Heavy",
  ))),
  lrot([KR]),
  fname(psnames((
    "SourceHanSansKR-ExtraLight.otf", "SourceHanSansKR-Light.otf", "SourceHanSansKR-Normal.otf",
    "SourceHanSansKR-Regular.otf", "SourceHanSansKR-Medium.otf", "SourceHanSansKR-Bold.otf",
    "SourceHanSansKR-Heavy.otf",
  ))),
  pname(psnames((
    "SourceHanSansKR-ExtraLight", "SourceHanSansKR-Light", "SourceHanSansKR-Normal",
    "SourceHanSansKR-Regular", "SourceHanSansKR-Medium", "SourceHanSansKR-Bold",
    "SourceHanSansKR-Heavy",
  ))),
  // --- OTC ---
  frot(rowspan: 7, [OTC]),
  lrot([All]),
  fname([SourceHanSans-ExtraLight.ttc]),
  pname(psnames(strsplit("SourceHanSans-ExtraLight, SourceHanSansK-ExtraLight, SourceHanSansSC-ExtraLight, SourceHanSansTC-ExtraLight, SourceHanSansHC-ExtraLight", " "))),
  fname([SourceHanSans-Light.ttc]),
  pname(psnames(strsplit("SourceHanSans-Light, SourceHanSansK-Light, SourceHanSansSC-Light, SourceHanSansTC-Light, SourceHanSansHC-Light", " "))),
  fname([SourceHanSans-Normal.ttc]),
  pname(psnames(strsplit("SourceHanSans-Normal, SourceHanSansK-Normal, SourceHanSansSC-Normal, SourceHanSansTC-Normal, SourceHanSansHC-Normal", " "))),
  fname([SourceHanSans-Regular.ttc]),
  pname(psnames(strsplit("SourceHanSans-Regular, SourceHanSansK-Regular, SourceHanSansSC-Regular, SourceHanSansTC-Regular, SourceHanSansHC-Regular, SourceHanSansHW-Regular, SourceHanSansHWK-Regular, SourceHanSansHWSC-Regular, SourceHanSansHWTC-Regular, SourceHanSansHWHC-Regular", " "))),
  fname([SourceHanSans-Medium.ttc]),
  pname(psnames(strsplit("SourceHanSans-Medium, SourceHanSansK-Medium, SourceHanSansSC-Medium, SourceHanSansTC-Medium, SourceHanSansHC-Medium", " "))),
  fname([SourceHanSans-Bold.ttc]),
  pname(psnames(strsplit("SourceHanSans-Bold, SourceHanSansK-Bold, SourceHanSansSC-Bold, SourceHanSansTC-Bold, SourceHanSansHC-Bold, SourceHanSansHW-Bold, SourceHanSansHWK-Bold, SourceHanSansHWSC-Bold, SourceHanSansHWTC-Bold, SourceHanSansHWHC-Bold", " "))),
  fname([SourceHanSans-Heavy.ttc]),
  pname(psnames(strsplit("SourceHanSans-Heavy, SourceHanSansK-Heavy, SourceHanSansSC-Heavy, SourceHanSansTC-Heavy, SourceHanSansHC-Heavy", " "))),
  // --- Super OTC ---
  frot([Super\ OTC]),
  lrot([All]),
  fname([SourceHanSans.ttc]),
  pname(psnames(strsplit("SourceHanSans-ExtraLight, SourceHanSansK-ExtraLight, SourceHanSansSC-ExtraLight, SourceHanSansTC-ExtraLight, SourceHanSansHC-ExtraLight, SourceHanSans-Light, SourceHanSansK-Light, SourceHanSansSC-Light, SourceHanSansTC-Light, SourceHanSansHC-Light, SourceHanSans-Normal, SourceHanSansK-Normal, SourceHanSansSC-Normal, SourceHanSansTC-Normal, SourceHanSansHC-Normal, SourceHanSans-Regular, SourceHanSansK-Regular, SourceHanSansSC-Regular, SourceHanSansTC-Regular, SourceHanSansHC-Regular, SourceHanSansHW-Regular, SourceHanSansHWK-Regular, SourceHanSansHWSC-Regular, SourceHanSansHWTC-Regular, SourceHanSansHWHC-Regular, SourceHanSans-Medium, SourceHanSansK-Medium, SourceHanSansSC-Medium, SourceHanSansTC-Medium, SourceHanSansHC-Medium, SourceHanSans-Bold, SourceHanSansK-Bold, SourceHanSansSC-Bold, SourceHanSansTC-Bold, SourceHanSansHC-Bold, SourceHanSansHW-Bold, SourceHanSansHWK-Bold, SourceHanSansHWSC-Bold, SourceHanSansHWTC-Bold, SourceHanSansHWHC-Bold, SourceHanSans-Heavy, SourceHanSansK-Heavy, SourceHanSansSC-Heavy, SourceHanSansTC-Heavy, SourceHanSansHC-Heavy", " "))),
  // --- Variable OTC ---
  frot([Variable\ OTC]),
  lrot([All]),
  fname([SourceHanSans-VF.otf.ttc, SourceHanSans-VF.ttf.ttc]),
  pname(psnames(strsplit("SourceHanSansVF-ExtraLight, SourceHanSansKVF-ExtraLight, SourceHanSansSCVF-ExtraLight, SourceHanSansTCVF-ExtraLight, SourceHanSansHCVF-ExtraLight, SourceHanSansVF-Light, SourceHanSansKVF-Light, SourceHanSansSCVF-Light, SourceHanSansTCVF-Light, SourceHanSansHCVF-Light, SourceHanSansVF-Normal, SourceHanSansKVF-Normal, SourceHanSansSCVF-Normal, SourceHanSansTCVF-Normal, SourceHanSansHCVF-Normal, SourceHanSansVF-Regular, SourceHanSansKVF-Regular, SourceHanSansSCVF-Regular, SourceHanSansTCVF-Regular, SourceHanSansHCVF-Regular, SourceHanSansVF-Medium, SourceHanSansKVF-Medium, SourceHanSansSCVF-Medium, SourceHanSansTCVF-Medium, SourceHanSansHCVF-Medium, SourceHanSansVF-Bold, SourceHanSansKVF-Bold, SourceHanSansSCVF-Bold, SourceHanSansTCVF-Bold, SourceHanSansHCVF-Bold, SourceHanSansVF-Heavy, SourceHanSansKVF-Heavy, SourceHanSansSCVF-Heavy, SourceHanSansTCVF-Heavy, SourceHanSansHCVF-Heavy", " "))),
  // --- Variable HW OTC ---
  frot([Variable\ HW\ OTC]),
  lrot([All]),
  fname([SourceHanSansHW-VF.otf.ttc, SourceHanSansHW-VF.ttf.ttc]),
  pname(psnames(strsplit("SourceHanSansSCHWVF-Regular, SourceHanSansSCHWVF-Bold, SourceHanSansTCHWVF-Regular, SourceHanSansTCHWVF-Bold, SourceHanSansHCHWVF-Regular, SourceHanSansHCHWVF-Bold, SourceHanSansHWVF-Regular, SourceHanSansHWVF-Bold, SourceHanSansKHWVF-Regular, SourceHanSansKHWVF-Bold", " "))),
)
#set par(leading: 8.1pt)

// =====================================================================
// Glyph Set Particulars
// =====================================================================
#h1[Glyph Set Particulars]

#h2[Glyph Set & Region-specific Subsets]

The number of glyphs in each font resource—except for the region-specific subset OTFs—is 65,535
(CIDs 0 through 65534), which is at the architectural limit for CID-keyed fonts (65,535 glyphs).

The table below indicates the number of glyphs that are included in the region-specific subset
OTFs, whose figures include a common set of 3,241 glyphs that correspond to various characters,
symbols, and punctuation. Also provided are the names of the subset definition files that can be
found in the #lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/Resources/")[Resources] folder of the release branch of this open source project.

#table(
  columns: (99.3pt, 70.8pt, 94.3pt, 274.1pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    hcl([Language]),
    hc([Glyphs]),
    hcl([Subset Definition File]),
    hcl([Supported Standards]),
  ),
  table.cell(align: left + top, [Simplified Chinese]),
  table.cell(align: center + top, [31,072]),
  table.cell(align: left + top, text(size: 11pt, style: "italic", [AI0-SourceHanSans.CN])),
  table.cell(align: left + top, text(size: 11pt, [All GB 18030 2022 Implementation Level 2 hanzi as well as the remaining URO and Extension A glyphs in Level 3, all 8,105 hanzi of Tōngyòng Guīfàn Hànzìbiǎo (通用规范汉字表)])),
  table.cell(align: left + top, [Traditional Chinese—Taiwan]),
  table.cell(align: center + top, [20,963]),
  table.cell(align: left + top, text(size: 11pt, style: "italic", [AI0-SourceHanSans.TW])),
  table.cell(align: left + top, text(size: 11pt, [All Big Five hanzi (aka CNS 11643 Planes 1 and 2), all HKSCS-2016 hanzi (the glyphs may or may not adhere to the Taiwan MOE glyph standard), seven ETen hanzi, 15 additional hanzi])),
  table.cell(align: left + top, [Traditional Chinese—Hong Kong]),
  table.cell(align: center + top, [20,955]),
  table.cell(align: left + top, text(size: 11pt, style: "italic", [AI0-SourceHanSans.HK])),
  table.cell(align: left + top, text(size: 11pt, [All Big Five hanzi (aka CNS 11643 Planes 1 and 2), all HKSCS-2016 hanzi, seven ETen hanzi, 15 additional hanzi])),
  table.cell(align: left + top, [Japanese]),
  table.cell(align: center + top, [17,944]),
  table.cell(align: left + top, text(size: 11pt, style: "italic", [AI0-SourceHanSans.JP])),
  table.cell(align: left + top, text(size: 11pt, [All Adobe-Japan1-7 kanji (a superset of those in JIS X 0208, JIS X 0213 & JIS X 0212)])),
  table.cell(align: left + top, [Korean]),
  table.cell(align: center + top, [24,973]),
  table.cell(align: left + top, text(size: 11pt, style: "italic", [AI0-SourceHanSans.KR])),
  table.cell(align: left + top, text(size: 11pt, [All modern (11,172) and 500 high-frequency archaic hangul syllables, conjoining hangul jamo (with full archaic hangul support), all KS X 1001 and KS X 1002 hanja (7,476), 722 additional hanja])),
)
#v(8pt)

Of course, the font resources that include the full set of 65,535 glyphs support all of the
standards that are listed in the above table, and employ some method of accessing the glyphs for
different languages when they occupy the same Unicode code point and require a different shape.

The ordering file, _AI0-SourceHanSans_, which is provided in the
#lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/Resources/")[Resources] folder of the release branch of this open source project, lists all 65,535 CIDs in the first column, and shows the FDArray and row font structure in the second and third columns, respectively, along with the Unicode-based working glyph names in the fourth column. All 65,535 working glyph names are unique, and all—with the exception of the ones for CID+0 (the .notdef glyph) and CIDs 65531 through 65534—use a “uni” (BMP) or “u” (outside BMP) prefix followed by uppercase hexadecimal digits. Glyphs that are represented by (or can be considered) sequences are made up of concatenations of the appropriate Unicode-based glyph names. Identifiers for regions and other purposes are also used.

// ----- Weights -----------------------------------------------------------
#h2[Weights]

The table below shows sample glyphs in each of the seven weights, ranging from ExtraLight to
Heavy. The ExtraLight and Heavy weights represent the master designs, and the five intermediate
weights are the result of multiple master interpolation (the interpolation ratios are provided):

#let wcell = (w, g) => table.cell(align: center, text(size: 32pt, weight: w, g))
#table(
  columns: 7,
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [ExtraLight—0])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Light—160])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Normal—320])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Regular—420])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Medium—560])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Bold—780])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Heavy—1000])),
  ),
  wcell(250, [汉漢]), wcell(300, [汉漢]), wcell(350, [汉漢]), wcell(400, [汉漢]),
  wcell(500, [汉漢]), wcell(700, [汉漢]), wcell(900, [汉漢]),
)
#align(center,
  text(size: 32pt, weight: 250, [漢한]) + text(size: 32pt, weight: 300, [漢한]) +
  text(size: 32pt, weight: 350, [漢한]) + text(size: 32pt, weight: 400, [漢한]) +
  text(size: 32pt, weight: 500, [漢한]) + text(size: 32pt, weight: 700, [漢한]) +
  text(size: 32pt, weight: 900, [漢한]),
)

// ----- Glyph Complement PDFs ---------------------------------------------
#h2[Glyph Complement PDFs]

Included in the #lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/GlyphComplements/")[GlyphComplements] folder of the release branch of this open source project are seven per-weight 2,105-page glyph complement PDFs that provide a visual synopsis for all 65,535 glyphs, along with Unicode tables for each of the five languages: Japanese, Korean, Simplified Chinese, Traditional Chinese (Taiwan), and Traditional Chinese (Hong Kong).

Pp 1 through 132 show all 65,535 glyphs by CID. The glyphs for U+2E3A and U+2E3B are excessively wide, and are instead shown in a separate glyph table on page 132. Their blue “P132” placeholders are on pp 3 and 127.

Bookmarked under the “Korean” bookmark, pp 919 through 931 (13 pages) show the 500 pre-composed high-frequency archaic hangul syllables, ordered by their two- or three-character combining sequences.

For the five bookmarked 393-page Unicode tables, for each code point that maps to a glyph, there are three types of annotations, described as follows according to their position relative to the code-point box:

#text(weight: 600)[Upper-Left]—Glyph width: F = Full-width, H = Half-width, M = Monospaced (hangul letters and syllables), P = Proportional, Q = Quarter-width, T = Tall (U+3031, U+3032, and the vertical forms of U+2E3A and U+2E3B), W = Wide (U+2E3A and U+2E3B), Z = Zero (non-spacing/combining)

#text(weight: 600)[Upper-Right]—Language (Region): C = Simplified Chinese (China), H = Traditional Chinese (Hong Kong), J = Japanese, K = Korean, T = Traditional Chinese (Taiwan)

#text(weight: 600)[Bottom]—The CID of the glyph

Glyphs that are tall (T), wide (W), or non-spacing/combining (Z) may exceed or appear outside the
glyph or code-point box, which include those for U+20DD, U+20DE, U+2E3A, U+2E3B, U+302A through
U+302D, U+3031, U+3032, U+3099, and U+309A, along with those for combining jamo.

// ----- Unencoded Glyphs ----------------------------------------------------
#h2[Unencoded Glyphs]

Ignoring code points that share different Simplified Chinese, Traditional Chinese, Japanese,
Korean, and proportional/half-width glyphs, there are 3,234 unencoded glyphs in each 65,535-glyph
font resource. The region-specific subset OTFs include considerably fewer unencoded glyphs.

Approximately one-third of the unencoded glyphs are Japanese ideographs (kanji), all of which
represent kanji included in Adobe-Japan1-6. Some of these have been explicitly identified as JIS90
(JIS X 0208-1990) glyphs according to their source glyph names and are reflected in the ‘jp90’
GSUB feature that is specific to Japanese fonts and font instances, and the remainder have been
identified according to their registered IVSes in the _Adobe-Japan1_
#lnk("http://www.unicode.org/ivd/")[IVD (Ideographic Variation Database)] Collection, and are
reflected in the Format 14 ‘cmap’ subtable in the same fonts and font instances.

The bulk of the remaining unencoded glyphs are the 500 high-frequency archaic hangul syllables,
the glyphs for combing jamo, vertical forms, and a small number of other variants.

// ----- Latin, Greek & Cyrillic Glyphs --------------------------------------
#h2[Latin, Greek & Cyrillic Glyphs]

Included in all font resources is a rich set of Latin glyphs that support not only ASCII and
ISO/IEC 8859-1 (aka ISO Latin 1), but also the characters that are necessary for broadly-used CJK
transliteration and transcription systems, along with those that are necessary for Latin-based
Vietnamese. A basic set of glyphs for Greek and Cyrillic, with proportional metrics, is also
included.

#h3[Source Han Sans Versus Source Sans Pro & Source Code Pro]

The Latin, Latin-like, Greek, and Cyrillic glyphs in _Source Han Sans_ are derived from—but not
identical to—#lnk("https://github.com/adobe-fonts/source-sans-pro/")[Source Sans Pro]. The same
is true for the half-width glyphs in terms of their relationship with
#lnk("https://github.com/adobe-fonts/source-code-pro/")[Source Code Pro]. The Latin and Latin-like
glyphs in a typical CJK font represent a minority, and when it comes to harmonizing glyphs of
different scripts, it is better to modify the minority to harmonize with the majority, and not
vice versa. In addition, half-width glyphs in typical CJK fonts are also expected to be precisely
half-width.

There are two primary differences between the glyphs that are common in _Source Han Sans_ and
_Source Sans Pro_:

- The interpolation ratios for the weights are different. _Source Han Sans_ is available in seven
  weights: ExtraLight, Light, Normal, Regular, Medium, Bold, and Heavy. _Source Sans Pro_ is
  available in six: ExtraLight, Light, Regular, Semibold, Bold, and Black. While some of the
  weight names are the same, one should not assume that the interpolation ratios are the same.
  They will be relatively close, but not precisely the same.

- The glyphs in _Source Han Sans_ that are derived from _Source Sans Pro_ have been adapted for
  use in _Source Han Sans_, which mainly involves scaling. In the case of the ExtraLight, Regular,
  and Heavy/Black weights, the _Source Sans Pro_ glyphs were scaled to 110%, 113%, and 115%,
  respectively. Thus, the _Source Han Sans_ glyphs appear to be slightly larger than those in
  _Source Sans Pro_, particularly in the heavier weights.

The half-width Latin glyphs in _Source Han Sans_, which are the default for the half-width (“HW”)
OTFs and OTC font instances in only the Regular and Bold weights, and which are also exposed via
the ‘hwid’ GSUB feature in the other OTFs and OTC font instances, are different from the glyphs in
_Source Code Pro_ as follows:

- Like _Source Sans Pro_, the interpolation ratios are different for all weights.

- The half-width Latin glyphs in _Source Han Sans_ are precisely half-width, meaning half an em or
  500-unit horizontal advances. The glyphs in _Source Code Pro_ are monospaced, using 600-unit
  horizontal advances, meaning that they are not precisely half-width.

- The glyphs themselves are also different, particularly the one for zero (0) whose glyph in
  _Source Han Sans_ lacks a center dot to more easily distinguish it from uppercase O, which is
  important when using a font to edit or display source code.

The table below compares _Source Han Sans_ with _Source Sans Pro_ and _Source Code Pro_ for three
weights, ExtraLight, Regular, and Heavy/Black:

#let cmp = (wshs, wssp, wscp, ..label) => (
  table.cell(align: center + top, text(size: 11pt, weight: 600, ..label)),
  table.cell(align: center + top,
    text(size: 18pt, font: cjksc, weight: wshs, [Unicode Version 17.0]) +
    text(size: 18pt, [ ↔ ]) +
    text(size: 18pt, font: sans, weight: wssp, [Unicode Version 17.0]) + linebreak() +
    text(size: 18pt, font: mono, weight: wshs, [Unicode Version 17.0]) +
    text(size: 18pt, [ ↔ ]) +
    text(size: 18pt, font: mono, weight: wscp, [Unicode Version 17.0])),
  table.cell(align: center + top,
    text(size: 18pt, font: sans, weight: wssp, [Unicode Version 17.0]) + linebreak() +
    text(size: 18pt, font: mono, weight: wscp, [Unicode Version 17.0])),
)
#table(
  columns: (50pt, 339.1pt, 149.4pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Weight])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, ["Source Han Sans & Source Han Sans HW / 'hwid'"])),
    table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Source Sans Pro & Source Code Pro])),
  ),
  ..cmp(250, 250, 200, [ExtraLight]),
  ..cmp(400, 400, 400, [Regular]),
  ..cmp(900, 900, 900, [Heavy/Black]),
)

// ----- Vertical Glyphs -----------------------------------------------------
#h2[Vertical Glyphs]

The usual and expected set of vertical glyphs is included, some of which are region- or
language-specific. In addition, all glyphs for kana, meaning not only those for small kana,
include a vertical glyph variant. A small number of vertical glyphs happen to be encoded for
compatibility reasons, most of which can be found in the U+FExx range, but they are still
accessible via the ‘vert’ GSUB feature as vertical variants of the horizontal forms that are
encoded elsewhere.

The pre-rotated non–full-width glyphs that are typically accessible via the effectively-deprecated
‘vrt2’ GSUB feature have been intentionally excluded from the glyph set.

// =====================================================================
// CIDFont Resource & CFF Particulars
// =====================================================================
#h1[CIDFont Resource & CFF Particulars]

#h2[CIDFont Resource Structure]

The font resources that include 65,535 glyphs began their life as an Adobe-Identity-0 ROS CIDFont
resource that includes 18 FDArray elements, each of which specifies its own hinting parameters.
The table below shows the names of each of the 18 FDArray elements, its index, the CIDs and CID
ranges that are included, and the total number of glyphs:

#table(
  columns: (99.3pt, 42.5pt, 354.3pt, 42.4pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    hcl([FDArray Name]),
    hc([Index]),
    hcl([CIDs & CID Ranges]),
    hc([Glyphs]),
  ),
  table.cell(align: left + top, [Alphabetic]),
  table.cell(align: center + top, [0]),
  table.cell(align: left + top, [59087-59112, 59119-59144]),
  table.cell(align: center + top, [52]),
  table.cell(align: left + top, [AlphabeticDigits]),
  table.cell(align: center + top, [1]),
  table.cell(align: left + top, [958-977, 59070-59079, 59226-59236]),
  table.cell(align: center + top, [41]),
  table.cell(align: left + top, [Bopomofo]),
  table.cell(align: center + top, [2]),
  table.cell(align: left + top, [1654-1696, 1806-1837, 65355]),
  table.cell(align: center + top, [76]),
  table.cell(align: left + top, [Dingbats]),
  table.cell(align: left + top, text(size: 10pt, [102, 111, 116, 149, 181, 245-253, 255-256, 720, 723-724, 731-732, 734-736, 741, 743, 747, 752-759, 762, 764-766, 768-769, 794-830, 832-957, 978-1077, 1238-1285, 1287-1292, 1294-1328, 1330-1354, 1384-1464, 1551-1554, 1558, 1649, 1790-1805, 1892-2451, 58987-59069, 59080-59086, 59113-59118, 59145-59149, 59213-59219, 59237-59326, 59330-59485, 63152-63165, 63292-63295, 65153-65169, 65256-65257, 65261, 65372-65473])),
  table.cell(align: center + top, [1,575]),
  table.cell(align: left + top, [DingbatsDigits]),
  table.cell(align: center + top, [4]),
  table.cell(align: left + top, [770-793]),
  table.cell(align: center + top, [24]),
  table.cell(align: left + top, [Generic]),
  table.cell(align: center + top, [5]),
  table.cell(align: left + top, [0, 1078-1237, 1286, 1293, 65498-65534]),
  table.cell(align: center + top, [200]),
  table.cell(align: left + top, [HDingbats]),
  table.cell(align: center + top, [6]),
  table.cell(align: left + top, [59220-59225]),
  table.cell(align: center + top, [6]),
  table.cell(align: left + top, [HKana]),
  table.cell(align: center + top, [7]),
  table.cell(align: left + top, [59150-59212]),
  table.cell(align: center + top, [63]),
  table.cell(align: left + top, [HWidth]),
  table.cell(align: center + top, [8]),
  table.cell(align: left + top, [63177-63192, 63203-63274]),
  table.cell(align: center + top, [88]),
  table.cell(align: left + top, [HWidthCJK]),
  table.cell(align: center + top, [9]),
  table.cell(align: left + top, [63275-63291]),
  table.cell(align: center + top, [17]),
  table.cell(align: left + top, [HWidthDigits]),
  table.cell(align: center + top, [10]),
  table.cell(align: left + top, [63193-63202]),
  table.cell(align: center + top, [10]),
  table.cell(align: left + top, [Hangul]),
  table.cell(align: center + top, [11]),
  table.cell(align: left + top, [372-627, 1697-1789, 47590-58862, 63296-65152]),
  table.cell(align: center + top, [13,479]),
  table.cell(align: left + top, [Ideographs]),
  table.cell(align: center + top, [12]),
  table.cell(align: left + top, [1357-1383, 1838-1875, 2452-47589, 58863-58981, 59486-61876, 61909-63120]),
  table.cell(align: center + top, [48,925]),
  table.cell(align: left + top, [Kana]),
  table.cell(align: center + top, [13]),
  table.cell(align: left + top, [1465-1550, 1555-1557, 1559-1648, 1650-1653, 1876-1891, 61885-61908]),
  table.cell(align: center + top, [223]),
  table.cell(align: left + top, [Proportional]),
  table.cell(align: center + top, [14]),
  table.cell(align: left + top, text(size: 10pt, [1-101, 103-110, 112-115, 117-148, 150-180, 182-244, 254, 257-371, 628-719, 721-722, 725-730, 733, 737-740, 742, 744-746, 748-751, 760-761, 763, 767, 831, 1329, 1355-1356, 58982-58986, 59327-59329, 61877-61884, 63176])),
  table.cell(align: center + top, [493]),
  table.cell(align: left + top, [ProportionalCJK]),
  table.cell(align: center + top, [15]),
  table.cell(align: left + top, [63121-63151]),
  table.cell(align: center + top, [31]),
  table.cell(align: left + top, [ProportionalDigits]),
  table.cell(align: center + top, [16]),
  table.cell(align: left + top, [63166-63175]),
  table.cell(align: center + top, [10]),
  table.cell(align: left + top, [VKana]),
  table.cell(align: center + top, [17]),
  table.cell(align: left + top, [65170-65255, 65258-65260, 65262-65354, 65356-65371, 65474-65497]),
  table.cell(align: center + top, [222]),
)

// ----- CFF Subroutinization ------------------------------------------------
#h2[CFF Subroutinization]

All ‘CFF ‘ tables have been subroutinized. The size savings ranges anywhere from 1.5 to 3MB for
the 65,535-glyph OTFs and OTCs. The ExtraLight weight exhibits the greatest size savings.

The #lnk("https://github.com/adobe-type-tools/afdko/")[AFDKO] _tx_ tool and its “-cff +S” command-line options were used to convert the CIDFont resources into CFFs and to subroutinize them. The resulting subroutinized CFFs were subsequently spliced into the ‘sfnt’ font resources (aka OpenType/CFF fonts) using the _sfntedit_ tool.

// =====================================================================
// Unicode Particulars
// =====================================================================
#h1[Unicode Particulars]

#h2[Unicode Mappings]

The Format 12 (UTF-32) ‘cmap’ subtable of each language-specific OTF and OTC specifies 44,812
meaningful mappings, and the region-specific subset OTFs obviously include less. Note that some
glyphs map from multiple code points, such as the range U+2F00 through U+2FD5, along with a large
chunk of the CJK Compatibility Ideographs. When the ten UTF-32 CMap resources are combined, a total
of 62,382 glyphs are covered, which leaves 3,153 glyphs as being not directly unencoded.

In addition to the ideographs for which there are obviously a large number of language-specific
glyphs, the following code points also exhibit language-specific variation:

#let ucode = it => table.cell(align: left + top, text(size: 11pt, font: mono, it))
#let glyphcol = (f, g) => table.cell(align: center, gm(text(font: f, g)))
#let umap-table = (rows) => table(
  columns: (99.3pt, 116.2pt, 107.7pt, 107.7pt, 107.6pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    hcl([Unicode]),
    hc([Simplified Chinese]),
    hc([Traditional Chinese]),
    hc([Japanese]),
    hc([Korean]),
  ),
  ..rows.map(r => (r.at(0), r.at(1), r.at(2), r.at(3), r.at(4))).flatten()
)
#umap-table((
  (ucode([U+2018]), glyphcol(cjksc, [‘]), glyphcol(cjktc, [‘]), glyphcol(cjkjp, [‘]), glyphcol(cjkkr, [‘])),
  (ucode([U+2019]), glyphcol(cjksc, [’]), glyphcol(cjktc, [’]), glyphcol(cjkjp, [’]), glyphcol(cjkkr, [’])),
  (ucode([U+201C]), glyphcol(cjksc, [“]), glyphcol(cjktc, [“]), glyphcol(cjkjp, [“]), glyphcol(cjkkr, [“])),
  (ucode([U+201D]), glyphcol(cjksc, [”]), glyphcol(cjktc, [”]), glyphcol(cjkjp, [”]), glyphcol(cjkkr, [”])),
  (ucode([U+2264]), glyphcol(cjksc, [≤]), glyphcol(cjktc, [≤]), glyphcol(cjkjp, [≤]), glyphcol(cjkkr, [≤])),
  (ucode([U+2265]), glyphcol(cjksc, [≥]), glyphcol(cjktc, [≥]), glyphcol(cjkjp, [≥]), glyphcol(cjkkr, [≥])),
  (ucode([U+226E]), glyphcol(cjksc, [≮]), glyphcol(cjktc, [≮]), glyphcol(cjkjp, [≮]), glyphcol(cjkkr, [≮])),
  (ucode([U+226F]), glyphcol(cjksc, [≯]), glyphcol(cjktc, [≯]), glyphcol(cjkjp, [≯]), glyphcol(cjkkr, [≯])),
  (ucode([U+3001]), glyphcol(cjksc, [、]), glyphcol(cjktc, [、]), glyphcol(cjkjp, [、]), glyphcol(cjkkr, [、])),
  (ucode([U+3002]), glyphcol(cjksc, [。]), glyphcol(cjktc, [。]), glyphcol(cjkjp, [。]), glyphcol(cjkkr, [。])),
  (ucode([U+FF01]), glyphcol(cjksc, [！]), glyphcol(cjktc, [！]), glyphcol(cjkjp, [！]), glyphcol(cjkkr, [！])),
  (ucode([U+FF0C]), glyphcol(cjksc, [，]), glyphcol(cjktc, [，]), glyphcol(cjkjp, [，]), glyphcol(cjkkr, [，])),
  (ucode([U+FF0E]), glyphcol(cjksc, [．]), glyphcol(cjktc, [．]), glyphcol(cjkjp, [．]), glyphcol(cjkkr, [．])),
  (ucode([U+FF1A]), glyphcol(cjksc, [：]), glyphcol(cjktc, [：]), glyphcol(cjkjp, [：]), glyphcol(cjkkr, [：])),
  (ucode([U+FF1B]), glyphcol(cjksc, [；]), glyphcol(cjktc, [；]), glyphcol(cjkjp, [；]), glyphcol(cjkkr, [；])),
  (ucode([U+FF1F]), glyphcol(cjksc, [？]), glyphcol(cjktc, [？]), glyphcol(cjkjp, [？]), glyphcol(cjkkr, [？])),
).map(r => (r.at(0), r.at(1), r.at(2), r.at(3), r.at(4))))
#v(8pt)

Included in the #lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/Resources/")[Resources] folder of the release branch of this open source project are the raw (aka human-readable, with one mapping per line) UTF-32 mapping files—named _utf32-cn.map_, _utf32-tw.map_, _utf32-hk.map_, _utf32-jp.map_, and _utf32-kr.map_—that are used to compile the UTF-32 CMap resources—named _UniSourceHanSansCN-UTF32-H_, _UniSourceHanSansTW-UTF32-H_, _UniSourceHanSansHK-UTF32-H_, _UniSourceHanSansJP-UTF32-H_, and _UniSourceHanSansKR-UTF32-H, respectively_—that the #lnk("https://github.com/adobe-type-tools/afdko/")[AFDKO] _makeotf_ tool uses to generate the Format 12 (UTF-32) ‘cmap’ subtables. Also included in this project are the raw UTF-32 mapping files—named _utf32hw-cn.map_, _utf32hw-tw.map_, _utf32hw-hk.map_, _utf32hw-jp.map_, and _utf32hw-kr.map_—that are used to compile the UTF-32 CMap resources that map ASCII (U+0020 through U+007E), U+00A0 ( ), U+00A5 (¥), U+00AD (‑), U+2011 (‑), U+20A9 (₩), and U+2423 (␣) to half-width forms—named _UniSourceHanSansHWCN-UTF32-H_, _UniSourceHanSansHWTW-UTF32-H_, _UniSourceHanSansHWHK-UTF32-H_, _UniSourceHanSansHWJP-UTF32-H_, and _UniSourceHanSansHWKR-UTF32-H_.

Matching UTF-16 CMap resources, which should not be used to build the OpenType/CFF fonts, are provided in the #lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/Resources/")[Resources] folder of the release branch of this open source project for good measure.

#h2[Unicode Coverage]

In addition to complete URO (_Unified Repertoire & Ordering_; up through U+9FFF for
#lnk("https://www.unicode.org/versions/Unicode14.0.0/")[Unicode Version 14.0]), Extension A, and
modern hangul syllable coverage, the 65,535-glyph font resources completely cover the following
256-character Unicode blocks: U+00_xx_, U+11_xx_, U+2F_xx_ through U+33_xx_ (except for U+332C),
U+D7_xx_, U+FF_xx_, U+1F1_xx_ (except for U+1F1E6 through U+1F1FF), and U+1F2_xx_ (except for
U+1F260 through U+1F265).

#h2[Unicode Variation Sequences]

All font resources include 24 SVSes (_Standardized Variation Sequences_) that correspond to eight
full-width CJK punctuation characters and four General punctuation characters, and can be used to
explicitly invoke them, thereby overriding the default glyphs. These SVSes were included in
#lnk("https://www.unicode.org/versions/Unicode12.0.0/")[Unicode Version 12.0] (2019) and
#lnk("https://www.unicode.org/versions/Unicode12.0.0/")[Unicode Version 16.0] (2024). The table
below lists these SVSes and the glyphs that correspond to them:

#let svs1 = (c1, g, c2) => table.cell(align: center, bg(c1) + gm24(g) + bg(c2))
#table(
  columns: (107.8pt, 107.7pt, 107.7pt, 107.7pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    hcl([Unicode]),
    hc([VS1 (U+FE00)—Corner-Justified Form]),
    hc([VS2 (U+FE01)—Centered Form]),
  ),
  ucode([U+3001]), svs1([あ汉], [、︀], [汉あ]), svs1([永], [、︁], [永]),
  ucode([U+3002]), svs1([あ汉], [。︀], [汉あ]), svs1([永], [。︁], [永]),
  ucode([U+FF01]), svs1([汉], [！︀], [汉]), svs1([あ永], [！︁], [永あ]),
  ucode([U+FF0C]), svs1([あ汉], [，︀], [汉あ]), svs1([永], [，︁], [永]),
  ucode([U+FF0E]), svs1([あ汉], [．︀], [汉あ]), svs1([永], [．︁], [永]),
  ucode([U+FF1A]), svs1([汉], [：︀], [汉]), svs1([あ永], [：︁], [永あ]),
  ucode([U+FF1B]), svs1([汉], [；︀], [汉]), svs1([あ永], [；︁], [永あ]),
  ucode([U+FF1F]), svs1([汉], [？︀], [汉]), svs1([あ永], [？︁], [永あ]),
)
#v(8pt)

The following 8 SVSes were added in Unicode 16.0:

#let svs1b = (c1, g, c2) => table.cell(align: center, text(size: 24pt, c1) + gm24(g) + text(size: 24pt, c2))
#let svs2b = (c1, g, c2) => table.cell(align: center, bg(c1) + gm24(g) + bg(c2))
#table(
  columns: (107.8pt, 215.3pt, 215.4pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    hcl([Unicode]),
    hc([VS1 (U+FE00)—Proportional Form]),
    hc([VS2 (U+FE01)—Full Width Form]),
  ),
  ucode([U+2018]), svs1b([X ], [‘], [ X]), svs2b([永], [‘], [永]),
  ucode([U+2019]), svs1b([X ], [’], [ X]), svs2b([永], [’], [永]),
  ucode([U+201C]), svs1b([X ], [“], [ X]), svs2b([永], [“], [永]),
  ucode([U+201D]), svs1b([X ], [”], [ X]), svs2b([永], [”], [永]),
)
#v(8pt)

The use of these SVSes is meant as a “plain text” alternative to language-tagging in order to
achieve the same results, which means that subsequent language-tagging of such text, explicit or
otherwise, will override the results in potentially unpredictable ways. In other words, these SVSes
should be considered a last-resort means of displaying particular forms of these full-width CJK
punctuation characters. Also see the table that starts on page 26 to learn how these eight
full-width CJK punctuation characters are expected to behave in vertical writing mode.

Each Simplified Chinese font and font instance additionally includes nine SVSes that correspond to
nine of the 1,002 Standardized Variants that were introduced in Unicode Version 6.3. Six of these
SVSes are default (directly encoded). 18 of its 33 total UVSes are default, and the remaining 15 are
non-default. The provided _SourceHanSans_CN_sequences.txt_ file specifies the UVSes.

Each Traditional Chinese (Taiwan) font and font instance additionally includes two SVSes that
correspond to two of the 1,002 Standardized Variants that were introduced in Unicode Version 6.3.
Both of these SVSes are default (directly encoded). 14 of its 26 total UVSes are default, and the
remaining 12 are non-default. The provided _SourceHanSans_TW_sequences.txt_ file specifies the
UVSes.

Each Traditional Chinese (Hong Kong) font and font instance additionally includes 14 SVSes that
correspond to 14 of the 1,002 Standardized Variants that were introduced in Unicode Version 6.3.
24 of its 38 total UVSes are default, and the remaining 14 are non-default. The provided
_SourceHanSans_HK_sequences.txt_ file specifies the UVSes.

All IVSes from the registered #lnk("https://github.com/adobe-type-tools/Adobe-Japan1/")[Adobe-Japan1 IVD Collection]—except for \<6CE8 E0102\> (Adobe-Japan1-6 CID+12869), which is excluded because it is outside the scope of the _Source Han Sans_ glyph set—are specified in the Format 14 ‘cmap’ subtable of each Japanese font and font instance, along with 89 of the 1,002 Standardized Variants that were introduced in Unicode Version 6.3. This means that 14,682 _Adobe-Japan1_ IVSes and 113 SVSes are included. 13,322 of these UVSes are default, meaning that the glyph is directly encoded, and the remaining 1,473 are non-default (unencoded or encoded in a CJK Compatibility Ideograph block, at least for Japanese fonts and font instances). The provided _SourceHanSans_JP_sequences.txt_ file specifies the UVSes.

Each Korean font and font instance additionally includes 270 SVSes that correspond to 270 of the
1,002 Standardized Variants that were introduced in Unicode Version 6.3. All of these SVSes are
default (directly encoded). The 36 IVSes from the registered
#lnk("https://www.unicode.org/ivd/krname/")[KRName IVD Collection] are also supported. 299 of its
330 total UVSes are default, and the remaining 31 are non-default. The provided
_SourceHanSans_KR_sequences.txt_ file specifies the UVSes.

// ----- Glyph Sharing Statistics ----------------------------------------
#h2[Glyph Sharing Statistics]

One of the defining characteristics of Pan-CJK typeface designs is the significant sharing of
glyphs across its supported languages. However, in order to honor regional conventions, some code
points, in particular those for ideographs, may require more than one glyph per code point. Of
course, the URO exhibits the greatest variation, in terms of including a large number of code
points that require multiple language-specific glyphs. In general, as one progresses through the
CJK Unified Ideograph extensions, from Extension A through Extension G, the number of code points
that require multiple language-specific glyphs diminishes.

The table below lists several code point categories, and shows how many glyphs are used to
represent the 44,813 code points:

#let stat-row = (n, fill: none, ..vals) => {
  let c = if fill == none { it => table.cell(align: center + top, it) } else { it => table.cell(fill: fill, align: center + top, it) }
  (
    c(n),
    c(vals.at(0)), c(vals.at(1)), c(vals.at(2)), c(vals.at(3)), c(vals.at(4)), c(vals.at(5)), c(vals.at(6)), c(vals.at(7)), c(vals.at(8)),
  )
}
#table(
  columns: (25.6pt, 25.5pt, 54.1pt, 54.2pt, 54.2pt, 54.1pt, 54.2pt, 54.1pt, 54.2pt, 54.2pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    table.cell(rowspan: 2, fill: hdrgray, align: center, rot([Glyphs])),
    table.cell(rowspan: 2, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [URO])),
    table.cell(colspan: 7, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [CJK Unified Ideograph Extensions])),
    table.cell(rowspan: 2, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Other])),
    table.cell(fill: hdrgray, align: center, [A]),
    table.cell(fill: hdrgray, align: center, [B]),
    table.cell(fill: hdrgray, align: center, [C]),
    table.cell(fill: hdrgray, align: center, [D]),
    table.cell(fill: hdrgray, align: center, [E]),
    table.cell(fill: hdrgray, align: center, [F]),
    table.cell(fill: hdrgray, align: center, [G]),
  ),
  ..stat-row([1], [8,815], [6,131], [2,081], [48], [34], [113], [6], [2], [14,715]),
  ..stat-row([2], [7,639], [449], [28], [none], [none], [none], [none], [none], [193]),
  ..stat-row([3], [3,731], [12], [none], [none], [none], [none], [none], [none], [47]),
  ..stat-row([4], [738], [none], [none], [none], [none], [none], [none], [none], [2]),
  ..stat-row([5], fill: hlblue, [69], [none], [none], [none], [none], [none], [none], [none], [none]),
)
#v(8pt)

Of particular interest should be the 69 highlighted URO code points that have five unique glyphs,
one per language. The table below shows these 69 ideographs for each of the five supported
languages:

#let hanzi4 = (f, lang) => {
  table.cell(align: center,
    text(size: 23pt, font: f, weight: 400,
      [傑僭割劘匾叟喝塌姿嬴幰廋扇扉搨摩榻溲] + linebreak() +
      [潛瀛瘦瞎磨窖竇箭篠簉糙綢繭纛羸翁翦翩] + linebreak() +
      [肓臝艘花裯褐謁譖豁贏轄返迷途造週遍遭] + linebreak() +
      [選遼鄰釁閼雕靠靡颼飯驎鬣魔麗麟]),
  )
}
#table(
  columns: (99.3pt, 439.2pt),
  inset: 6pt,
  stroke: 0.6pt,
  table.cell(align: center, rot([Simplified\ Chinese])), hanzi4(cjksc, [SC]),
  table.cell(align: center, rot([Traditional\ Chinese—\ Taiwan])), hanzi4(cjktc, [TC]),
  table.cell(align: center, rot([Traditional\ Chinese—\ Hong\ Kong])), hanzi4(cjkck, [HK]),
  table.cell(align: center, rot([Japanese])), hanzi4(cjkjp, [JP]),
  table.cell(align: center, rot([Korean])), hanzi4(cjkkr, [KR]),
)
#v(8pt)

The #lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/Resources/")[Resources] folder in the release branch of this open source project includes a two-sheet and six-column spreadsheet, named _region-map.xlsx_, which shows the glyphs that are used for each code point. The first sheet covers the URO (U+4E00 through U+9FFF), and the second one covers Extension A (U+3400 through U+4DBF). In order to make clear whether a glyph is shared, and with what language or languages, the primary language of the glyph is shown instead of the glyph itself. For only the KR, TW, and HK columns, if a code point is outside the scope of the KS standards, Big Five, or Big Five plus HKSCS-2016, respectively, a “\#” is shown after the region code to indicate that the code point is outside the scope of those particular standards. The same data is also provided in “plain text” (UTF-8) format as the file named _region-map-utf8.txt_.

#h2["UAX #50 Compliance"]

_Source Han Sans_ is one of the first font implementations that is compliant with
#lnk("http://www.unicode.org/reports/tr50/")["UAX #50"] (Unicode Vertical Text Layout). Only the
substitutions in the ‘vert’ GSUB feature are expected to be used, and the ‘vrt2’ GSUB feature,
which is a subset of the ‘vert’ GSUB feature, is included only because some environments, such as
Windows and some Microsoft applications, require it to be present. In particular, pre-rotated
non–full-width glyphs have been excluded from the ‘vrt2’ GSUB feature, and substitutions for
arrows and arrow-like characters have also been excluded from both GSUB features.

// =====================================================================
// Language Particulars
// =====================================================================
#h1[Language Particulars]

#h2[Simplified Chinese: GB 18030 & Tōngyòng Guīfàn Hànzìbiǎo]

In addition to supporting GB 18030 2022 Implementation Level 2, which primarily amounts to
Simplified Chinese glyphs for all URO and Extension A code points plus six Extension B code
points, China’s latest list of 8,105 hanzi
(#lnk("http://www.gov.cn/zwgk/2013-08/19/content_2469793.htm")[通用规范汉字表] _Tōngyòng Guīfàn Hànzìbiǎo_),
which includes 196 additional Extension B through E code points is also supported. Among these 196
hanzi, 36 map to Extension B, 44 map to Extension C, eight map to Extension D, and 108 map to
Extension E. Note: Although GB 18030 2022 moved the remaining URO and Extension A characters from
Level 2 to Level 3, _Source Han_ includes the all URO and Extension A code points.

#h2[Traditional Chinese—Taiwan: Big Five + CNS 11643 Planes 1 & 2]

There are separate Traditional Chinese fonts and font instances for Taiwan and Hong Kong. The scope
of Traditional Chinese for Taiwan is limited to Big Five (equivalent to CNS 11643 Planes 1 and 2),
and the glyphs mostly adhere to the
#lnk("http://language.moe.gov.tw/001/Upload/files/SITE_CONTENT/M0001/FANGTI/fangying.htm")[Taiwan MOE (Ministry of Education) glyph standard].
Any CJK Unified Ideograph code point that is outside the scope of Big Five is not likely to display
appropriately for Traditional Chinese (Taiwan) use.

#h2[Traditional Chinese—Hong Kong: Big Five & HKSCS-2016]

The Traditional Chinese (Hong Kong) fonts and font instances include as their scope Big Five and
HKSCS-2016, with the glyphs for both mostly adhering to Hong Kong conventions.

#h2[Japanese: Adobe-Japan1-6 Correspondence Table & JIS Coverage]

The _aj16-kanji.txt_ mapping file that is provided in the
#lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/Resources/")[Resources] folder
of the release branch of this open source project shows how all
#lnk("https://github.com/adobe-type-tools/Adobe-Japan1/")[Adobe-Japan1-6] kanji map to working
glyph names as specified in the fourth field of the included _AI0-SourceHanSans_ ordering file. In
order to support the Adobe-Japan1 IVD Collection, glyphs for all Adobe-Japan1-6 kanji—except for
\<6CE8 E0102\> (Adobe-Japan1-6 CID+12869), which is excluded because it is outside the scope of the
_Source Han Sans_ glyph set—are included.

Due to the JIS standard coverage of Adobe-Japan1-6 that is inherited by _Source Han Sans_, all
#lnk("https://webdesk.jsa.or.jp/books/W11M0090/index/?bunsyo_id=JIS%20X%200208:1997/AMENDMENT%201:2012")[JIS X 0208],
#lnk("https://webdesk.jsa.or.jp/books/W11M0090/index/?bunsyo_id=JIS%20X%200213:2000/AMENDMENT%202:2012")[JIS X 0213],
and #lnk("https://webdesk.jsa.or.jp/books/W11M0090/index/?bunsyo_id=JIS%20X%200212:1990")[JIS X 0212] kanji are therefore supported.
#lnk("https://webdesk.jsa.or.jp/books/W11M0090/index/?bunsyo_id=JIS%20X%200213:2000/AMENDMENT%201:2004")[JIS X 0213:2004] (aka JIS2004) glyphs are the default for the relevant code points. A small number of characters in the JIS standards, such as those for IPA, along with additional Latin, Greek, and Cyrillic that were not deemed necessary, have been intentionally excluded.

Although _Source Han Sans_ includes the same kanji as Adobe-Japan1-6, including a large number of
kanji variants, compatibility shouldn’t be expected for documents that were authored using
applications that specify glyphs by CID. The only Adobe-Japan1-6 compatibility that should be
expected is at the Unicode level, which includes the Adobe-Japan1 IVSes that are specified in the
Format 14 ‘cmap’ subtable.

#h2[Korean: Hangul Glyphs & Hanja Coverage]

Glyphs for all modern Korean hangul symbols, letters (including compatibility versions), and
syllables are included, along with the additional glyphs necessary to compose archaic hangul via
the ‘ljmo’, ‘vjmo’, and ‘tjmo’ GSUB features. Also included are glyphs for 500 high-frequency
archaic hangul syllables in pre-composed form, which are made accessible via the ‘ccmp’ GSUB
feature.

While the horizontal advances of the glyphs for Korean hangul symbols (in the U+32xx block) are
full-width (1000 units), those for Korean hangul letters and syllables are monospaced at 920 units.

The _ks-hanja.txt_ mapping file that is provided in the
#lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/Resources/")[Resources] folder
of the release branch of this open source project shows how the hanja in the
#lnk("https://www.kssn.net/search/stddetail.do?itemNo=K001010102764")[KS X 1001] (4,620) and
#lnk("https://www.kssn.net/search/stddetail.do?itemNo=K001010118206")[KS X 1002] (2,856) standards
map to working glyph names as specified in the fourth field of the included _AI0-SourceHanSans_
ordering file.

// =====================================================================
// Proportional & Half-Width CJK Punctuation
// =====================================================================
#h2[Proportional & Half-Width CJK Punctuation]

Included in these fonts are special forms of the proportional and half-width punctuation shown in
the table below, which have been tailored for CJK use in that they are aligned to the em-box, not
to Latin features, and which are accessible via the ‘locl’ GSUB feature:

#let punct = (u, prop, half, cn: none, jp: none, kr: none) => {
  let arrow = (a, b) => gm(a) + text(size: 18pt, [ → ]) + gm(b)
  let yn = it => if it == none { none } else { [Yes] }
  (
    ucode(u),
    table.cell(align: center, if prop == none { none } else { arrow(prop.at(0), prop.at(1)) }),
    table.cell(align: center, if half == none { none } else { arrow(half.at(0), half.at(1)) }),
    table.cell(align: center + top, yn(cn)),
    table.cell(align: center + top, yn(jp)),
    table.cell(align: center + top, yn(kr)),
  )
}
#table(
  columns: (70.9pt, 151pt, 150.9pt, 55.2pt, 55.3pt, 55.2pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    table.cell(rowspan: 2, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Unicode])),
    table.cell(colspan: 2, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Western versus CJK])),
    table.cell(rowspan: 2, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Chinese])),
    table.cell(rowspan: 2, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Japanese])),
    table.cell(rowspan: 2, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Korean])),
    table.cell(fill: hdrgray, align: center, [Proportional]),
    table.cell(fill: hdrgray, align: center, [Half-Width¹]),
  ),
  ..punct([U+0020],  (" ", " "),   none,  cn:  [Yes]),
  ..punct([U+0021],  ("!", "！"),  ("!", "！"),  cn:  [Yes]),
  ..punct([U+0022],  ("\"", "＂"),  ("\"", "＂"),  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0027],  ("'", "＇"),  ("'", "＇"),  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0028],  ("(", "（"),  ("(", "（"),  cn:  [Yes]),
  ..punct([U+0029],  (")", "）"),  (")", "）"),  cn:  [Yes]),
  ..punct([U+002C],  (",", "，"),  (",", "，"),  cn:  [Yes]),
  ..punct([U+002D],  ("-", "－"),  ("-", "－"),  cn:  [Yes]),
  ..punct([U+002E],  (".", "．"),  (".", "．"),  cn:  [Yes]),
  ..punct([U+002F],  ("/", "／"),  ("/", "／"),  cn:  [Yes]),
  ..punct([U+0030²],  ("0", "０"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0031²],  ("1", "１"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0032²],  ("2", "２"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0033²],  ("3", "３"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0034²],  ("4", "４"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0035²],  ("5", "５"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0036²],  ("6", "６"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0037²],  ("7", "７"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0038²],  ("8", "８"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+0039²],  ("9", "９"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+003A],  (":", "："),  (":", "："),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+003B],  (";", "；"),  (";", "；"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+003F],  ("?", "？"),  ("?", "？"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+005B],  ("[", "［"),  ("[", "［"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+005D],  ("]", "］"),  ("]", "］"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+007B],  ("{", "｛"),  ("{", "｛"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+007D],  ("}", "｝"),  ("}", "｝"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+007E],  ("~", "～"),  ("~", "～"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+00AD],  ("-", "‑"),  ("-", "‑"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+00B7],  ("·", "・"),   none,  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+2011],  ("-", "‑"),  ("-", "‑"),  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+2013],  ("–", "–"),   none,  cn:  none,  jp:  none,  kr:  [Yes]),
  ..punct([U+2014],  ("—", "—"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2018],  ("‘", "‘"),   none,  cn:  [Yes³],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2019],  ("’", "’"),   none,  cn:  [Yes³],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+201A],  ("‚", "‚"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+201C],  ("“", "“"),   none,  cn:  [Yes³],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+201D],  ("”", "”"),   none,  cn:  [Yes³],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+201E],  ("„", "„"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2026²],  ("…", "…"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+203C],  ("‼", "‼"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2047],  ("⁇", "⁇"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2048],  ("⁈", "⁈"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2049],  ("⁉", "⁉"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2E3A],  ("⸺", "⸺"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
  ..punct([U+2E3B],  ("⸻", "⸻"),   none,  cn:  [Yes],  jp:  [Yes],  kr:  [Yes]),
)
#v(2pt)

#text(size: 10pt)[
#super(text(size: 8pt, fill: black)[1]) The half-width glyphs are not encoded by default, except for the Regular and Bold OTFs and OTC font instances that include the “HW” identifier in their names, and are accessible via the ‘hwid’ GSUB feature in all OTFs and OTC font instances .

#super(text(size: 8pt)[2]) These characters are unique in that the CJK forms are encoded by default, and the Western forms are accessible when the text is language-tagged for English.

#super(text(size: 8pt)[3]) The default glyph for this code point is full-width, not proportional, so the ‘pwid’ GSUB feature must first be invoked to access the proportional glyph that is tailored for CJK use.
]

// =====================================================================
// OpenType Particulars
// =====================================================================
#h1[OpenType Particulars]

#h2[Menu Names]

The table below shows the English and localized Family names for each font and font instance:

#let menul = (..txt) => table.cell(align: left + top, ..txt)
#let menuen = (..txt) => table.cell(align: left + top, text(size: 12pt, style: "italic", ..txt))
#let menuloc = (..txt) => table.cell(align: left + top, text(size: 14pt, ..txt))
#table(
  columns: (179.6pt, 179.5pt, 179.4pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    hcl([Configuration]),
    hc([Family Name—English]),
    hc([Family Name—Localized]),
  ),
  menul(rowspan: 2, [Simplified Chinese OTF & OTC]), menuen([Source Han Sans SC]), menuloc([思源黑体]),
  menuen([Source Han Sans HW SC]), menuloc([思源黑体 HW]),
  menul(rowspan: 2, [Traditional Chinese OTF & OTC—Taiwan]), menuen([Source Han Sans TC]), menuloc([思源黑體]),
  menuen([Source Han Sans HW TC]), menuloc([思源黑體 HW]),
  menul(rowspan: 2, [Traditional Chinese OTF & OTC—Hong Kong]), menuen([Source Han Sans HC]), menuloc([思源黑體 香港]),
  menuen([Source Han Sans HW HC]), menuloc([思源黑體 香港 HW]),
  menul(rowspan: 2, [Japanese OTF & OTC]), menuen([Source Han Sans]), menuloc([源ノ角ゴシック]),
  menuen([Source Han Sans HW]), menuloc([源ノ角ゴシック HW]),
  menul(rowspan: 2, [Korean OTF & OTC]), menuen([Source Han Sans K]), menuloc([본고딕]),
  menuen([Source Han Sans HW K]), menuloc([본고딕 HW]),
  menul([Simplified Chinese OTF (subset)]), menuen([Source Han Sans CN]), menuloc([思源黑体 CN]),
  menul([Traditional Chinese OTF (subset)—Taiwan]), menuen([Source Han Sans TW]), menuloc([思源黑體 TW]),
  menul([Traditional Chinese OTF (subset)—Hong Kong]), menuen([Source Han Sans HK]), menuloc([思源黑體 HK]),
  menul([Japanese OTF (subset)]), menuen([Source Han Sans JP]), menuloc([源ノ角ゴシック JP]),
  menul([Korean OTF (subset)]), menuen([Source Han Sans KR]), menuloc([본고딕 KR]),
  menul(rowspan: 2, [Simplified Chinese Variable OTF & OTC]), menuen([Source Han Sans SC VF]), menuloc([思源黑体 VF]),
  menuen([Source Han Sans HW SC VF]), menuloc([思源黑体 HW VF]),
  menul(rowspan: 2, [Traditional Chinese Variable OTF & OTC—Taiwan]), menuen([Source Han Sans TC VF]), menuloc([思源黑體 VF]),
  menuen([Source Han Sans HW TC VF]), menuloc([思源黑體 HW VF]),
  menul(rowspan: 2, [Traditional Chinese Variable OTF & OTC—Hong Kong]), menuen([Source Han Sans HC VF]), menuloc([思源黑體 香港 VF]),
  menuen([Source Han Sans HW HC VF]), menuloc([思源黑體 香港 HW VF]),
  menul(rowspan: 2, [Japanese Variable OTF & OTC]), menuen([Source Han Sans VF]), menuloc([源ノ角ゴシック VF]),
  menuen([Source Han Sans HW VF]), menuloc([源ノ角ゴシック HW VF]),
  menul(rowspan: 2, [Korean Variable OTF & OTC]), menuen([Source Han Sans K VF]), menuloc([본고딕 VF]),
  menuen([Source Han Sans HW K VF]), menuloc([본고딕 HW VF]),
  menul([Simplified Chinese Variable OTF (subset)]), menuen([Source Han Sans CN VF]), menuloc([思源黑体 CN VF]),
  menul([Traditional Chinese Variable OTF (subset)—Taiwan]), menuen([Source Han Sans TW VF]), menuloc([思源黑體 TW VF]),
  menul([Traditional Chinese Variable OTF (subset)—Hong Kong]), menuen([Source Han Sans HK VF]), menuloc([思源黑體 HK VF]),
  menul([Japanese Variable OTF (subset)]), menuen([Source Han Sans JP VF]), menuloc([源ノ角ゴシック JP VF]),
  menul([Korean Variable OTF (subset)]), menuen([Source Han Sans KR VF]), menuloc([본고딕 KR VF]),
)
#v(8pt)

For the region-specific subset OTFs, the English and localized menu names also include two-letter
region identifiers. Their PostScript names, as shown in the table in the “Font Resources” section
on page 5, use the same two-letter region identifiers. With the exception of Japanese, the
language-specific OTFs and OTCs include a one- or two-letter language identifier only for their
English menu names.

The Regular weight in all fonts and font instances is style-linked to the Bold weight. For
applications that support style-linking, the Regular weight becomes the Bold weight if the “Bold”
style is selected, and the Bold weight may not appear in the font menu.

#remark[
Because the OTCs and the corresponding language-specific OTFs specify identical PostScript and
Family names, they cannot be installed in the same environment.
]

#h2[OpenType Tables]

All font resources, with the exception of the OTCs, include the following 17 OpenType tables:
‘BASE’, ‘CFF ‘, ‘DSIG’, ‘GDEF’, ‘GPOS’, ‘GSUB’, ‘OS/2’, ‘VORG’, ‘cmap’, ‘head’, ‘hhea’, ‘hmtx’,
‘maxp’, ‘name’, ‘post’, ‘vhea’, and ‘vmtx’. The OTCs do not include a ‘DSIG’ table.

The five or ten font instances in each of the seven OTCs share the following ten OpenType tables:
‘BASE’, ‘CFF ‘, ‘GDEF’, ‘VORG’, ‘hhea’, ‘hmtx’, ‘maxp’, ‘post’, ‘vhea’, and ‘vmtx’. The following
six OpenType tables are not completely shared by the five or ten font instances in each OTC:
‘GPOS’, ‘GSUB’, ‘OS/2’, ‘cmap’, ‘head’, and ‘name’. The Super OTC shares OpenType tables more
efficiently.

#h2[OpenType Table Overrides]

Several values in particular OpenType tables have been overridden from their otherwise default
values. The subsections below detail some of the more important table-specific overrides that have
been applied.

#h3[The ‘OS/2’ Table]

The _OS/2.sTypoLineGap_ value has been set to 0 (zero) units, and is also reflected in the
_hhea.LineGap_ and _vhea.lineGap_ values. The _OS/2.usWinAscent_ and _OS/2.usWinDescent_ values
have been calculated by removing excessively tall and other vertical-only glyphs—for U+2E3A,
U+2E3B, U+302A through U+302D, U+3031, and U+3032—from the equation, and have been harmonized
across all seven weights. These same harmonized settings are also reflected in the
_hhea.Ascender_ and _hhea.Descender_ values. This is for the benefit of applications that use
these values for determining default leading. These and other ‘OS/2’ table settings are intended
to provide consistent cross-platform line spacing (aka vertical metrics).

#h3[The ‘name’ Table]

Unlike mainstream OpenType/CFF CJK fonts, a name.ID=20 string is not specified because there are no
legacy (non-Unicode) encodings that meaningfully correspond to these fonts. In addition, the ‘name’
table does not include any Macintosh (PlatformID=1) strings, which was accomplished by invoking the
#lnk("https://github.com/adobe-type-tools/afdko/")[AFDKO] _makeotf_ tool’s “-omitMacNames” command-line option.
This means that the ‘name’ table includes only Unicode strings.

#h3[The ‘vmtx’ Table]

In addition to specifying alternate vertical origins for full-width Latin and Latin-like glyphs
that rest on the Latin baseline, proper vertical origins and vertical advances are also specified
for the glyphs that correspond to U+3031 and U+3032, and to the vertical forms of U+02D9, U+2E3A,
U+2E3B, U+302E, and U+302F.

#h2[OpenType GSUB Features]

All fonts and font instances include the OpenType GSUB features (see the
#lnk("https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist")[OpenType Feature Registry] for additional information) as detailed in the table below:

#let gsub-name = (..txt) => table.cell(align: left + top, text(size: 11pt, font: mono, ..txt))
#let gsub-yes = it => table.cell(align: center + top, if it == none { none } else { [Yes] })
#let gsub-row = (n, ys) => (gsub-name(n), (for y in ys { gsub-yes(y) }))
#table(
  columns: (85.1pt, 45.4pt, 45.4pt, 45.3pt, 45.4pt, 45.4pt, 45.4pt, 45.4pt, 45.4pt, 45.4pt, 45.4pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    table.cell(rowspan: 2, fill: hdrgray, align: left + top, text(size: 11pt, weight: 600, [GSUB Feature])),
    table.cell(colspan: 5, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [OTF & OTC])),
    table.cell(colspan: 5, fill: hdrgray, align: center, text(size: 11pt, weight: 600, [Subset OTF])),
    (for s in ("SC", "TC", "HC", "J", "K", "CN", "TW", "HK", "JP", "KR") {
      table.cell(fill: hdrgray, align: center, text(size: 11pt, weight: 600, s))
    }),
  ),
  ..gsub-row([aalt], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row([calt], ([Yes], [Yes], [Yes], [Yes], [Yes], none, none, none, none, [Yes])),
  ..gsub-row([ccmp], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row([dlig], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row(["fwid¹"], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row([hist], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row(["hwid¹"], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row(["jp78¹"], (none, none, none, [Yes], none, none, none, none, [Yes], none)),
  ..gsub-row(["jp83¹"], (none, none, none, [Yes], none, none, none, none, [Yes], none)),
  ..gsub-row(["jp90¹"], (none, none, none, [Yes], none, none, none, none, [Yes], none)),
  ..gsub-row([liga], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row([ljmo], ([Yes], [Yes], [Yes], [Yes], [Yes], none, none, none, none, [Yes])),
  ..gsub-row([locl], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row(["nlck¹"], (none, none, none, [Yes], none, none, none, none, [Yes], none)),
  ..gsub-row(["pwid¹"], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row(["ruby¹"], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row([tjmo], ([Yes], [Yes], [Yes], [Yes], [Yes], none, none, none, none, [Yes])),
  ..gsub-row(["vert¹"], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
  ..gsub-row([vjmo], ([Yes], [Yes], [Yes], [Yes], [Yes], none, none, none, none, [Yes])),
  ..gsub-row(["vrt2²"], ([Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes])),
)
#v(2pt)

#text(size: 10pt)[
#super(text(size: 8pt)[1]) This GSUB feature is inherited by the ‘aalt’ GSUB feature.

#super(text(size: 8pt)[2]) This GSUB feature is a subset—not superset, as is usually the case—of the ‘vert’ GSUB feature.
]
#v(4pt)

All fonts and font instances that include hangul letters or syllables include a Korean-specific
glyph for the space character (U+0020), whose width is set to 280 units for all weights. The width
of the proportional glyph for the space character ranges from 220 units (in ExtraLight) to 229
units (in Heavy) in all fonts and font instances, except for the half-width fonts and font
instances that include the “HW” identifier in their names and whose space glyph is 500 units. A
contextual substitution in the ‘calt’ GSUB feature substitutes the proportional space glyph with
the Korean-specific version only when it is surrounded by a hangul syllable (modern or archaic),
regardless of whether it is pre-composed or combining.

#h3[The ‘ccmp’ GSUB Feature]

The ‘ccmp’ GSUB feature is used to form the appropriate glyphs that correspond to the sequences
needed to support a small number of kana, many of which are included in JIS X 0213 but are
intentionally unencoded, along with the 500 high-frequency pre-composed archaic hangul syllables.
PDF specimens for the latter can be found in the
#lnk("https://github.com/adobe-fonts/source-han-sans/tree/release/GlyphComplements")[GlyphComplements] folder of the release branch of this open source project, specifically on pp 911 through 923 of each glyph synopsis PDF. A complete listing of the former is provided in the table below:

#let ccmp-row = (seq, glyph, yes: none) => (
  ucode(seq),
  table.cell(align: left + top, text(size: 18pt, glyph)),
  table.cell(align: left + top, if yes == none { none } else { [Yes] }),
)
#table(
  columns: (179.6pt, 179.5pt, 179.4pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(hcl([Unicode Sequence]), hc([Glyph]), hcl([Present in JIS X 0213])),
  ..ccmp-row(["\<004D 0300\>], ["M̀"]),
  ..ccmp-row(["\<004D 0304\>], ["M̄"]),
  ..ccmp-row(["\<006D 0300\>], ["m̀"]),
  ..ccmp-row(["\<006D 0304\>], ["m̄"]),
  ..ccmp-row(["\<00CA 0304\>], ["Ê̄"]),
  ..ccmp-row(["\<00CA 030C\>], ["Ê̌"]),
  ..ccmp-row(["\<00EA 0304\>], ["ê̄"]),
  ..ccmp-row(["\<00EA 030C\>], ["ê̌"]),
  ..ccmp-row(["\<3042 3099\>], ["あ゙"]),
  ..ccmp-row(["\<3044 3099\>], ["い゙"]),
  ..ccmp-row(["\<3048 3099\>], ["え゙"]),
  ..ccmp-row(["\<304A 3099\>], ["お゙"]),
  ..ccmp-row(["\<304B 309A\>], ["か゚"], yes: [Yes]),
  ..ccmp-row(["\<304D 309A\>], ["き゚"], yes: [Yes]),
  ..ccmp-row(["\<304F 309A\>], ["く゚"], yes: [Yes]),
  ..ccmp-row(["\<3051 309A\>], ["け゚"], yes: [Yes]),
  ..ccmp-row(["\<3053 309A\>], ["こ゚"], yes: [Yes]),
  ..ccmp-row(["\<3093 3099\>], ["ん゙"]),
  ..ccmp-row(["\<30A2 3099\>], ["ア゙"]),
  ..ccmp-row(["\<30A4 3099\>], ["イ゙"]),
  ..ccmp-row(["\<30A8 3099\>], ["エ゙"]),
  ..ccmp-row(["\<30AA 3099\>], ["オ゙"]),
  ..ccmp-row(["\<30AB 309A\>], ["カ゚"], yes: [Yes]),
  ..ccmp-row(["\<30AD 309A\>], ["キ゚"], yes: [Yes]),
  ..ccmp-row(["\<30AF 309A\>], ["ク゚"], yes: [Yes]),
  ..ccmp-row(["\<30B1 309A\>], ["ケ゚"], yes: [Yes]),
  ..ccmp-row(["\<30B3 309A\>], ["コ゚"], yes: [Yes]),
  ..ccmp-row(["\<30BB 309A\>], ["セ゚"], yes: [Yes]),
  ..ccmp-row(["\<30C4 309A\>], ["ツ゚"], yes: [Yes]),
  ..ccmp-row(["\<30C8 309A\>], ["ト゚"], yes: [Yes]),
  ..ccmp-row(["\<30F3 3099\>], ["ン゙"]),
  ..ccmp-row(["\<31F7 309A\>], [ㇷ゚], yes: [Yes]),
)
#v(8pt)

[
This GSUB feature is also used to support the two- and three-character sequences shown in the
table below:
]

#table(
  columns: (179.6pt, 89.7pt, 89.8pt, 179.4pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(hcl([Unicode Sequence]), hc([Unicode]), hc([Western Glyph]), hc([CJK Glyph])),
  ucode(["\<2014 2014 2014\>]), ucode([U+2E3B]), table.cell(align: left + top, gm([⸻])), table.cell([]),
  ucode(["\<2014 2014\>]), ucode([U+2E3A]), table.cell(align: left + top, gm([⸺])), table.cell([]),
  ucode(["\<2015 2015 2015\>]), ucode([U+2E3B]), table.cell([]), table.cell(align: left + top, gm([⸻])),
  ucode(["\<2015 2015\>]), ucode([U+2E3A]), table.cell([]), table.cell(align: left + top, gm([⸺])),
  ucode(["\<3033 3035\>]), ucode([U+3031]), table.cell([]), table.cell(align: left + top, text(size: 18pt, [〱])),
  ucode(["\<3034 3035\>]), ucode([U+3032]), table.cell([]), table.cell(align: left + top, text(size: 18pt, [〲])),
)
#v(8pt)

[
The glyphs that result from the first four sequences can be overridden, in terms of Western versus
CJK glyph style, by applying the ‘locl’ GSUB feature, which entails using an application that
supports this OpenType feature and properly language-tagging the text. These sequences merely serve
as a convenience mechanism for environments that do not support language tagging.
]

#h3[The ‘locl’ GSUB Feature]

[
The ‘locl’ GSUB feature plays a critical role in the language-specific OTFs in that it represents
the _only_ mechanism within the font resource for accessing the glyphs for the non-default
languages. If the ‘locl’ GSUB feature is not supported or not properly used, the default glyphs are
used. Each non-default language is handled via a separate lookup that is associated with the
appropriate language and script, and one of its purposes is to mimic the ‘cmap’ table of the target
language.

The font instances of the OTCs also include the ‘locl’ GSUB feature, but its presence represents an
alternate method for accessing the glyphs for the non-default languages that does not involve
selecting a different font instance of the OTC.

Note that in addition to using an application that supports the ‘locl’ GSUB feature, such as
#lnk("http://www.adobe.com/products/indesign.html")[Adobe InDesign] or modern browsers (examples
include Chrome, Edge, Firefox, and Safari), the text must also be properly language-tagged at the
character, paragraph, or document level.

Also note that all font resources, including the region-specific subset OTFs, include the ‘locl’
GSUB feature. For the region-specific subset OTFs that obviously do not include glyphs for the
ideographs of the non-supported regions, the ‘locl’ GSUB feature instead operates only on a small
number of glyphs for punctuation by tailoring them for CJK use. See the table in the
“Proportional & Half-Width CJK Punctuation” section on page 19 for a complete listing of these
special glyphs.
]

// ----- The 'vert' GSUB Feature ------------------------------------------
#h3[The ‘vert’ GSUB Feature]

[
The ‘vert’ GSUB feature includes substitutions that may be different for each language, which apply to the
following code points:
]

#let vg = (..g) => table.cell(align: center, gm(..g))
#let vp = (a, b) => gm(a) + [ → ] + gm(b)
#table(
  columns: (107.8pt, 107.7pt, 107.7pt, 107.7pt, 107.6pt),
  inset: 3pt,
  stroke: 0.6pt,
  table.header(
    hcl([Unicode]),
    hc([Simplified Chinese]),
    hc([Traditional Chinese]),
    hc([Japanese]),
    hc([Korean]),
  ),
  table.cell(align: left + top, text(size: 11pt, font: mono, [U+2018^1])), vp([‘], [﹁]), vp([‘], [‘]), vg([‘]), vg([‘]),
  table.cell(align: left + top, text(size: 11pt, font: mono, [U+2019^1])), vp([’], [﹂]), vp([’], [’]), vg([’]), vg([’]),
  table.cell(align: left + top, text(size: 11pt, font: mono, [U+201C^1])), vp([“], [﹃]), vp([“], [〝]), vg([“]), vg([“]),
  table.cell(align: left + top, text(size: 11pt, font: mono, [U+201D^1])), vp([”], [﹄]), vp([”], [〞]), vg([”]), vg([”]),
  ucode([U+3001]), vp([、], [︑]), vg([、]), vp([、], [︑]), vp([、], [︑]),
  ucode([U+3002]), vp([。], [︒]), vg([。]), vp([。], [︒]), vp([。], [︒]),
  ucode([U+FF01]), vp([！], [︕]), vg([！]), vg([！]), vp([！], [︕]),
  ucode([U+FF0C]), vp([，], [︐]), vg([，]), vp([，], [︐]), vp([，], [︐]),
  ucode([U+FF0E]), vp([．], [．]), vg([．]), vp([．], [．]), vp([．], [．]),
  ucode([U+FF1A]), vp([：], [︓]), vg([：]), vp([：], [：]), vp([：], [︓]),
  ucode([U+FF1B]), vp([；], [︔]), vg([；]), vg([；]), vp([；], [︔]),
  ucode([U+FF1F]), vp([？], [︖]), vg([？]), vg([？]), vp([？], [︖]),
)
#v(6pt)
#table(
  columns: (14pt, auto),
  stroke: none,
  table.cell(align: left + top, [1]),
  table.cell(align: left + top, [To achieve the same vertical substitution effect as Traditional Chinese for Japanese or Korean, the ‘fwid’ GSUB feature must first be applied to change the default proportional glyphs to their full-width forms.]),
)

// ----- OpenType GPOS Features --------------------------------------------
#h2[OpenType GPOS Features]

[
Eight GPOS features, ‘halt’, ‘kern’, ‘mark’, ‘palt’, ‘vert’, ‘vhal’, ‘vkrn’, and ‘vpal’, are included in all
font resources, and their details are listed below (see the
#lnk("https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist")[OpenType Feature Registry] for
additional information):
]

#set list(spacing: 2.8pt)
- The ‘halt’ and ‘vhal’ GPOS feature are identical across all weights.
- The ‘palt’ and ‘vpal’ GPOS features for ExtraLight through Medium are identical, as are those for Bold and Heavy. These features cover the glyphs for kana, some full-width punctuation, some full-width symbols, full-width digits, and full-width Latin.
- The ‘kern’ GPOS feature includes weight-specific kerning pairs for proportional Latin, Greek, and Cyrillic glyphs, along with weight-independent kerning pairs for kana and some punctuation. The ‘vkrn’ GPOS feature includes only weight-independent kerning pairs for kana and some punctuation.
- The ‘mark’ GPOS feature is used for handling bopomofo tone mark placement.
- The ‘vert’ GPOS feature is used to adjust the glyphs for U+20DD, U+20DE, U+302A through U+302D, U+3099, U+309A, U+3127, U+31B4 through U+31B7, U+31BB, and those that represent vowels and trailing consonants of combining jamo, which have zero-unit horizontal advances, such that their positions and vertical origins are appropriate for vertical writing.
#set list(spacing: 13.7pt)

// ----- Noto Sans CJK Differences ------------------------------------------
#h2[Noto Sans CJK Differences]

[
Other than by name, the fonts for the Google-branded version of this typeface design,
#lnk("https://github.com/googlefonts/noto-cjk/releases")[Noto Sans CJK], differ in the following ways:
]

#set list(spacing: 2.8pt)
- The _name.ID=0_ (_Copyright notice_) string does not include a reference to the “Source” name.
- The _name.ID=7_ (_Trademark_) string specifies a Google trademark.
- The _name.ID=11_ (_URL Vendor_) string specifies a Google URL.
- A _name.ID=12_ (_URL Designer_) string was added that specifies an Adobe URL.
- The PostScript names for each named instance in the variable fonts are the same as the static fonts.
- Although localized menu names are not specified, localized ‘name’ table strings are included, in terms of _name.IDs_ 1, 2, 4, 16, and 17, though the actual strings are identical to the English-language ones.
- The _OS/2.usWeightClass_ value is set to 100 for Thin (_Source Han Sans ExtraLight_ uses 250) per #lnk("https://github.com/googlefonts/noto-cjk/issues/86/")["Noto CJK Issue #86"].
- The _OS/2.achVendID_ tag is set to GOOG (_Source Han Sans_ uses ADBO).
- Although glyphs for U+2252 and U+25C8 are included, named _uni2252_ (CID+858) and _uni25C8_ (CID+1261), respectively, the Format 4 and 12 ‘cmap’ subtables do not include mappings for U+2252 and U+25C8, per #lnk("https://github.com/googlefonts/noto-cjk/issues/24")["Noto CJK Issue #24"] and #lnk("https://github.com/googlefonts/noto-cjk/issues/23")["Noto CJK Issue #23"], respectively.
#set list(spacing: 13.7pt)

// ----- Changes -------------------------------------------------------------
#let iss = n => lnk("https://github.com/adobe-fonts/source-han-sans/issues/" + str(n), "Issue #" + " " + str(n))

#h1[Changes]

#h2[Version 2.005]

Release Date: June 18, 2025.

Listed below are the changes that were made in this release:

#set list(spacing: 2.8pt)
- The copyright year was changed from “2014–2021” to “2014–2025.”
- Updated the Latin component with Source Sans v3.052.
- Mapped U+2E90 ⺐ to _u21BC1-HK_.
- Fixed incorrect stroke in uni91B1-JP 醱.
- Adjusted stroke in uni6414-JP 搔 and uni7CD4-JP 糔. #lnk("https://github.com/adobe-type-tools/Adobe-Japan1/issues/9")["Adobe Japan-1 Issue #9"]
- Added uni5EF3-HK 廳, uni5FB7-TW 德, and uni8EB2-HK 躲. Added uni7AE7-TW 竧 and mapped TW/HK to it. Removed uni5C04-TW 射, uni8EB0-HK 躰, uni8EB6-HK 躶, uni8EC3-HK 軃 and remapped to the corresponding JP glyph. #iss(233)
- Updated uni5AF3-TW 嫳, uni6583-TW 斃, uni7358-TW 獘, uni8E69-TW 蹩, and uni9F08-HK 鼈. #iss(244)
- Removed uni627D-TW 扽. #iss(247)
- Added u2A736-TW 𪜶 and u20895-TW 𠢕. #iss(251)
- Adjusted all enclosing glyphs to be consistent in size and use the same source components. #iss(298)
- Removed uni9051-KR 遑, uni968D-KR 隍. Mapped U+6F64 to uni6F64-JP 潤 in the KR CMap Resources. #iss(303)
- Updated glyph for u22ACF-HK 𢫏. #iss(311)
- Added glyphs for U+2BB37 𫬷 and U+2D25D 𭉝. #iss(312)
- Fixed incorrect glyph names in aj16-kanji.txt. #iss(314)
- Added uni4E00-JP to vpal. #iss(318)
- Added uni50F0-TW 僰. Updated uni50F0-CN 僰 with correct components. #iss(320)
- Fixed interpolation bug in uni9ED6-JP 黖. #iss(331)
- Removed uni3D6E-CN and restored uni3D6E-JP 㵮. #iss(333)
- Fixed alignment of vertical stroke in 里 component in uni50EE-CN 僮, uni5398-CN 厘, uni55B1-CN 喱, uni5A0C-CN 娌, uni5A0C-TW 娌, uni5E62-CN 幢, uni649E-CN 撞, uni6E79-JP 湹, uni6F7C-CN 潼, uni7F20-CN 缠, uni91CC-CN 里, uni91CE-CN 野, uni9502-CN 锂, uni973E-CN 霾, uni973E-TW 霾, uni9ED9-JP 黙, and u23638-JP 𣘸. #iss(335)
- Adjusted u2CE7C-CN 𬹼 and u2CE93-CN 𬺓. #iss(338)
- Adjusted 分 stroke in uni63B0-CN 掰. Added uni63B0-HK 掰 and mapped TW and HK to it. #iss(340)
- Restored uni85CF-CN 藏. #iss(342)
- Adjusted hook stroke in uni3C18-CN 㰘. Added uni5F5D-HK 彝 and uni7E6D-HK 繭. #iss(345)
- Added uni3584-HK 㖄. #iss(347)
- Removed uni5747-CN 均 and remapped CN to uni5747uE0101-JP 均󠄁. #iss(348)
- Mapped U+571B CN 圛 to TW glyph. #iss(349)
- Fixed stroke in u2A0FE-HK 𪃾 source. #iss(350)
- Fixed contour alignment in uni8B81-HK 讁 and uni74CD-CN 瓍. #iss(354)
- Restored uni58FF-CN 壿. #iss(355)
- Fixed IVS mapping in SourceHanSans_KR_sequences.txt. #iss(356)
- Remapped U+7BF9 KR to uni7BF9-CN 篹. #iss(358)
- Adjusted balance of uni6E7E-CN 湾. #iss(359)
- Adjusted 凶 stroke in uni9157-CN 酗 to be horizontal. #iss(361)
- Fixed incorrect component in uni97E5-HK 韥. #iss(363)
- Added U+31BC ㆼ, U+31BD ㆽ, U+31BE ㆾ, and U+31BF ㆿ. #iss(364)
- Minor adjustment to the Heavy source of uni4B4D-CN 䭍 to match similar glyphs with 皿. #iss(366)
- Updated top right component in uni5DD5-TW 巕. #iss(369)
- Removed uni5E54-TW 幔 and remapped to uni5E54uE0101-JP in the HK and TW CMap resources. #iss(370)
- Remapped U+5E90 to uni5E90-JP in the HK CMap Resources. #iss(371)
- Removed uni5EB7-TW 康, uni57ED-TW 埭, uni5ADD-TW 嫝, uni5F54-TW 彔, uni6177-TW 慷, and uni908D-TW 邍 and remapped all to the corresponding HK glyph. Fixed the incorrect component in uni96B8-TW 隸. Remapped the following: U+5124 TW 儤 (uni5124-CN -> uni5124-JP), U+5697 TW 嚗 (uni5697-CN -> uni5697-HK), U+61EA TW 懪 (uni61EA-CN -> uni61EA-HK), U+66DD HK/TW 曝 (uni66DD-CN -> uni66DD-JP), and U+7011 TW 瀑 (uni7011-CN -> uni7011-JP). #iss(372)
- Removed uni5ECC-CN 廌 and remapped CN to the TW glyph. #iss(373)
- Mapped U+5F0E to uni5F0E-CN 弎 in the HK CMap Resources and uni5F0E-JP 弎 in the TW CMap Resources. #iss(375)
- Fixed the CN form of 食 in uni990A-CN 養. #iss(377)
- Adjusted 麻 strokes in uni7222-CN 爢, uni7298-CN 犘, uni7A48-CN 穈, uni9761-CN 靡, and uni9EBE-CN 麾. #iss(381)
- Adjusted 王 component in uni87FC-CN 蟼. #iss(382)
- Fixed uni7436-CN 琶 source, mapped U+745F 瑟 CN to uni745FuE0101-JP. #iss(383)
- Adjusted uni7AAE-TW 窮 and uni4EAE-TW 亮. #iss(386)
- Fixed component alignment in uni5F2F-CN 弯. #iss(390)
- Added uni9699-JP90-JP to KR subset. #lnk("https://github.com/notofonts/noto-cjk/issues/238")["Noto Issue #238"] and #iss(391)
- Removed CN glyph for U+6136 愶 and remapped all to the JP glyph. #iss(399)
- Mapped U+613F to uni613F-JP 愿 in the HK CMap Resources. #iss(400)
- Adjusted uni516CuE0101-JP 公󠄁 top component. #iss(403)
- Added uni553E-JP 唾 and adjusted CN and TW glyphs. #iss(405)
- Updated 匕 component in U+61FB-TW 懻. #iss(407)
- Mapped U+6224 HK 戤 to the CN glyph. #iss(415)
- Removed uni622B-CN 戫 and remapped all to the nearly identical JP glyph. #iss(416)
- Mapped U+6265 扥 to JP in the TW and HK CMap Resources. #iss(417)
- Removed uni87B1-HK and remapped to the CN glyph. #iss(419)
- Adjusted uni7F70-CN 罰 to match component in uni7F78-CN 罸. #iss(422)
- Updated 𠀉 component in uni8943-CN and uni890F-CN. #iss(433)
- Fixed AI0-SourceHanSans layout to correctly include uni4E08uE0101-JP . #iss(434)
- Adjusted all glyphs with 酉 radical. #iss(441)
- Fixed protruding stroke in uni6B5C-CN 歜 ExtraLight. #iss(442)
- Removed uni5BF3-CN 寳 and remapped to the HK glyph. #iss(444)
- Adjusted uni7298-CN 犘 with correct stroke. Added uni7298-HK 犘. #iss(449)
- Removed uni9FDB-HK 鿛, uni9FE2-CN 鿢, uni9FE2-HK, uni9FE3-HK 鿣, uni9FE4-HK 鿤, uni9FE6-HK 鿦, and uni9FE8-HK 鿨. #iss(450)
- Added uni594A-TW 奊 and uni9DCD-TW 鷍. Updated uni512D-TW 儭, uni56AB-TW 嚫, uni5B2E-TW 嬮, uni65B0-TW 新, uni67B2-TW 枲, uni6976-TW 楶, uni6AEC-TW 櫬, uni6C69-TW 汩, uni6ED8-TW 滘, uni7019-TW 瀙, uni747F-TW 瑿, uni7F55-TW 罕, uni8456-TW 葖, uni896F-TW 襯, uni9E87-TW 麇. Made HK glyphs from old TW glyphs for U+9E87 麇, U+747F 瑿, U+8456 葖. Removed uni627F-TW 承, uni65F2-TW 旲, uni7361-TW 獡, uni8412-TW 萒, uni6915-TW 椕 and remapped to CN and HK glyphs. Mapped U+6983 TW 榃 to uni6983-HK and U+57DC TW 埜 to uni57DC-HK. #iss(454)
- Mapped U+4FB2 to uni4FB2-HK 侲 in the TW CMap Resources. #iss(455)
- Fixed incorrect hhea ascender/descender values in TTF VF. #iss(457)
- Remapped U+555F to uni555F-TW 啟 in the JP and KR CMap resources. Remapped U+5553 to uni5553-JP 啓 in the TW CMap resource. Remapped U+542F to uni542F-JP 启 in the TW CMap Resources. #iss(458)
- Restored JP glyph for U+9FC5 鿅 and removed CN glyph. #iss(464)
- Remapped U+5F5E to uni5F5E-CN 彞 in the HK CMap Resources. #iss(465)
- Fixed alignment of components in uni7067-CN 灧. #iss(472)
- Fixed protruding component in uni3447-CN 㑇 ExtraLight source. #iss(481)
- Fixed alignment of components in uni50B3-JP 傳 ExtraLight source. #iss(482)
- Adjusted 丙 in uni964B-JP 陋. #iss(483)
- Removed uni640F-TW 搏 glyph and mapped to uni640FuE0101-JP. #iss(485)
- Fixed component alignment in uni93F9-JP 鏹. #iss(487)
- Updated 炵 in uni70B5-TW 炵. #iss(490)
- Fixed component alignment in uni4E5E-CN 乞. #iss(493)
- Fixed truncated stroke in uni5A40-JP 婀 Heavy source. #iss(495)
- Fixed component alignment in uni9F0E-JP 鼎. #iss(496)
- Remapped U+2FC1 CN ⿁ (uni9B3C-CN -> uni9B3C-TW), U+2F3E CN ⼾ (uni6237-CN -> uni6236-CN), U+2FCB ⿋ (uni9EF9-CN -> uni9EF9-TW), U+2FC7 ⿇ (uni9EBB-CN -> uni9EBB-TW), and U+2EC1 虎󠄁 (uni864E-CN -> uni864EuE0101-JP). #iss(497)
- Fixed component alignment in uni54E9-CN 哩. #iss(498)
- Remapped U+999B 馛 TW to the JP glyph. Remapped U+99A1 馡 and U+99A7 馧 JP and KR to use TW glyph. Fixed 禾 radical in uni99A8-TW . #iss(499)
- Added variable font build scripts. #iss(501)
- Adjusted stroke in uni6414-JP 搔. #iss(502)
- Adjusted 辶 component in uni55F9-TW 嗹 to stay in em box. #iss(503)
- Adjusted weight of 人 component in uni9583-CN 閃 ExtraLight. #iss(505)
- Adjusted incorrect strokes in uni7A48-CN 穈 and uni9018-CN 逘. #iss(506)
- Fixed alignment and adjusted top of uni805A-TW 聚. #iss(507)
- Updated 手 component in uni8977-HK 襷. #iss(508)
- Fixed various component connections. #iss(509)
- Fixed various component connections. #iss(510)
- Fixed alignment of 火 component in uni70F3-TW, uni710D-TW, uni7110-TW, uni7117-TW, uni71AA-TW, uni71C0-TW, and uni71C8-TW. #iss(511)
- Fixed alignment on all glyphs mentioned in. #iss(512)
- Fixed various component connections. #iss(515)
- Fixed mapping for U+5ABA in the KR IVD resources. #iss(516)
- Added glyphs for U+2FFC ⿼, U+2FFD ⿽, U+2FFE ⿾, U+2FFF ⿿, U+31E4 ㇤, U+31E5 ㇥, U+31EF ㇯. Added IVS sequences for 2018 FE00 ‘︀, 2018 FE01 ‘︁, 2019 FE00 ’︀, 2019 FE01 ’︁, 201C FE00 “︀, 201C FE01 “︁, 201D FE00 ”︀, 201D FE01 ”︁. Modified uni31D2 ㇒, uni3026 〦, uni3027 〧, and uni3028 〨. #iss(517)
- Added glyphs for U+4DB6 䶶, U+4DB7 䶷, U+4DB8 䶸, U+4DBA 䶺, U+4DBB 䶻, U+4DBC 䶼, U+4DBD 䶽, U+4DBE 䶾, U+4DBF 䶿, U+9FF0 鿰, U+9FF1 鿱, U+9FF2 鿲, U+9FF3 鿳, U+9FF4 鿴, U+9FF5 鿵, U+9FF6 鿶, U+9FF7 鿷, U+9FF8 鿸, U+9FF9 鿹, U+9FFA 鿺, U+9FFB 鿻, U+9FFC 鿼, U+9FFD 鿽, U+9FFE 鿾, and U+9FFF 鿿. #iss(519)
- Removed uni4F2C-HK 伬, uni544E-HK 呎, uni54AB-HK 咫, uni5C3A-HK 尺, uni5EB9-HK 庹, uni6CA2-HK 沢, uni8687-HK 蚇, and uni99C5-HK 駅. Updated uni9FC8-HK 鿈. #iss(521)
- Updated uni873B-CN 蜻 and mapped HK to CN. #iss(522)
- Removed uni671B-TW 望 and mapped TW to the HK glyph. #iss(524)
- Mapped CN to HK glyph for u27A84-HK 𧪄, u28E36-HK 𨸶, u2008A-HK 𠂊, u20611-HK 𠘑, u20E6D-HK 𠹭, u22E42-HK 𢹂, u23CFE-HK 𣳾, u259CC-HK 𥧌, u26402-HK 𦐂, u26951-HK 𦥑, u27A84-HK 𧪄, u28949-HK 𨥉, u28A29-HK 𨨩, u28E36-HK 𨸶, u2A2B2-HK 𪊲. #iss(525)
- Fixed stroke in uni8CA8-TW 貨. Remapped CN to uni8CA8uE0101-JP 貨󠄁. #iss(528)
- Updated component in u1F22F-TW 🈯. #iss(529)
- Removed uni6C2A-TW 氪. #iss(531)
- Fixed component alignment in uni91DF-JP 釟, uni9266-JP 鉦, uni92DD-JP 鋝, uni92E9-JP 鋩, uni92E9uE0101-JP 鋩󠄁, uni92F2-JP 鋲, uni937D-JP 鍽, uni9381-JP 鎁, uni97D9-JP 韙, uni97D9-CN 韙, uni6801uE0101-JP 栁󠄁, uni6BCC-HK 毌, uni98E2uE0101-JP 飢󠄁, uni9912-JP 餒, and uni9940-JP 饀. #iss(533)
- Remapped U+53CA TW 及 to uni53CAuE0101-JP, U+6700 HK 最 to uni6700uE0101-JP, U+54E8 HK 哨 to uni54E8-JP90-JP, U+5960 CN 奠 to uni5960uE0101-JP, U+5C04 TW/HK 射 to uni5C04-JP, U+5819 TW/HK 堙 to uni5819uE0101-JP, U+5851 TW 塑 to uni5851-CN, U+58D1 HK 壑 to uni58D1-CN. #iss(534)
- Fixed interpolation issue in uniD73A 휺. #iss(535)
- Added uni35E9-HK 㗩. #iss(542)

#h2[Version 2.004]

Release Date: April 28, 2021.

Listed below are the changes that were made in this release:

- Variable font STAT table ranges were updated to display correctly on Windows. #iss(291)
- Variable font PostScript names were updated to display correctly on macOS 11. #iss(291)
- Added missing CID+37953 to Korean Subset. #iss(289)
- Glyphs with missing outlines were corrected. #iss(296)
- Hinting was removed from the OTF CFF2 variable fonts for the time being
- TTF variable fonts were added
- WOFF2 compressed fonts were added for all variable font resources

#h2[Version 2.003]

Release Date: April 8, 2021.

Listed below are the changes that were made in this release:

- The copyright year was changed from “2014–2020” to “2014–2021.”
- All fonts have been built as variable fonts.
- The following JP glyphs have been adjusted to work better with the variable font format: 僎, 噵, 庚, 惺, 意, 摝, 摹, 撰, 暒, 栁, 樚, 漉, 潠, 煋, 牃, 猩, 瑆, 疲, 瘒, 瘼, 盬, 眔, 睲, 腥, 舞, 苨, 菫, 菷, 蔓, 蕁, 蕐, 蕒, 薑, 薥, 薨, 薯, 薰, 蘙, 虂, 蟇, 蟤, 譔, 蹙, 鄜, 醒, 鐉, 饌, 驀, 鬃, 鹿, 隆, 巽, 攇, 葺, 選, 櫶, 靌, 讒, 亴, 舞
- The scale of glyphs in the intermediate weights (Light, Normal, Regular, Medium, Bold) has been adjusted slightly.
- Fixed TW mapping for 𰻞 U+30EDE #iss(280)
- Fixed incorrect mappings for 請 U+8ACB #iss(276)
- Fixed Heavy weight for 𥱊 U+25C4A #iss(283)
- Fixed the Heavy weight for 丈 U+4E08 from #iss(207) which was not updated as previously noted.

#h2[Version 2.002]

Release Date: Nov 3, 2020.

Listed below are the changes that were made in this release:

- The copyright year was changed from “2014–2019” to “2014–2020.”
- Addressed #iss(207) including glyph changes to U+4E08 and U+5C83. Extension G encodings were added for U+30729, U+30EDD, U+30EDE, and U+3106C and the previous GSUB rules were removed.

#h2[CJK Unified Ideographs Extension G]

#set par(leading: 6.7pt)
#table(
  columns: (89.8pt, 89.8pt, 89.7pt, 89.8pt, 89.7pt, 89.8pt),
  inset: 3.34pt,
  stroke: 0.6pt,
  table.header(
    hcl([Unicode]),
    hc([Simplified Chinese]),
    hc([Traditional Chinese]),
    hc([Hong Kong]),
    hc([Japanese]),
    hc([Korean]),
  ),
  ucode([U+30729]), gm([𰜩]), gm([𰜩]), gm([𰜩]), gm([𰜩]), gm([𰜩]),
  ucode([U+30EDD]), gm([𰻝]), gm([𰻝]), gm([𰻝]), gm([𰻝]), gm([𰻝]),
  ucode([U+30EDE]), gm([𰻞]), gm([𰻞]), gm([𰻞]), gm([𰻞]), gm([𰻞]),
  ucode([U+3106C]), gm([𱁬]), gm([𱁬]), gm([𱁬]), gm([𱁬]), gm([𱁬]),
)
#set par(leading: 8.1pt)

- Updated Korean glyph for U+58C4 as reported in #lnk("https://github.com/adobe-fonts/source-han-serif/issues/87")["Source Han Serif Issue #87"]
- Addressed #iss(204) for U+50E7, U+89E6, U+8FD0, U+9EA4, U+25C4A
- Mapped HK U+5C13 尓 to JP glyph
- Fixed U+21B9 as reported in #iss(260)
- Changed Korean mapping for U+51A4 as reported in #lnk("https://github.com/adobe-fonts/source-han-sans/issues/202/")["Issue #202"]
- The weights for Kanbun glyphs U+3191–U+319F have been adjusted as mentioned in the table at the beginning of #lnk("https://github.com/adobe-fonts/source-han-sans/issues/205/")["Issue #205"].
- Fixed Korean IVS mapping for U+8ACB as reported in #lnk("https://github.com/adobe-fonts/source-han-sans/issues/276/")["Issue #276"]

#h2[Version 2.001]

Build Date: April 4, 2019. Built By: Dr. Ken Lunde (小林劍󠄁). Release Date: April 9, 2019.

Listed below are the changes that were made in this release:

- The copyright year was changed from “2014, 2015, 2018” to the range “2014–2019.”
- The placeholder (aka blank) glyphs for U+32FF ㋿, _uni32FF-JP_ (CID+2184) and _uni32FF-JP-V_ (CID+65359), which is the code point that represents the two-ideograph square ligature form of the name of Japan’s forthcoming new era, 令和 (_reiwa_), that takes effect on 2019-05-01, are now the actual glyphs. U+32FF will be included in #lnk("https://www.unicode.org/versions/Unicode12.1.0/")[Unicode Version 12.1 (2019-05-07)].
- All of the mapping changes that were made to the fonts in this release are provided in the table at the beginning of #lnk("https://github.com/adobe-fonts/source-han-sans/issues/202/")["Issue #202"].
- All of the glyph corrections that were made to the fonts in this release are provided in the table at the beginning of #lnk("https://github.com/adobe-fonts/source-han-sans/issues/204/")["Issue #204"].
- All of the glyphs that were redesigned in this release are provided in the table at the beginning of #lnk("https://github.com/adobe-fonts/source-han-sans/issues/205/")["Issue #205"].
- The 45 glyphs that were added in this release, which replaced 45 of the 50 reserved glyphs, are provided in the table at the beginning of #lnk("https://github.com/adobe-fonts/source-han-sans/issues/206/")["Issue #206"]. The glyphs are at CIDs 65485 through 65529. Two of the new glyphs are mapped from code points that are now supported.
- Miscellaneous changes that were made in this release are provided in the table at the beginning of #lnk("https://github.com/adobe-fonts/source-han-sans/issues/207/")["Issue #207"].
- The following 33 glyphs for ideographs are no longer used, and are expected to be removed in Version 3.000 (currently unplanned and unscheduled): _uni58A6-TW_ (CID+13852), _uni5B0F-TW_ (CID+15204), _uni5B38-TW_ (CID+15300), _uni5D45-TW_ (CID+16313), _uni5D93-TW_ (CID+16476), _uni5E61-TW_ (CID+16819), _uni61BE-TW_ (CID+18366), _uni64BC-TW_ (CID+19658), _uni6937-TW_ (CID+21605), _uni69F9-CN_ (CID+21965), _uni7158-TW_ (CID+25284), _uni71D4-TW_ (CID+25554), _uni720B-JP_ (CID+25667), _uni756A-TW_ (CID+27154), _uni7690-CN_ (CID+27719), _uni78FB-TW_ (CID+28713), _uni7BB4-TW_ (CID+30074), _uni7C53-TW_ (CID+30421), _uni7DD8-TW_ (CID+31252), _uni7E59-TW_ (CID+31534), _uni7FB3-TW_ (CID+32075), _uni81B0-TW_ (CID+33147), _uni8543-TW_ (CID+35181), _uni85E9-TW_ (CID+35584), _uni87E0-TW_ (CID+36504), _uni8B52-TW_ (CID+38257), _uni8B85-TW_ (CID+38372), _uni8E6F-TW_ (CID+39481), _uni8F53-TW_ (CID+39883), _uni8F57-TW_ (CID+39895), _uni9407-TW_ (CID+42337), _uni9C55-TW_ (CID+45975), and _u24A01-KR_ (CID+60576).
- The seven per-weight glyph synopsis PDFs now include 2,090 pages, with the first 132 pages showing all 65,535 glyphs indexed by CID.

#h2[Version 2.000]

Build Date: November 2, 2018. Built By: Dr. Ken Lunde (小林劍󠄁). Release Date: November 19, 2018.

Compared to the previous release—Version 1.004 that was released on 2015-06-16—a large number of changes
were made, far too many to list here. Listed below are some of the more significant changes that were
made in this release:

- A second flavor of Traditional Chinese, for Hong Kong and supporting the HKSCS-2016 standard, was added, which increased the total number of font resources by 16, from 72 to 88.
- 155 new mappings have been added to the CMap resources. 66 are from BMP code points, 22 are from Plane 1 code points, and the remaining 67 are from Plane 2 code points. Among the 67 new Plane 2 code points, 57 are from Extension B, two are from Extension C, three are from Extension E, and the remaining five are from Extension F.
- As a result of removing approximately 1,750 glyphs in order to make room for approximately 1,750 new glyphs, the CID assignments of the glyphs necessarily—and drastically—changed. The CID assignments of exactly 200 glyphs are unchanged from Version 1.004: 0–107, 2570–2633, 47223–47232, 47262–47272, 47281–47286, and 65484.
- The Traditional Chinese form of the Radical "#" 162 辶 component was improved.
- The URO is complete up through U+9FEF (#lnk("https://www.unicode.org/versions/Unicode11.0.0/")[Unicode Version 11.0]).
- The glyphs for some of the kana were tweaked.
- The glyphs and support for bopomofo, along with their tone marks, were improved. This involved adding the ‘GDEF’ (_Glyph Definition_) table, the ‘mark’ (_Mark Positioning_) GPOS feature, and the ‘ruby’ (_Ruby Notation Forms_) GSUB feature.
- The language and script declarations in the ‘locl’ and ‘vert’ GSUB features were improved.
- The 13-page glyph synopsis PDFs for the 500 pre-composed high-frequency hangul syllables have been incorporated into the Unicode-base glyph synopsis PDFs, and are bookmarked under the “Korean” bookmark.
- Blank placeholder glyphs for U+32FF, _uni32FF_ (CID+2184) and _uni32FF-V_ (CID+65359), are included. This character has been reserved for the two-ideograph square ligature that represents the name of Japan’s forthcoming new era which starts on 2019-05-01, and will be the only character added in Unicode Version 12.1.
- Like _Source Han Serif_, the CIDFont and CMap resources do not include XUID arrays.
- Like _Source Han Serif_, there are no mappings for the range U+0000 through U+001F.
- Like _Source Han Serif_, the code points that correspond to #lnk("https://www.unicode.org/charts/PDF/UFF00.pdf")[Halfwidth Jamo variants] map to glyphs that correspond to code points in the #lnk("https://www.unicode.org/charts/PDF/U3130.pdf")[Hangul Compatibility Jamo block]. In other words, the glyphs for half-width jamo have been removed.
- Like _Source Han Serif_, the ‘name’ table does not includes any Macintosh (PlatformID=1) strings.
- Like _Source Han Serif_, the Regular weight is now style-linked to the Bold weight. This means that the Bold weight may not appear in the font menu, particularly when using applications that support style-linking as a way to make text bold.
- Like _Source Han Serif_, the ‘vert’ GPOS feature is included.
- Like _Source Han Serif_, the deprecated ‘hngl’ (_Hangul_) GSUB feature is not included in the fonts and font instances whose default language is Korean.

// ----- Known Issues ----------------------------------------------------------
#h1[Known Issues]

[
Please report all issues in the #lnk("https://github.com/adobe-fonts/source-han-sans/issues")[GitHub] repository so that they can be properly tracked and addressed, and for greater visibility among the user community. The #lnk("https://github.com/adobe-fonts/source-han-sans/wiki")[Wiki] also conveys some useful information about upcoming releases. Also, be sure to thoroughly check the #lnk("https://github.com/adobe-fonts/source-han-sans/issues?q=is%3Aissue+is%3Aclosed")[closed issues] prior to submitting a new issue, being sure to exercise the search feature.

Because these fonts exercise several architectural limits, particularly the ones that include 65,535 glyphs, some environments may have difficulties using them properly, sometimes due to implementation limits or poor assumptions. If this is the case, please report such issues so that they can be recorded and tracked. You are also strongly encouraged to contact the developer of such environments to report the same.
]

#h2[General]
- None

#h2[Western]
- None

#h2[Chinese—Simplified & Traditional]
- None

#h2[Simplified Chinese]
- None

#h2[Traditional Chinese]
- None

#h2[Traditional Chinese—TW]
- None.

#h2[Traditional Chinese—HK]
- None

#h2[Japanese]
- None

#h2[Korean]
- None
