// Source Han Sans Version 2.005 Documentation — Reproduction

// Generated from manual/SourceHanSansReadMe.pdf

#set page(width: 210mm, height: 297mm, margin: (top: 25mm, bottom: 25mm, left: 25mm, right: 25mm), footer: context { counter(page).display() })

 #set text(font: "Source Han Sans SC", size: 10pt)

#set heading(numbering: "1.")

 #align(center,

   stack(dir: ttb, spacing: 10pt,

     text(size: 36pt, weight: "medium")[Source Han Sans],

     text(size: 24pt)[Version 2.005],

     text(size: 12pt)[Released on June 18, 2025],
),
)

// Overview

== Overview

#text(rgb(0, 102, 204))[Source Han Sans], designed by #text(rgb(0, 102, 204))[Ryoko Nishizuka] (西塚涼子), is the companion sans serif–style Pan-CJK typeface family to #text(rgb(0, 102, 204))[Source Han Serif], and is offered in seven weights—ExtraLight, Light, Normal, Regular, Medium, Bold, and Heavy—and in several OpenType/CFF-based deployment configurations to accommodate various system requirements or, in some cases, limitations. Pan-CJK fonts, such as those provided by the Source Han typeface families, are intended to support and render the most important characters for Simplified Chinese, Traditional Chinese, Japanese, and Korean.

// 一字字 section

== 一字字

The samples on this page demonstrate that the differences for each language can be subtle or striking, depending on the ideograph, yet they all clearly share the same typeface style, design, weight, and other characteristics that are not necessarily tied to a particular language.

The first sample shows the completely shared form of U+4E00, along with the shared Simplified/Traditional Chinese and shared Japanese/Korean forms of U+5B57:
#grid(columns: (3em, auto), gutter: 2em,
  [U+4E00], [一 一 一],
)

The second sample below shows, from left to right, the Simplified Chinese form of U+9AA8, its Traditional Chinese (Taiwan) form, and the form shared by Traditional Chinese (Hong Kong), Japanese, and Korean:
#grid(columns: (3em, auto, auto, auto), gutter: 2em,
  [U+9AA8], [骨 SC], [骨 TC(TW)], [骨 TC(HK)/JP/KR],
)

The third sample shows, also from left to right, the almost completely unshared Simplified Chinese, Traditional Chinese (Taiwan and Hong Kong), Japanese, and Korean forms of U+66DC:
#grid(columns: (3em, auto, auto, auto, auto), gutter: 2em,
  [U+66DC], [曜 SC], [曜 TC(TW+HK)], [曜 JP], [曜 KR],
)

The fourth and final example shows, again from left to right, the completely unshared Simplified Chinese, Traditional Chinese (Taiwan), Traditional Chinese (Hong Kong), Japanese, and Korean forms of U+8FD4:
#grid(columns: (3em, auto, auto, auto, auto, auto), gutter: 2em,
  [U+8FD4], [返 SC], [返 TC(TW)], [返 TC(HK)], [返 JP], [返 KR],
)

The short passage shown below is Genesis 11:1 (创世记 11:1 in Simplified Chinese, 創世記 11:1 in Traditional Chinese, 創世記 11:1 in Japanese, and 창세기 11:1 in Korean) displayed in six languages and in three of the seven weights:

 #text(size: 8pt, weight: "extralight")[ExtraLight]
#grid(columns: (4em, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), gutter: 0.5em, inset: (x: 0.5em, y: 0.2em),
  [English], [那时，天下人的口音、言语都是一样。],
  [那時，天下人的口音、言語都是一樣。],
  [那時，天下人的口音、言語都是一樣。],
  [全地は同じ発音、同じ言葉であった。],
  [온 땅의 구음이 하나이요 언어가 하나이었더라。],
)

 #text(size: 8pt, weight: "regular")[Regular]
#grid(columns: (4em, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), gutter: 0.5em, inset: (x: 0.5em, y: 0.2em),
  [English], [那时，天下人的口音、言语都是一样。],
  [那時，天下人的口音、言語都是一樣。],
  [那時，天下人的口音、言語都是一樣。],
  [全地は同じ発音、同じ言葉であった。],
  [온 땅의 구음이 하나이요 언어가 하나이었더라。],
)

 #text(size: 8pt, weight: "black")[Heavy]
#grid(columns: (4em, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), gutter: 0.5em, inset: (x: 0.5em, y: 0.2em),
  [English], [那时，天下人的口音、言语都是一样。],
  [那時，天下人的口音、言語都是一樣。],
  [那時，天下人的口音、言語都是一樣。],
  [全地は同じ発音、同じ言葉であった。],
  [온 땅의 구음이 하나이요 언어가 하나이었더라。],
)

The use of these open source Pan-CJK fonts and their sources is covered under the terms of the SIL Open Font License, Version 1.1.

#pagebreak()

// Page 2 onwards

The pages that follow provide excruciating technical details about the font resources that are included in this open source project, and the information corresponds to Version 2.005.

== Configurations

Source Han Sans is provided in a number of possible deployment configurations, each of which is described below, along with typical usage scenarios:

=== Language-specific OpenType (OTF/TTF) variable fonts — 20 font resources

This deployment configuration is available in five languages—Simplified Chinese, Traditional Chinese (Taiwan), Traditional Chinese (Hong Kong), Japanese, and Korean—and sets one language as the default (a default language is required due to the single 'cmap' table), and the 'locl' (Localized Forms) GSUB feature is expected to be used to access glyphs that are appropriate for the other four supported languages. Five of the variable fonts differ only in that the default glyphs for ASCII (U+0020 through U+007E), U+00A0 ( ), U+00A5 (¥), U+00AD (‑), U+2011 (‑), and U+20A9 (₩) are half-width instead of proportional, and the default glyph for U+2423 (␣) is half-width instead of full-width. These fonts include the additional "HW" identifier in their names. The half-width variable fonts contain only the Regular and Bold weights. The other five Pan-CJK variable fonts contains all seven of the original static weights.

These fonts represent the most compact form that supports all languages and includes the complete set of glyphs, but this comes at the expense of requiring an application to properly support the 'locl' GSUB feature in order to display glyphs for languages other than the default one. In addition to using such an application, a good example of which is Adobe InDesign, the text—at the character, paragraph, or document level—must also be properly language-tagged. This configuration also requires a system that supports OTF or TTF variable fonts.

=== Language-specific OpenType/CFF (OTF) — 45 font resources

This deployment configuration contains the same set of fonts as the OpenType/CFF2 variable font configuration as 45 separate static fonts.

=== Region-specific Subset OpenType (Subset OTF/TTF) variable fonts — 10 font resources

This deployment configuration includes five different subsets, and each subset includes only the glyphs that are necessary for Simplified Chinese, Traditional Chinese (Taiwan), Traditional Chinese (Hong Kong), Japanese, or Korean.

These fonts are considered the most broadly usable because the 'locl' GSUB feature is not required to access the region-specific glyphs. Instead, only the glyphs that are necessary for each region are included. This deployment configuration is recommended for users who need only the glyphs for a specific region, and also desire the smallest possible footprint. These fonts are expected to behave the same as conventional Simplified Chinese, Traditional Chinese, Japanese, or Korean fonts. This configuration also requires a system that supports OTF or TTF variable fonts.

=== Region-specific Subset OpenType/CFF (Subset OTF) — 35 font resources

This deployment configuration contains the same set of fonts as the Region-specific Subset OpenType/CFF2 variable font configuration as 35 separate static fonts.

=== Variable font Collections (OTC) — 4 font resources

This deployment configuration represents a "best of all possible worlds" in that there are separate font instances for each language, and while each font instance necessarily specifies a default language, the 'locl' GSUB feature can still be used to access the glyphs for the other languages. The OTC files contain the 5 language-specific variable OTFs/TTFs (SourceHanSans-VF.otf.ttc/SourceHanSans-VF.ttf.ttc) and 5 half-width variable OTFs/TTFs (SourceHanSansHW-VF.otf.ttc/SourceHanSansHW-VF.ttf.ttc).

These fonts offer greater flexibility in that there is a single font resource that includes all font instances, each with a different one of the five languages serving as the default. Users of these fonts simply choose the appropriate font in an application's font menu, and the glyphs that are suitable for that language are displayed. However, OpenType Collections may not be supported everywhere. Note that if you install the OTCs, you cannot install any of the corresponding language-specific OTFs, because they share the same names. This configuration also requires a system that supports OTF or TTF variable fonts.

=== OpenType/CFF Collection (OTC) — 7 font resources

This is the same as the OpenType/CFF2 variable font Collection except that it packages all of the static fonts rather than the variable fonts. This deployment configuration represents a "best of all possible worlds (for static fonts)" in that there are separate font instances for each language, and while each font instance necessarily specifies a default language, the 'locl' GSUB feature can still be used to access the glyphs for the other languages. Like the language-specific OTFs, the Regular and Bold weights additionally include font instances for all five languages whose ASCII and small number of additional characters are half-width instead of the usual proportional.

These fonts offer greater flexibility in that there is a single font resource that includes five or ten font instances, each with a different one of the five languages serving as the default. Users of these fonts simply choose the appropriate font in an application's font menu, and the glyphs that are suitable for that language are displayed. However, OpenType/CFF Collections may not be supported everywhere. Note that if you install the OTCs, you cannot install any of the corresponding language-specific OTFs, because they share the same names.

=== Super OpenType/CFF Collection (Super OTC) — a single font resource

This deployment configuration packs all seven weights and all five languages, along with half-width variations of two of the seven weights, into a single font resource that includes a total of 45 font instances and 458,745 total glyphs. As a result of 'sfnt' table sharing, there are seven unique 'CFF ', 'hmtx', and 'vmtx' tables (one per weight), five unique 'GSUB' tables (one per language), and ten unique 'cmap' tables (one per language and proportional/half-width combination). These represent the largest tables, so greater sharing leads to a smaller overall footprint. This saves over 13MB compared to the seven separate static OTCs. While each font instance specifies a default language, the 'locl' GSUB feature can still be used to access the glyphs for the four other supported languages.

This font offers the greatest flexibility for static fonts in that there is a single font resource that includes all 45 font instances, one for each of the seven weights and five languages, along with half-width versions of the Regular and Bold weights. Users of this deployment format simply choose the appropriate font in an application's font menu, and the glyphs that are suitable for that language are displayed. The Super OTC is subject to the same caveats and limitations as the weight-specific OTCs. If your system supports both variable fonts and OpenType Collections then the language-specific variable OTCs will save even more space.

== Font Resources

The table below lists all font resources that are included in this release, organized by format and language, and providing their file and PostScript names:
#show table.cell: set text(size: 7pt)

#table(

  columns: (9em, 7em, 9em, 1fr),
  align: (left, left, left, left),
  stroke: black,
  inset: (x: 0.2em, y: 0.1em),
  [Format], [Language], [File Name], [PostScript Name/Names],
  [Variable OTF], [Simplified Chinese], [SourceHanSansSC-VF.otf], [SourceHanSansSCVF-ExtraLight, SourceHanSansSCVF-Light, SourceHanSansSCVF-Normal, SourceHanSansSCVF-Regular, SourceHanSansSCVF-Medium, SourceHanSansSCVF-Bold, SourceHanSansSCVF-Heavy],
  [Variable TTF], [Simplified Chinese], [SourceHanSansSC-VF.ttf], [SourceHanSansSCVF-ExtraLight, SourceHanSansSCVF-Light, SourceHanSansSCVF-Normal, SourceHanSansSCVF-Regular, SourceHanSansSCVF-Medium, SourceHanSansSCVF-Bold, SourceHanSansSCVF-Heavy],
  [Variable OTF], [Chinese—Taiwan], [SourceHanSansTC-VF.otf], [SourceHanSansTCVF-ExtraLight, SourceHanSansTCVF-Light, SourceHanSansTCVF-Normal, SourceHanSansTCVF-Regular, SourceHanSansTCVF-Medium, SourceHanSansTCVF-Bold, SourceHanSansTCVF-Heavy],
  [Variable TTF], [Chinese—Taiwan], [SourceHanSansTC-VF.ttf], [SourceHanSansTCVF-ExtraLight, SourceHanSansTCVF-Light, SourceHanSansTCVF-Normal, SourceHanSansTCVF-Regular, SourceHanSansTCVF-Medium, SourceHanSansTCVF-Bold, SourceHanSansTCVF-Heavy],
  [Variable OTF], [Chinese—Hong Kong], [SourceHanSansHC-VF.otf], [SourceHanSansHCVF-ExtraLight, SourceHanSansHCVF-Light, SourceHanSansHCVF-Normal, SourceHanSansHCVF-Regular, SourceHanSansHCVF-Medium, SourceHanSansHCVF-Bold, SourceHanSansHCVF-Heavy],
  [Variable TTF], [Chinese—Hong Kong], [SourceHanSansHC-VF.ttf], [SourceHanSansHCVF-ExtraLight, SourceHanSansHCVF-Light, SourceHanSansHCVF-Normal, SourceHanSansHCVF-Regular, SourceHanSansHCVF-Medium, SourceHanSansHCVF-Bold, SourceHanSansHCVF-Heavy],
  [Variable OTF], [Japanese], [SourceHanSans-VF.otf], [SourceHanSansVF-ExtraLight, SourceHanSansVF-Light, SourceHanSansVF-Normal, SourceHanSansVF-Regular, SourceHanSansVF-Medium, SourceHanSansVF-Bold, SourceHanSansVF-Heavy],
  [Variable TTF], [Japanese], [SourceHanSans-VF.ttf], [SourceHanSansVF-ExtraLight, SourceHanSansVF-Light, SourceHanSansVF-Normal, SourceHanSansVF-Regular, SourceHanSansVF-Medium, SourceHanSansVF-Bold, SourceHanSansVF-Heavy],
  [Variable OTF], [Korean], [SourceHanSansK-VF.otf], [SourceHanSansKVF-ExtraLight, SourceHanSansKVF-Light, SourceHanSansKVF-Normal, SourceHanSansKVF-Regular, SourceHanSansKVF-Medium, SourceHanSansKVF-Bold, SourceHanSansKVF-Heavy],
  [Variable TTF], [Korean], [SourceHanSansK-VF.ttf], [SourceHanSansKVF-ExtraLight, SourceHanSansKVF-Light, SourceHanSansKVF-Normal, SourceHanSansKVF-Regular, SourceHanSansKVF-Medium, SourceHanSansKVF-Bold, SourceHanSansKVF-Heavy],
  [Variable HW OTF], [SC], [SourceHanSansSCHW-VF.otf], [SourceHanSansSCHWVF-Regular, SourceHanSansSCHWVF-Bold],
  [Variable HW TTF], [SC], [SourceHanSansSCHW-VF.ttf], [SourceHanSansSCHWVF-Regular, SourceHanSansSCHWVF-Bold],
  [Variable HW OTF], [TC], [SourceHanSansTCHW-VF.otf], [SourceHanSansTCHWVF-Regular, SourceHanSansTCHWVF-Bold],
  [Variable HW TTF], [TC], [SourceHanSansTCHW-VF.ttf], [SourceHanSansTCHWVF-Regular, SourceHanSansTCHWVF-Bold],
  [Variable HW OTF], [HC], [SourceHanSansHCHW-VF.otf], [SourceHanSansHCHWVF-Regular, SourceHanSansHCHWVF-Bold],
  [Variable HW TTF], [HC], [SourceHanSansHCHW-VF.ttf], [SourceHanSansHCHWVF-Regular, SourceHanSansHCHWVF-Bold],
  [Variable HW OTF], [J], [SourceHanSansHW-VF.otf], [SourceHanSansHWVF-Regular, SourceHanSansHWVF-Bold],
  [Variable HW TTF], [J], [SourceHanSansHW-VF.ttf], [SourceHanSansHWVF-Regular, SourceHanSansHWVF-Bold],
  [Variable HW OTF], [K], [SourceHanSansKHW-VF.otf], [SourceHanSansKHWVF-Regular, SourceHanSansKHWVF-Bold],
  [Variable HW TTF], [K], [SourceHanSansKHW-VF.ttf], [SourceHanSansKHWVF-Regular, SourceHanSansKHWVF-Bold],
)
= Glyph Set Particulars

=== Glyph Set & Region-specific Subsets

The number of glyphs in each font resource—except for the region-specific subset OTFs—is 65,535 (CIDs 0 through 65534), which is at the architectural limit for CID-keyed fonts (65,535 glyphs).

The table below indicates the number of glyphs that are included in the region-specific subset OTFs, whose figures include a common set of 3,241 glyphs that correspond to various characters, symbols, and punctuation. Also provided are the names of the subset definition files that can be found in the #text(rgb(0, 102, 204))[Resources] folder of the release branch of this open source project:
#table(

  columns: (10em, 5em, 14em, 1fr),
  [Language], [Glyphs], [Subset Definition File], [Supported Standards],
  [Simplified Chinese], [31,072], [AI0-SourceHanSans.CN], [All GB 18030 2022 Implementation Level 2 hanzi as well as the remaining URO and Extension A glyphs in Level 3, all 8,105 hanzi of Tōngyòng Guīfàn Hànzìbiǎo (通用规范汉字表)],
  [Traditional Chinese—Taiwan], [20,963], [AI0-SourceHanSans.TW], [All Big Five hanzi (aka CNS 11643 Planes 1 and 2), all HKSCS-2016 hanzi (the glyphs may or may not adhere to the Taiwan MOE glyph standard), seven ETen hanzi, 15 additional hanzi],
  [Traditional Chinese—Hong Kong], [20,955], [AI0-SourceHanSans.HK], [All Big Five hanzi (aka CNS 11643 Planes 1 and 2), all HKSCS-2016 hanzi, seven ETen hanzi, 15 additional hanzi],
  [Japanese], [17,944], [AI0-SourceHanSans.JP], [All Adobe-Japan1-7 kanji (a superset of those in JIS X 0208, JIS X 0213 & JIS X 0212)],
  [Korean], [24,973], [AI0-SourceHanSans.KR], [All modern (11,172) and 500 high-frequency archaic hangul syllables, conjoining hangul jamo (with full archaic hangul support), all KS X 1001 and KS X 1002 hanja (7,476), 722 additional hanja],
)

Of course, the font resources that include the full set of 65,535 glyphs support all of the standards that are listed in the above table, and employ some method of accessing the glyphs for different languages when they occupy the same Unicode code point and require a different shape.

The ordering file, AI0-SourceHanSans, which is provided in the #text(rgb(0, 102, 204))[Resources] folder of the release branch of this open source project, lists all 65,535 CIDs in the first column, and shows the FDArray and row font structure in the second and third columns, respectively, along with the Unicode-based working glyph names in the fourth column. All 65,535 working glyph names are unique, and all—with the exception of the ones for CID+0 (the .notdef glyph) and CIDs 65531 through 65534—use a "uni" (BMP) or "u" (outside BMP) prefix followed by uppercase hexadecimal digits. Glyphs that are represented by (or can be considered) sequences are made up of concatenations of the appropriate Unicode-based glyph names. Identifiers for regions and other purposes are also used.

=== Weights

The table below shows sample glyphs in each of the seven weights, ranging from ExtraLight to Heavy. The ExtraLight and Heavy weights represent the master designs, and the five intermediate weights are the result of multiple master interpolation (the interpolation ratios are provided):
#grid(columns: (2em, auto, auto, auto, auto, auto, auto, auto), gutter: 0.5em,
  [], [ExtraLight—0], [Light—160], [Normal—320], [Regular—420], [Medium—560], [Bold—780], [Heavy—1000],
  [汉漢], [汉漢], [汉漢], [汉漢], [汉漢], [汉漢], [汉漢], [汉漢],
  [漢한], [漢한], [漢한], [漢한], [漢한], [漢한], [漢한], [漢한],
)

=== Glyph Complement PDFs

Included in the GlyphComplements folder of the release branch of this open source project are seven per-weight 2,105-page glyph complement PDFs that provide a visual synopsis for all 65,535 glyphs, along with Unicode tables for each of the five languages: Japanese, Korean, Simplified Chinese, Traditional Chinese (Taiwan), and Traditional Chinese (Hong Kong).

Pp 1 through 132 show all 65,535 glyphs by CID. The glyphs for U+2E3A and U+2E3B are excessively wide, and are instead shown in a separate glyph table on page 132. Their blue "P132" placeholders are on pp 3 and 127.

Bookmarked under the "Korean" bookmark, pp 919 through 931 (13 pages) show the 500 pre-composed high-frequency archaic hangul syllables, ordered by their two- or three-character combining sequences.

For the five bookmarked 393-page Unicode tables, for each code point that maps to a glyph, there are three types of annotations, described as follows according to their position relative to the code-point box:

- Upper-Left—Glyph width: F = Full-width, H = Half-width, M = Monospaced (hangul letters and syllables), P = Proportional, Q = Quarter-width, T = Tall (U+3031, U+3032, and the vertical forms of U+2E3A and U+2E3B), W = Wide (U+2E3A and U+2E3B), Z = Zero (non-spacing/combining)

- Upper-Right—Language (Region): C = Simplified Chinese (China), H = Traditional Chinese (Hong Kong), J = Japanese, K = Korean, T = Traditional Chinese (Taiwan)

- Bottom—The CID of the glyph

Glyphs that are tall (T), wide (W), or non-spacing/combining (Z) may exceed or appear outside the glyph or code-point box, which include those for U+20DD, U+20DE, U+2E3A, U+2E3B, U+302A through U+302D, U+3031, U+3032, U+3099, and U+309A, along with those for combining jamo.

=== Unencoded Glyphs

Ignoring code points that share different Simplified Chinese, Traditional Chinese, Japanese, Korean, and proportional/half-width glyphs, there are 3,234 unencoded glyphs in each 65,535-glyph font resource. The region-specific subset OTFs include considerably fewer unencoded glyphs.

Approximately one-third of the unencoded glyphs are Japanese ideographs (kanji), all of which represent kanji included in Adobe-Japan1-6. Some of these have been explicitly identified as JIS90 (JIS X 0208-1990) glyphs according to their source glyph names and are reflected in the 'jp90' GSUB feature that is specific to Japanese fonts and font instances, and the remainder have been identified according to their registered IVSes in the Adobe-Japan1 IVD (Ideographic Variation Database) Collection, and are reflected in the Format 14 'cmap' subtable.

=== UAX #50 Compliance

Source Han Sans is one of the first font implementations that is compliant with UAX #50 (Unicode Vertical Text Layout). Only the substitutions in the 'vert' GSUB feature are expected to be used, and the 'vrt2' GSUB feature, which is a subset of the 'vert' GSUB feature, is included only because some environments, such as Windows and some Microsoft applications, require it to be present. In particular, pre-rotated non–full-width glyphs have been excluded from the 'vrt2' GSUB feature, and substitutions for arrows and arrow-like characters have also been excluded from both GSUB features.

=== Language Particulars

==== Simplified Chinese: GB 18030 & Tōngyòng Guīfàn Hànzìbiǎo

In addition to supporting GB 18030 2022 Implementation Level 2, which primarily amounts to Simplified Chinese glyphs for all URO and Extension A code points plus six Extension B code points, China's latest list of 8,105 hanzi (通用规范汉字表 Tōngyòng Guīfàn Hànzìbiǎo), which includes 196 additional Extension B through E code points is also supported. Among these 196 hanzi, 36 map to Extension B, 44 map to Extension C, eight map to Extension D, and 108 map to Extension E. Note: Although GB 18030 2022 moved the remaining URO and Extension A characters from Level 2 to Level 3, Source Han includes the all URO and Extension A code points.

==== Traditional Chinese—Taiwan: Big Five + CNS 11643 Planes 1 & 2

There are separate Traditional Chinese fonts and font instances for Taiwan and Hong Kong. The scope of Traditional Chinese for Taiwan is limited to Big Five (equivalent to CNS 11643 Planes 1 and 2), and the glyphs mostly adhere to the Taiwan MOE (Ministry of Education) glyph standard. Any CJK Unified Ideograph code point that is outside the scope of Big Five is not likely to display appropriately for Traditional Chinese (Taiwan) use.

==== Traditional Chinese—Hong Kong: Big Five & HKSCS-2016

The Traditional Chinese (Hong Kong) fonts and font instances include as their scope Big Five and HKSCS-2016, with the glyphs for both mostly adhering to Hong Kong conventions.

==== Japanese: Adobe-Japan1-6 Correspondence Table & JIS Coverage

The aj16-kanji.txt mapping file that is provided in the #text(rgb(0, 102, 204))[Resources] folder of the release branch of this open source project shows how all Adobe-Japan1-6 kanji map to working glyph names as specified in the fourth field of the included AI0-SourceHanSans ordering file. In order to support the Adobe-Japan1 IVD Collection, glyphs for all Adobe-Japan1-6 kanji—except for ⦅6CE8 E0102⦆ (Adobe-Japan1-6 CID+12869), which is excluded because it is outside the scope of the Source Han Sans glyph set—are included.

Due to the JIS standard coverage of Adobe-Japan1-6 that is inherited by Source Han Sans, all JIS X 0208, JIS X 0213, and JIS X 0212 kanji are therefore supported. JIS2004 (aka JIS X 0213:2004) glyphs are the default for the relevant code points. A small number of characters in the JIS standards, such as those for IPA, along with additional Latin, Greek, and Cyrillic that were not deemed necessary, have been intentionally excluded.

Although Source Han Sans includes the same kanji as Adobe-Japan1-6, including a large number of kanji variants, compatibility shouldn't be expected for documents that were authored using applications that specify glyphs by CID. The only Adobe-Japan1-6 compatibility that should be expected is at the Unicode level, which includes the Adobe-Japan1 IVSes that are specified in the Format 14 'cmap' subtable.

==== Korean: Hangul Glyphs & Hanja Coverage

Glyphs for all modern Korean hangul symbols, letters (including compatibility versions), and syllables are included, along with the additional glyphs necessary to compose archaic hangul via the 'ljmo', 'vjmo', and 'tjmo' GSUB features. Also included are glyphs for 500 high-frequency archaic hangul syllables in pre-composed form, which are made accessible via the 'ccmp' GSUB feature.

While the horizontal advances of the glyphs for Korean hangul symbols (in the U+32xx block) are full-width (1000 units), those for Korean hangul letters and syllables are monospaced at 920 units.

The ks-hanja.txt mapping file that is provided in the #text(rgb(0, 102, 204))[Resources] folder of the release branch of this open source project shows how the hanja in the KS X 1001 (4,620) and KS X 1002 (2,856) standards map to working glyph names as specified in the fourth field of the included AI0-SourceHanSans ordering file.

== Proportional & Half-Width CJK Punctuation

Included in these fonts are special forms of the proportional and half-width punctuation shown in the table below, which have been tailored for CJK use in that they are aligned to the em-box, not to Latin features, and which are accessible via the 'locl' GSUB feature:
#table(

  columns: (3.5em, auto, auto, auto, auto, auto),
  [Unicode], [Proportional], [Half-Width¹], [Chinese], [Japanese], [Korean],
  [U+0020], [⌍⌏ ⌌⌎ → ⌍⌏ ⌌⌎], [], [], [], [Yes],
  [U+0021], [⌍⌏!⌌⌎ → ⌍⌏!⌌⌎], [⌍⌏!⌌⌎ → ⌍⌏!⌌⌎], [], [], [Yes],
  [U+0022], [⌍⌏"⌌⌎ → ⌍⌏"⌌⌎], [⌍⌏"⌌⌎ → ⌍⌏"⌌⌎], [Yes], [Yes], [Yes],
  [U+0027], [⌍⌏'⌌⌎ → ⌍⌏'⌌⌎], [⌍⌏'⌌⌎ → ⌍⌏'⌌⌎], [Yes], [Yes], [Yes],
  [U+0028], [⌍⌏(⌌⌎ → ⌍⌏(⌌⌎], [⌍⌏(⌌⌎ → ⌍⌏(⌌⌎], [], [], [Yes],
  [U+0029], [⌍⌏)⌌⌎ → ⌍⌏)⌌⌎], [⌍⌏)⌌⌎ → ⌍⌏)⌌⌎], [], [], [Yes],
  [U+002C], [⌍⌏,⌌⌎ → ⌍⌏,⌌⌎], [⌍⌏,⌌⌎ → ⌍⌏,⌌⌎], [], [], [Yes],
  [U+002D], [⌍⌏-⌌⌎ → ⌍⌏-⌌⌎], [⌍⌏-⌌⌎ → ⌍⌏-⌌⌎], [], [], [Yes],
  [U+002E], [⌍⌏.⌌⌎ → ⌍⌏.⌌⌎], [⌍⌏.⌌⌎ → ⌍⌏.⌌⌎], [], [], [Yes],
  [U+002F], [⌍⌏/⌌⌎ → ⌍⌏/⌌⌎], [⌍⌏/⌌⌎ → ⌍⌏/⌌⌎], [], [], [Yes],
  [U+0030²], [⌍⌏0⌌⌎ → ⌍⌏0⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0031²], [⌍⌏1⌌⌎ → ⌍⌏1⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0032²], [⌍⌏2⌌⌎ → ⌍⌏2⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0033²], [⌍⌏3⌌⌎ → ⌍⌏3⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0034²], [⌍⌏4⌌⌎ → ⌍⌏4⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0035²], [⌍⌏5⌌⌎ → ⌍⌏5⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0036²], [⌍⌏6⌌⌎ → ⌍⌏6⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0037²], [⌍⌏7⌌⌎ → ⌍⌏7⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0038²], [⌍⌏8⌌⌎ → ⌍⌏8⌌⌎], [], [Yes], [Yes], [Yes],
  [U+0039²], [⌍⌏9⌌⌎ → ⌍⌏9⌌⌎], [], [Yes], [Yes], [Yes],
  [U+003A], [⌍⌏:⌌⌎ → ⌍⌏:⌌⌎], [⌍⌏:⌌⌎ → ⌍⌏:⌌⌎], [], [], [Yes],
  [U+003B], [⌍⌏;⌌⌎ → ⌍⌏;⌌⌎], [⌍⌏;⌌⌎ → ⌍⌏;⌌⌎], [], [], [Yes],
  [U+003F], [⌍⌏?⌌⌎ → ⌍⌏?⌌⌎], [⌍⌏?⌌⌎ → ⌍⌏?⌌⌎], [], [], [Yes],
  [U+005B], [⌍⌏[⌌⌎ → ⌍⌏[⌌⌎], [⌍⌏[⌌⌎ → ⌍⌏[⌌⌎], [], [], [Yes],
  [U+005D], [⌍⌏]⌌⌎ → ⌍⌏]⌌⌎], [⌍⌏]⌌⌎ → ⌍⌏]⌌⌎], [], [], [Yes],
  [U+007B], [⌍⌏{⌌⌎ → ⌍⌏{⌌⌎], [⌍⌏{⌌⌎ → ⌍⌏{⌌⌎], [], [], [Yes],
  [U+007D], [⌍⌏}⌌⌎ → ⌍⌏}⌌⌎], [⌍⌏}⌌⌎ → ⌍⌏}⌌⌎], [], [], [Yes],
  [U+007E], [⌍⌏~⌌⌎ → ⌍⌏~⌌⌎], [⌍⌏~⌌⌎ → ⌍⌏~⌌⌎], [], [], [Yes],
  [U+00AD], [⌍⌏-⌌⌎ → ⌍⌏-⌌⌎], [⌍⌏-⌌⌎ → ⌍⌏-⌌⌎], [], [], [Yes],
  [U+00B7], [⌍⌏·⌌⌎ → ⌍⌏·⌌⌎], [], [], [], [Yes],
  [U+2011], [⌍⌏-⌌⌎ → ⌍⌏-⌌⌎], [⌍⌏-⌌⌎ → ⌍⌏-⌌⌎], [], [], [Yes],
  [U+2013], [⌍⌏–⌌⌎ → ⌍⌏–⌌⌎], [], [], [], [Yes],
  [U+2014], [⌍⌏—⌌⌎ → ⌍⌏—⌌⌎], [], [Yes], [Yes], [Yes],
  [U+2018], [⌍⌏'⌌⌎ → ⌍⌏'⌌⌎], [], [Yes³], [Yes], [Yes],
  [U+2019], [⌍⌏'⌌⌎ → ⌍⌏'⌌⌎], [], [Yes³], [Yes], [Yes],
  [U+201A], [⌍⌏‚⌌⌎ → ⌍⌏‚⌌⌎], [], [Yes], [Yes], [Yes],
  [U+201C], [⌍⌏"⌌⌎ → ⌍⌏"⌌⌎], [], [Yes³], [Yes], [Yes],
  [U+201D], [⌍⌏"⌌⌎ → ⌍⌏"⌌⌎], [], [Yes³], [Yes], [Yes],
  [U+201E], [⌍⌏"⌌⌎ → ⌍⌏"⌌⌎], [], [Yes], [Yes], [Yes],
  [U+2026²], [⌍⌏…⌌⌎ → ⌍⌏…⌌⌎], [], [Yes], [Yes], [Yes],
  [U+203C], [⌍⌏‼⌌⌎ → ⌍⌏‼⌌⌎], [], [Yes], [Yes], [Yes],
  [U+2047], [⌍⌏⁇⌌⌎ → ⌍⌏⁇⌌⌎], [], [Yes], [Yes], [Yes],
  [U+2048], [⌍⌏⁈⌌⌎ → ⌍⌏⁈⌌⌎], [], [Yes], [Yes], [Yes],
  [U+2049], [⌍⌏⁉⌌⌎ → ⌍⌏⁉⌌⌎], [], [Yes], [Yes], [Yes],
  [U+2E3A], [⌍⌏⸺⌌⌎ → ⌍⌏⸺⌌⌎], [], [], [Yes], [Yes],
  [U+2E3B], [⌍⌏⸻⌌⌎ → ⌍⌏⸻⌌⌎], [], [], [Yes], [Yes],
)

1. The half-width glyphs are not encoded by default, except for the Regular and Bold OTFs and OTC font instances that include the "HW" identifier in their names, and are accessible via the 'hwid' GSUB feature in all OTFs and OTC font instances.

2. These characters are unique in that the CJK forms are encoded by default, and the Western forms are accessible when the text is language-tagged for English.

3. The default glyph for this code point is full-width, not proportional, so the 'pwid' GSUB feature must first be invoked to access the proportional glyph that is tailored for CJK use.

== OpenType Particulars

=== Menu Names

The table below shows the English and localized Family names for each font and font instance:
#table(

  columns: (5em, auto, auto),
  [Configuration], [Family Name—English], [Family Name—Localized],
  [Simplified Chinese OTF & OTC], [Source Han Sans SC], [思源黑体],
  [Simplified Chinese OTF & OTC], [Source Han Sans HW SC], [思源黑体 HW],
  [Traditional Chinese OTF & OTC—Taiwan], [Source Han Sans TC], [思源黑體],
  [Traditional Chinese OTF & OTC—Taiwan], [Source Han Sans HW TC], [思源黑體 HW],
  [Traditional Chinese OTF & OTC—Hong Kong], [Source Han Sans HC], [思源黑體 香港],
  [Traditional Chinese OTF & OTC—Hong Kong], [Source Han Sans HW HC], [思源黑體 香港 HW],
  [Japanese OTF & OTC], [Source Han Sans], [源ノ角ゴシック],
  [Japanese OTF & OTC], [Source Han Sans HW], [源ノ角ゴシック HW],
  [Korean OTF & OTC], [Source Han Sans K], [본고딕],
  [Korean OTF & OTC], [Source Han Sans HW K], [본고딕 HW],
  [Simplified Chinese OTF (subset)], [Source Han Sans CN], [思源黑体 CN],
  [Traditional Chinese OTF (subset)—Taiwan], [Source Han Sans TW], [思源黑體 TW],
  [Traditional Chinese OTF (subset)—Hong Kong], [Source Han Sans HK], [思源黑體 HK],
  [Japanese OTF (subset)], [Source Han Sans JP], [源ノ角ゴシック JP],
  [Korean OTF (subset)], [Source Han Sans KR], [본고딕 KR],
  [Simplified Chinese Variable OTF & OTC], [Source Han Sans SC VF], [思源黑体 VF],
  [Simplified Chinese Variable OTF & OTC], [Source Han Sans HW SC VF], [思源黑体 HW VF],
  [Traditional Chinese Variable OTF & OTC—Taiwan], [Source Han Sans TC VF], [思源黑體 VF],
  [Traditional Chinese Variable OTF & OTC—Taiwan], [Source Han Sans HW TC VF], [思源黑體 HW VF],
  [Traditional Chinese Variable OTF & OTC—Hong Kong], [Source Han Sans HC VF], [思源黑體 香港 VF],
  [Traditional Chinese Variable OTF & OTC—Hong Kong], [Source Han Sans HW HC VF], [思源黑體 香港 HW VF],
  [Japanese Variable OTF & OTC], [Source Han Sans VF], [源ノ角ゴシック VF],
  [Japanese Variable OTF & OTC], [Source Han Sans HW VF], [源ノ角ゴシック HW VF],
  [Korean Variable OTF & OTC], [Source Han Sans K VF], [본고딕 VF],
  [Korean Variable OTF & OTC], [Source Han Sans HW K VF], [본고딕 HW VF],
)

For the region-specific subset OTFs, the English and localized menu names also include two-letter region identifiers. Their PostScript names, as shown in the table in the "Font Resources" section, use the same two-letter region identifiers. With the exception of Japanese, the language-specific OTFs and OTCs include a one- or two-letter language identifier only for their English menu names.

The Regular weight in all fonts and font instances is style-linked to the Bold weight. For applications that support style-linking, the Regular weight becomes the Bold weight if the "Bold" style is selected, and the Bold weight may not appear in the font menu.

Because the OTCs and the corresponding language-specific OTFs specify identical PostScript and Family names, they cannot be installed in the same environment.

=== OpenType Tables

All font resources, with the exception of the OTCs, include the following 17 OpenType tables: 'BASE', 'CFF ', 'DSIG', 'GDEF', 'GPOS', 'GSUB', 'OS/2', 'VORG', 'cmap', 'head', 'hhea', 'hmtx', 'maxp', 'name', 'post', 'vhea', and 'vmtx'. The OTCs do not include a 'DSIG' table.

The five or ten font instances in each of the seven OTCs share the following ten OpenType tables: 'BASE', 'CFF ', 'GDEF', 'VORG', 'hhea', 'hmtx', 'maxp', 'post', 'vhea', and 'vmtx'. The following six OpenType tables are not completely shared by the five or ten font instances in each OTC: 'GPOS', 'GSUB', 'OS/2', 'cmap', 'head', and 'name'.

The Super OTC shares OpenType tables more efficiently.

=== OpenType Table Overrides

Several values in particular OpenType tables have been overridden from their otherwise default values. The subsections below detail some of the more important table-specific overrides that have been applied.

The 'OS/2' Table: The OS/2.sTypoLineGap value has been set to 0 (zero) units, and is also reflected in the hhea.LineGap and vhea.lineGap values. The OS/2.usWinAscent and OS/2.usWinDescent values have been calculated by removing excessively tall and other vertical-only glyphs—for U+2E3A, U+2E3B, U+302A through U+302D, U+3031, and U+3032—from the equation, and have been harmonized across all seven weights. These same harmonized settings are also reflected in the hhea.Ascender and hhea.Descender values. This is for the benefit of applications that use these values for determining default leading. These and other 'OS/2' table settings are intended to provide consistent cross-platform line spacing (aka vertical metrics).

The 'name' Table: Unlike mainstream OpenType/CFF CJK fonts, a name.ID=20 string is not specified because there are no legacy (non-Unicode) encodings that meaningfully correspond to these fonts. In addition, the 'name' table does not include any Macintosh (PlatformID=1) strings, which was accomplished by invoking the AFDKO makeotf tool's "-omitMacNames" command-line option. This means that the 'name' table includes only Unicode strings.

The 'vmtx' Table: In addition to specifying alternate vertical origins for full-width Latin and Latin-like glyphs that rest on the Latin baseline, proper vertical origins and vertical advances are also specified for the glyphs that correspond to U+3031 and U+3032, and to the vertical forms of U+02D9, U+2E3A, U+2E3B, U+302E, and U+302F.

== OpenType GSUB Features

All fonts and font instances include the OpenType GSUB features (see the OpenType Feature Registry for additional information) as detailed in the table below:
#table(

  columns: (5em, 2.5em, 2.5em, 2.5em, 2.5em, 2.5em, 2.5em, 2.5em, 2.5em, 2.5em, 2.5em),
  [GSUB Feature], [OTF & OTC], [], [], [], [], [Subset OTF], [], [], [], [],
  [OTF & OTC], [SC], [TC], [HC], [J], [K], [CN], [TW], [HK], [JP], [KR],
  [aalt], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [calt], [Yes], [Yes], [Yes], [Yes], [Yes], [], [], [], [], [Yes],
  [ccmp], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [dlig], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [fwid¹], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [hist], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [hwid¹], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [jp78¹], [], [], [], [Yes], [], [], [], [], [], [Yes],
  [jp83¹], [], [], [], [Yes], [], [], [], [], [], [Yes],
  [jp90¹], [], [], [], [Yes], [], [], [], [], [], [Yes],
  [liga], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [ljmo], [Yes], [Yes], [Yes], [Yes], [Yes], [], [], [], [], [Yes],
  [locl], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [nlck¹], [], [], [], [Yes], [], [], [], [], [], [Yes],
  [pwid¹], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [ruby¹], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [tjmo], [Yes], [Yes], [Yes], [Yes], [Yes], [], [], [], [], [Yes],
  [vert¹], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
  [vjmo], [Yes], [Yes], [Yes], [Yes], [Yes], [], [], [], [], [Yes],
  [vrt2²], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes], [Yes],
)

1. This GSUB feature is inherited by the 'aalt' GSUB feature.

2. This GSUB feature is a subset—not superset, as is usually the case—of the 'vert' GSUB feature.

All fonts and font instances that include hangul letters or syllables include a Korean-specific glyph for the space character (U+0020), whose width is set to 280 units for all weights. The width of the proportional glyph for the space character ranges from 220 units (in ExtraLight) to 229 units (in Heavy) in all fonts and font instances, except for the half-width fonts and font instances that include the "HW" identifier in their names and whose space glyph is 500 units. A contextual substitution in the 'calt' GSUB feature substitutes the proportional space glyph with the Korean-specific version only when it is surrounded by a hangul syllable (modern or archaic), regardless of whether it is pre-composed or combining.

#table(
  columns: (8em, auto, auto),
  [Unicode Sequence], [Glyph], [Present in JIS X 0213],
  raw("<004D 0300>"), [M\u{0300}], [],
  raw("<004D 0304>"), [M\u{0304}], [],
  raw("<006D 0300>"), [m\u{0300}], [],
  raw("<006D 0304>"), [m\u{0304}], [],
  raw("<00CA 0304>"), [\u{00CA}\u{0304}], [],
  raw("<00CA 030C>"), [\u{00CA}\u{030C}], [],
  raw("<00EA 0304>"), [\u{00EA}\u{0304}], [],
  raw("<00EA 030C>"), [\u{00EA}\u{030C}], [],
  raw("<3042 3099>"), [\u{3042}\u{3099}], [],
  raw("<3044 3099>"), [\u{3044}\u{3099}], [],
  raw("<3048 3099>"), [\u{3048}\u{3099}], [],
  raw("<304A 3099>"), [\u{304A}\u{3099}], [],
  raw("<304B 309A>"), [\u{304B}\u{309A}], [Yes],
  raw("<304D 309A>"), [\u{304D}\u{309A}], [Yes],
  raw("<304F 309A>"), [\u{304F}\u{309A}], [Yes],
  raw("<3051 309A>"), [\u{3051}\u{309A}], [Yes],
  raw("<3053 309A>"), [\u{3053}\u{309A}], [Yes],
  raw("<3093 3099>"), [\u{3093}\u{3099}], [],
  raw("<30A2 3099>"), [\u{30A2}\u{3099}], [],
  raw("<30A4 3099>"), [\u{30A4}\u{3099}], [],
  raw("<30A8 3099>"), [\u{30A8}\u{3099}], [],
  raw("<30AA 3099>"), [\u{30AA}\u{3099}], [],
  raw("<30A3 3099>"), [\u{30A3}\u{3099}], [],
  raw("<30A9 3099>"), [\u{30A9}\u{3099}], [],
  raw("<30E3 3099>"), [\u{30E3}\u{3099}], [],
  raw("<30E5 3099>"), [\u{30E5}\u{3099}], [],
  raw("<30A7 3099>"), [\u{30A7}\u{3099}], [],
  raw("<30B7 309A>"), [\u{30B7}\u{309A}], [Yes],
  raw("<30B9 309A>"), [\u{30B9}\u{309A}], [Yes],
  raw("<30C3 309A>"), [\u{30C3}\u{309A}], [Yes],
  raw("<30AB 309A>"), [\u{30AB}\u{309A}], [Yes],
  raw("<30AD 309A>"), [\u{30AD}\u{309A}], [Yes],
  raw("<30AF 309A>"), [\u{30AF}\u{309A}], [Yes],
  raw("<30B1 309A>"), [\u{30B1}\u{309A}], [Yes],
  raw("<30B3 309A>"), [\u{30B3}\u{309A}], [Yes],
  raw("<30BB 309A>"), [\u{30BB}\u{309A}], [Yes],
  raw("<30C4 309A>"), [\u{30C4}\u{309A}], [Yes],
  raw("<30C8 309A>"), [\u{30C8}\u{309A}], [Yes],
  raw("<30F3 3099>"), [\u{30F3}\u{3099}], [],
  raw("<31F7 309A>"), [\u{31F7}\u{309A}], [Yes],
)

This GSUB feature is also used to support the two- and three-character sequences shown in the table below:
#table(

  columns: (5em, auto, auto, auto),
  [Unicode Sequence], [Unicode], [Western Glyph], [CJK Glyph],
  raw("2014 2014 2014"), [U+2E3B], [⌍⌏⸻⌌⌎], [⌍⌏⸻⌌⌎],
  raw("2014 2014"), [U+2E3A], [⌍⌏⸺⌌⌎], [⌍⌏⸺⌌⌎],
  raw("2015 2015 2015"), [U+2E3B], [], [⌍⌏⸻⌌⌎],
  raw("2015 2015"), [U+2E3A], [], [⌍⌏⸺⌌⌎],
  raw("3033 3035"), [U+3031], [], [〱],
  raw("3034 3035"), [U+3032], [], [〲],
)

The glyphs that result from the first four sequences can be overridden, in terms of Western versus CJK glyph style, by applying the 'locl' GSUB feature, which entails using an application that supports this OpenType feature and properly language-tagging the text. These sequences merely serve as a convenience mechanism for environments that do not support language tagging.

=== The 'locl' GSUB Feature

The 'locl' GSUB feature plays a critical role in the language-specific OTFs in that it represents the only mechanism within the font resource for accessing the glyphs for the non-default languages. If the 'locl' GSUB feature is not supported or not properly used, the default glyphs are used. Each non-default language is handled via a separate lookup that is associated with the appropriate language and script, and one of its purposes is to mimic the 'cmap' table of the target language.

The font instances of the OTCs also include the 'locl' GSUB feature, but its presence represents an alternate method for accessing the glyphs for the non-default languages that does not involve selecting a different font instance of the OTC.

Note that in addition to using an application that supports the 'locl' GSUB feature, such as Adobe InDesign or modern browsers (examples include Chrome, Edge, Firefox, and Safari), the text must also be properly language-tagged at the character, paragraph, or document level.

Also note that all font resources, including the region-specific subset OTFs, include the 'locl' GSUB feature. For the region-specific subset OTFs that obviously do not include glyphs for the ideographs of the non-supported regions, the 'locl' GSUB feature instead operates only on a small number of glyphs for punctuation by tailoring them for CJK use.

=== The 'vert' GSUB Feature

The 'vert' GSUB feature includes substitutions that may be different for each language, which apply to the following code points:
#table(

  columns: (3em, 6em, 6em, 6em, 6em),
  [Unicode], [Simplified Chinese], [Traditional Chinese], [Japanese], [Korean],
  [U+2018¹], [⌍⌏'⌌⌎ → ⌍⌏﹁⌌⌎], [⌍⌏'⌌⌎ → ⌍⌏'⌌⌎], [⌍⌏'⌌⌎], [⌍⌏'⌌⌎],
  [U+2019¹], [⌍⌏'⌌⌎ → ⌍⌏﹂⌌⌎], [⌍⌏'⌌⌎ → ⌍⌏'⌌⌎], [⌍⌏'⌌⌎], [⌍⌏'⌌⌎],
  [U+201C¹], [⌍⌏"⌌⌎ → ⌍⌏﹃⌌⌎], [⌍⌏"⌌⌎ → ⌍⌏〝⌌⌎], [⌍⌏"⌌⌎], [⌍⌏"⌌⌎],
  [U+201D¹], [⌍⌏"⌌⌎ → ⌍⌏﹄⌌⌎], [⌍⌏"⌌⌎ → ⌍⌏〞⌌⌎], [⌍⌏"⌌⌎], [⌍⌏"⌌⌎],
  [U+3001], [⌍⌏、⌌⌎ → ⌍⌏︑⌌⌎], [⌍⌏、⌌⌎], [⌍⌏、⌌⌎ → ⌍⌏︑⌌⌎], [⌍⌏、⌌⌎ → ⌍⌏︑⌌⌎],
  [U+3002], [⌍⌏。⌌⌎ → ⌍⌏︒⌌⌎], [⌍⌏。⌌⌎], [⌍⌏。⌌⌎ → ⌍⌏︒⌌⌎], [⌍⌏。⌌⌎ → ⌍⌏︒⌌⌎],
  [U+FF01], [⌍⌏!⌌⌎ → ⌍⌏︕⌌⌎], [⌍⌏!⌌⌎], [⌍⌏!⌌⌎], [⌍⌏!⌌⌎ → ⌍⌏︕⌌⌎],
  [U+FF0C], [⌍⌏，⌌⌎ → ⌍⌏︐⌌⌎], [⌍⌏，⌌⌎], [⌍⌏，⌌⌎ → ⌍⌏︐⌌⌎], [⌍⌏，⌌⌎ → ⌍⌏︐⌌⌎],
  [U+FF0E], [⌍⌏．⌌⌎ → ⌍⌏．⌌⌎], [⌍⌏．⌌⌎], [⌍⌏．⌌⌎ → ⌍⌏．⌌⌎], [⌍⌏．⌌⌎ → ⌍⌏．⌌⌎],
  [U+FF1A], [⌍⌏：⌌⌎ → ⌍⌏︓⌌⌎], [⌍⌏：⌌⌎], [⌍⌏：⌌⌎ → ⌍⌏：⌌⌎], [⌍⌏：⌌⌎ → ⌍⌏︓⌌⌎],
  [U+FF1B], [⌍⌏；⌌⌎ → ⌍⌏︔⌌⌎], [⌍⌏；⌌⌎], [⌍⌏；⌌⌎], [⌍⌏；⌌⌎ → ⌍⌏︔⌌⌎],
  [U+FF1F], [⌍⌏？⌌⌎ → ⌍⌏︖⌌⌎], [⌍⌏？⌌⌎], [⌍⌏？⌌⌎], [⌍⌏？⌌⌎ → ⌍⌏︖⌌⌎],
)

1. To achieve the same vertical substitution effect as Traditional Chinese for Japanese or Korean, the 'fwid' GSUB feature must first be applied to change the default proportional glyphs to their full-width forms.

== OpenType GPOS Features

Eight GPOS features, 'halt', 'kern', 'mark', 'palt', 'vert', 'vhal', 'vkrn', and 'vpal', are included in all font resources, and their details are listed below (see the OpenType Feature Registry for additional information):

- The 'halt' and 'vhal' GPOS feature are identical across all weights.

- The 'palt' and 'vpal' GPOS features for ExtraLight through Medium are identical, as are those for Bold and Heavy. These features cover the glyphs for kana, some full-width punctuation, some full-width symbols, full-width digits, and full-width Latin.

- The 'kern' GPOS feature includes weight-specific kerning pairs for proportional Latin, Greek, and Cyrillic glyphs, along with weight-independent kerning pairs for kana and some punctuation. The 'vkrn' GPOS feature includes only weight-independent kerning pairs for kana and some punctuation.

- The 'mark' GPOS feature is used for handling bopomofo tone mark placement.

- The 'vert' GPOS feature is used to adjust the glyphs for U+20DD, U+20DE, U+302A through U+302D, U+3099, U+309A, U+3127, U+31B4 through U+31B7, U+31BB, and those that represent vowels and trailing consonants of combining jamo, which have zero-unit horizontal advances, such that their positions and vertical origins are appropriate for vertical writing.

== Noto Sans CJK Differences

Other than by name, the fonts for the Google-branded version of this typeface design, #text(rgb(0, 102, 204))[Noto Sans CJK], differ in the following ways:

- The name.ID=0 (Copyright notice) string does not include a reference to the "Source" name.

- The name.ID=7 (Trademark) string specifies a Google trademark.

- The name.ID=11 (URL Vendor) string specifies a Google URL.

- A name.ID=12 (URL Designer) string was added that specifies an Adobe URL.

- The PostScript names for each named instance in the variable fonts are the same as the static fonts.

- Although localized menu names are not specified, localized 'name' table strings are included, in terms of name.IDs 1, 2, 4, 16, and 17, though the actual strings are identical to the English-language ones.

- The OS/2.usWeightClass value is set to 100 for Thin (Source Han Sans ExtraLight uses 250) per #text(rgb(0, 102, 204))[Noto CJK Issue #86].

- The OS/2.achVendID tag is set to GOOG (Source Han Sans uses ADBO).

- Although glyphs for U+2252 and U+25C8 are included, named uni2252 (CID+858) and uni25C8 (CID+1261), respectively, the Format 4 and 12 'cmap' subtables do not include mappings for U+2252 and U+25C8, per #text(rgb(0, 102, 204))[Noto CJK Issue #24] and #text(rgb(0, 102, 204))[Noto CJK Issue #23], respectively.

== Changes

=== Version 2.005

Release Date: June 18, 2025.

Listed below are the changes that were made in this release:

- The copyright year was changed from "2014–2021" to "2014–2025."

- Updated the Latin component with Source Sans v3.052.

- Mapped U+2E90 ⺐ to u21BC1-HK.

- Fixed incorrect stroke in uni91B1-JP 醱.

- Adjusted stroke in uni6414-JP 搔 and uni7CD4-JP 糔. Adobe Japan-1 Issue #9

- Added uni5EF3-HK 廳, uni5FB7-TW 德, and uni8EB2-HK 躲. Added uni7AE7-TW 竧 and mapped TW/HK to it. Removed uni5C04-TW 射, uni8EB0-HK 躰, uni8EB6-HK 躶, uni8EC3-HK 軃 and remapped to the corresponding JP glyph. Issue #233

- Updated uni5AF3-TW 嫳, uni6583-TW 斃, uni7358-TW 獘, uni8E69-TW 蹩, and uni9F08-HK 鼈. Issue #244

- Removed uni627D-TW 扽. Issue #247

- Added u2A736-TW 𪜶 and u20895-TW 𠢕. Issue #251

- Adjusted all enclosing glyphs to be consistent in size and use the same source components. Issue #298

- Removed uni9051-KR 遑, uni968D-KR 隍. Mapped U+6F64 to uni6F64-JP 潤 in the KR CMap Resources. Issue #303

- Updated glyph for u22ACF-HK 𢫏. Issue #311

- Added glyphs for U+2BB37 𫬷 and U+2D25D 𭉝. Issue #312

- Fixed incorrect glyph names in aj16-kanji.txt. Issue #314

- Added uni4E00-JP to vpal. Issue #318

- Added uni50F0-TW 僰. Updated uni50F0-CN 僰 with correct components. Issue #320

- Fixed interpolation bug in uni9ED6-JP 黖. Issue #331

- Removed uni3D6E-CN and restored uni3D6E-JP 㵮. Issue #333

- Fixed alignment of vertical stroke in 里 component in uni50EE-CN 僮, uni5398-CN 厘, uni55B1-CN 喱, uni5A0C-CN 娌, uni5A0C-TW 娌, uni5E62-CN 幢, uni649E-CN 撞, uni6E79-JP 湹, uni6F7C-CN 潼, uni7F20-CN 缠, uni91CC-CN 里, uni91CE-CN 野, uni9502-CN 锂, uni973E-CN 霾, uni973E-TW 霾, uni9ED9-JP 黙, and u23638-JP 𣘸. Issue #335

- Adjusted u2CE7C-CN 𬹼 and u2CE93-CN 𬺓. Issue #338

- Adjusted 分 stroke in uni63B0-CN 掰. Added uni63B0-HK 掰 and mapped TW and HK to it. Issue #340

- Restored uni85CF-CN 藏. Issue #342

- Adjusted hook stroke in uni3C18-CN 㰘. Added uni5F5D-HK 彝 and uni7E6D-HK 繭. Issue #345

- Added uni3584-HK 㖄. Issue #347

- Removed uni5747-CN 均 and remapped CN to uni5747uE0101-JP 均󠄁. Issue #348

- Mapped U+571B CN 圛 to TW glyph. Issue #349

- Fixed stroke in u2A0FE-HK 𪃾 source. Issue #350

- Fixed contour alignment in uni8B81-HK 讁 and uni74CD-CN 瓍. Issue #354

- Restored uni58FF-CN 壿. Issue #355

- Fixed IVS mapping in SourceHanSans_KR_sequences.txt. Issue #356

- Remapped U+7BF9 KR to uni7BF9-CN 篹. Issue #358

- Adjusted balance of uni6E7E-CN 湾. Issue #359

- Adjusted 凶 stroke in uni9157-CN 酗 to be horizontal. Issue #361

- Fixed incorrect component in uni97E5-HK 韥. Issue #363

- Added U+31BC ㆼ, U+31BD ㆽ, U+31BE ㆾ, and U+31BF ㆿ. Issue #364

- Minor adjustment to the Heavy source of uni4B4D-CN 䭍 to match similar glyphs with 皿. Issue #366

- Updated top right component in uni5DD5-TW 巕. Issue #369

- Removed uni5E54-TW 幔 and remapped to uni5E54uE0101-JP in the HK and TW CMap resources. Issue #370

- Remapped U+5E90 to uni5E90-JP in the HK CMap Resources. Issue #371

- Removed uni5EB7-TW 康, uni57ED-TW 埭, uni5ADD-TW 嫝, uni5F54-TW 彔, uni6177-TW 慷, and uni908D-TW 邍 and remapped all to the corresponding HK glyph. Fixed the incorrect component in uni96B8-TW 隸. Remapped the following: U+5124 TW 儤 (uni5124-CN -\u{003E} uni5124-JP), U+5697 TW 嚗 (uni5697-CN -\u{003E} uni5697-HK), U+61EA TW 懪 (uni61EA-CN -\u{003E} uni61EA-HK), U+66DD HK/TW 曝 (uni66DD-CN -\u{003E} uni66DD-JP), and U+7011 TW 瀑 (uni7011-CN -\u{003E} uni7011-JP). Issue #372

- Removed uni5ECC-CN 廌 and remapped CN to the TW glyph. Issue #373

- Mapped U+5F0E to uni5F0E-CN 弎 in the HK CMap Resources and uni5F0E-JP 弎 in the TW CMap Resources. Issue #375

- Fixed the CN form of 食 in uni990A-CN 養. Issue #377

- Adjusted 麻 strokes in uni7222-CN 爢, uni7298-CN 犘, uni7A48-CN 穈, uni9761-CN 靡, and uni9EBE-CN 麾. Issue #381

- Adjusted 王 component in uni87FC-CN 蟼. Issue #382

- Fixed uni7436-CN 琶 source, mapped U+745F 瑟 CN to uni745FuE0101-JP. Issue #383

- Adjusted uni7AAE-TW 窮 and uni4EAE-TW 亮. Issue #386

- Fixed component alignment in uni5F2F-CN 弯. Issue #390

- Added uni9699-JP90-JP to KR subset. Noto Issue #238 and Issue #391

- Removed CN glyph for U+6136 愶 and remapped all to the JP glyph. Issue #399

- Mapped U+613F to uni613F-JP 愿 in the HK CMap Resources. Issue #400

- Adjusted uni516CuE0101-JP 公󠄁 top component. Issue #403

- Added uni553E-JP 唾 and adjusted CN and TW glyphs. Issue #405

- Updated 匕 component in U+61FB-TW 懻. Issue #407

- Mapped U+6224 HK 戤 to the CN glyph. Issue #415

- Removed uni622B-CN 戫 and remapped all to the nearly identical JP glyph. Issue #416

- Mapped U+6265 扥 to JP in the TW and HK CMap Resources. Issue #417

- Removed uni87B1-HK and remapped to the CN glyph. Issue #419

- Adjusted uni7F70-CN 罰 to match component in uni7F78-CN 罸. Issue #422

- Updated 𠀉 component in uni8943-CN and uni890F-CN. Issue #433

- Fixed AI0-SourceHanSans layout to correctly include uni4E08uE0101-JP . Issue #434

- Adjusted all glyphs with 酉 radical. Issue #441

- Fixed protruding stroke in uni6B5C-CN 歜 ExtraLight. Issue #442

- Removed uni5BF3-CN 寳 and remapped to the HK glyph. Issue #444

- Adjusted uni7298-CN 犘 with correct stroke. Added uni7298-HK 犘. Issue #449

- Removed uni9FDB-HK 鿛, uni9FE2-CN 鿢, uni9FE2-HK, uni9FE3-HK 鿣, uni9FE4-HK 鿤, uni9FE6-HK 鿦, and uni9FE8-HK 鿨. Issue #450

- Added uni594A-TW 奊 and uni9DCD-TW 鷍. Updated uni512D-TW 儭, uni56AB-TW 嚫, uni5B2E-TW 嬮, uni65B0-TW 新, uni67B2-TW 枲, uni6976-TW 楶, uni6AEC-TW 櫬, uni6C69-TW 汩, uni6ED8-TW 滘, uni7019-TW 瀙, uni747F-TW 瑿, uni7F55-TW 罕, uni8456-TW 葖, uni896F-TW 襯, uni9E87-TW 麇. Made HK glyphs from old TW glyphs for U+9E87 麇, U+747F 瑿, U+8456 葖. Removed uni627F-TW 承, uni65F2-TW 旲, uni7361-TW 獡, uni8412-TW 萒, uni6915-TW 椕 and remapped to CN and HK glyphs. Mapped U+6983 TW 榃 to uni6983-HK and U+57DC TW 埜 to uni57DC-HK. Issue #454

- Mapped U+4FB2 to uni4FB2-HK 侲 in the TW CMap Resources. Issue #455

- Fixed incorrect hhea ascender/descender values in TTF VF. Issue #457

- Remapped U+555F to uni555F-TW 啟 in the JP and KR CMap resources. Remapped U+5553 to uni5553-JP 啓 in the TW CMap resource. Remapped U+542F to uni542F-JP 启 in the TW CMap Resources. Issue #458

- Restored JP glyph for U+9FC5 鿅 and removed CN glyph. Issue #464

- Remapped U+5F5E to uni5F5E-CN 彞 in the HK CMap Resources. Issue #465

- Fixed alignment of components in uni7067-CN 灧. Issue #472

- Fixed protruding component in uni3447-CN 㑇 ExtraLight source. Issue #481

- Fixed alignment of components in uni50B3-JP 傳 ExtraLight source. Issue #482

- Adjusted 丙 in uni964B-JP 陋. Issue #483

- Removed uni640F-TW 搏 glyph and mapped to uni640FuE0101-JP. Issue #485

- Fixed component alignment in uni93F9-JP 鏹. Issue #487

- Updated 炵 in uni70B5-TW 炵. Issue #490

- Fixed component alignment in uni4E5E-CN 乞. Issue #493

- Fixed truncated stroke in uni5A40-JP 婀 Heavy source. Issue #495

- Fixed component alignment in uni9F0E-JP 鼎. Issue #496

- Remapped U+2FC1 CN ⿁ (uni9B3C-CN -\u{003E} uni9B3C-TW), U+2F3E CN ⼾ (uni6237-CN -\u{003E} uni6236-CN), U+2FCB ⿋ (uni9EF9-CN -\u{003E} uni9EF9-TW), U+2FC7 ⿇ (uni9EBB-CN -\u{003E} uni9EBB-TW), and U+2EC1 虎󠄁 (uni864E-CN -\u{003E} uni864EuE0101-JP). Issue #497

- Fixed component alignment in uni54E9-CN 哩. Issue #498

- Remapped U+999B 馛 TW to the JP glyph. Remapped U+99A1 馡 and U+99A7 馧 JP and KR to use TW glyph. Fixed 禾 radical in uni99A8-TW . Issue #499

- Added variable font build scripts. Issue #501

- Adjusted stroke in uni6414-JP 搔. Issue #502

- Adjusted 辶 component in uni55F9-TW 嗹 to stay in em box. Issue #503

- Adjusted weight of 人 component in uni9583-CN 閃 ExtraLight. Issue #505

- Adjusted incorrect strokes in uni7A48-CN 穈 and uni9018-CN 逘. Issue #506

- Fixed alignment and adjusted top of uni805A-TW 聚. Issue #507

- Updated 手 component in uni8977-HK 襷. Issue #508

- Fixed various component connections. Issue #509

- Fixed various component connections. Issue #510

- Fixed alignment of 火 component in uni70F3-TW, uni710D-TW, uni7110-TW, uni7117-TW, uni71AA-TW, uni71C0-TW, and uni71C8-TW. Issue #511

- Fixed alignment on all glyphs mentioned in. Issue #512

- Fixed various component connections. Issue #515

- Fixed mapping for U+5ABA in the KR IVD resources. Issue #516

- Added glyphs for U+2FFC ⿼, U+2FFD ⿽, U+2FFE ⿾, U+2FFF ⿿, U+31E4 ㇤, U+31E5 ㇥, U+31EF ㇯. Added IVS sequences for 2018 FE00 '︀, 2018 FE01 '︁, 2019 FE00 '︀, 2019 FE01 '︁, 201C FE00 "︀, 201C FE01 "︁, 201D FE00 "︀, 201D FE01 "︁. Modified uni31D2 ㇒, uni3026 〦, uni3027 〧, and uni3028 〨. Issue #517

- Added glyphs for U+4DB6 䶶, U+4DB7 䶷, U+4DB8 䶸, U+4DBA 䶺, U+4DBB 䶻, U+4DBC 䶼, U+4DBD 佽, U+4DBE 䶾, U+4DBF 䶿, U+9FF0 鿰, U+9FF1 鿱, U+9FF2 鿲, U+9FF3 鿳, U+9FF4 鿴, U+9FF5 鿵, U+9FF6 鿶, U+9FF7 鿷, U+9FF8 鿸, U+9FF9 鿹, U+9FFA 鿺, U+9FFB 鿻, U+9FFC 鿼, U+9FFD 鿽, U+9FFE 鿾, and U+9FFF 鿿. Issue #519

- Removed uni4F2C-HK 伬, uni544E-HK 呎, uni54AB-HK 咫, uni5C3A-HK 尺, uni5EB9-HK 庹, uni6CA2-HK 沢, uni8687-HK 蚇, and uni99C5-HK 駅. Updated uni9FC8-HK 鿈. Issue #521

- Updated uni873B-CN 蜻 and mapped HK to CN. Issue #522

- Removed uni671B-TW 望 and mapped TW to the HK glyph. Issue #524

- Mapped CN to HK glyph for u27A84-HK 𧪄, u28E36-HK 𨸶, u2008A-HK 𠂊, u20611-HK 𠘑, u20E6D-HK 𠹭, u22E42-HK 𢹂, u23CFE-HK 𣳾, u259CC-HK 𥧌, u26402-HK 𦐂, u26951-HK 𦥑, u27A84-HK 𧪄, u28949-HK 𨥉, u28A29-HK 𨨩, u28E36-HK 𨸶, u2A2B2-HK 𪊲. Issue #525

- Fixed stroke in uni8CA8-TW 貨. Remapped CN to uni8CA8uE0101-JP 貨󠄁. Issue #528

- Updated component in u1F22F-TW 🈯. Issue #529

- Removed uni6C2A-TW 氪. Issue #531

- Fixed component alignment in uni91DF-JP 釟, uni9266-JP 鉦, uni92DD-JP 鋝, uni92E9-JP 鋩, uni92E9uE0101-JP 鋩󠄁, uni92F2-JP 鋲, uni937D-JP 鍽, uni9381-JP 鎁, uni97D9-JP 韙, uni97D9-CN 韙, uni6801uE0101-JP 栁󠄁, uni6BCC-HK 毌, uni98E2uE0101-JP 飢󠄁, uni9912-JP 餒, and uni9940-JP 饀. Issue #533

- Remapped U+53CA TW 及 to uni53CAuE0101-JP, U+6700 HK 最 to uni6700uE0101-JP, U+54E8 HK 哨 to uni54E8-JP90-JP, U+5960 CN 奠 to uni5960uE0101-JP, U+5C04 TW/HK 射 to uni5C04-JP, U+5819 TW/HK 堙 to uni5819uE0101-JP, U+5851 TW 塑 to uni5851-CN, U+58D1 HK 壑 to uni58D1-CN. Issue #534

- Fixed interpolation issue in uniD73A 휺. Issue #535

- Added uni35E9-HK 㗩. Issue #542

=== Version 2.004

Release Date: April 28, 2021.

Listed below are the changes that were made in this release:

- Variable font STAT table ranges were updated to display correctly on Windows. Issue #291

- Variable font PostScript names were updated to display correctly on macOS 11. Issue #291

- Added missing CID+37953 to Korean Subset. Issue #289

- Glyphs with missing outlines were corrected. Issue #296

- Hinting was removed from the OTF CFF2 variable fonts for the time being

- TTF variable fonts were added

- WOFF2 compressed fonts were added for all variable font resources

=== Version 2.003

Release Date: April 8, 2021.

Listed below are the changes that were made in this release:

- The copyright year was changed from "2014–2020" to "2014–2021."

- All fonts have been built as variable fonts.

- The following JP glyphs have been adjusted to work better with the variable font format: 僎, 噵, 庚, 惺, 意, 摝, 摹, 撰, 暒, 栁, 樚, 漉, 潠, 煋, 牃, 猩, 瑆, 疲, 瘒, 瘼, 盬, 眔, 睲, 腥, 舞, 苨, 菫, 菷, 蔓, 蕁, 蕐, 蕒, 薑, 薥, 薨, 薯, 薰, 蘙, 虂, 蟇, 蟤, 譔, 蹙, 鄜, 醒, 鐉, 饌, 驀, 鬃, 鹿, 隆, 巽, 攇, 葺, 選, 櫶, 靌, 讒, 亴, 舞

- The scale of glyphs in the intermediate weights (Light, Normal, Regular, Medium, Bold) has been adjusted slightly.

- Fixed TW mapping for 𰻞 U+30EDE Issue #280

- Fixed incorrect mappings for 請 U+8ACB Issue #276

- Fixed Heavy weight for 𥱊 U+25C4A Issue #283

- Fixed the Heavy weight for 丈 U+4E08 from Issue #207 which was not updated as previously noted.

=== Version 2.002

Release Date: Nov 3, 2020.

Listed below are the changes that were made in this release:

- The copyright year was changed from "2014–2019" to "2014–2020."

- Addressed Issue #207 including glyph changes to U+4E08 and U+5C83. Extension G encodings were added for U+30729, U+30EDD, U+30EDE, and U+3106C and the previous GSUB rules were removed.

CJK Unified Ideographs Extension G
#table(

  columns: (3em, 6em, 6em, 5em, 5em, 5em),
  [Unicode], [Simplified Chinese], [Traditional Chinese], [Hong Kong], [Japanese], [Korean],
  [U+30729], [⌍⌏𰜩⌌⌎], [⌍⌏𰜩⌌⌎], [⌍⌏𰜩⌌⌎], [⌍⌏𰜩⌌⌎], [⌍⌏𰜩⌌⌎],
  [U+30EDD], [⌍⌏𰻝⌌⌎], [⌍⌏𰻝⌌⌎], [⌍⌏𰻝⌌⌎], [⌍⌏𰻝⌌⌎], [⌍⌏𰻝⌌⌎],
  [U+30EDE], [⌍⌏𰻞⌌⌎], [⌍⌏𰻞⌌⌎], [⌍⌏𰻞⌌⌎], [⌍⌏𰻞⌌⌎], [⌍⌏𰻞⌌⌎],
  [U+3106C], [⌍⌏𱁬⌌⌎], [⌍⌏𱁬⌌⌎], [⌍⌏𱁬⌌⌎], [⌍⌏𱁬⌌⌎], [⌍⌏𱁬⌌⌎],
  [Static OTF], [Simplified Chinese], [SourceHanSansSC-ExtraLight.otf], [SourceHanSansSC-ExtraLight],
  [Static OTF], [Simplified Chinese], [SourceHanSansSC-Light.otf], [SourceHanSansSC-Light],
  [Static OTF], [Simplified Chinese], [SourceHanSansSC-Normal.otf], [SourceHanSansSC-Normal],
  [Static OTF], [Simplified Chinese], [SourceHanSansSC-Regular.otf], [SourceHanSansSC-Regular],
  [Static OTF], [Simplified Chinese], [SourceHanSansHWSC-Regular.otf], [SourceHanSansHWSC-Regular],
  [Static OTF], [Simplified Chinese], [SourceHanSansSC-Medium.otf], [SourceHanSansSC-Medium],
  [Static OTF], [Simplified Chinese], [SourceHanSansSC-Bold.otf], [SourceHanSansSC-Bold],
  [Static OTF], [Simplified Chinese], [SourceHanSansHWSC-Bold.otf], [SourceHanSansHWSC-Bold],
  [Static OTF], [Simplified Chinese], [SourceHanSansSC-Heavy.otf], [SourceHanSansSC-Heavy],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansTC-ExtraLight.otf], [SourceHanSansTC-ExtraLight],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansTC-Light.otf], [SourceHanSansTC-Light],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansTC-Normal.otf], [SourceHanSansTC-Normal],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansTC-Regular.otf], [SourceHanSansTC-Regular],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansHWTC-Regular.otf], [SourceHanSansHWTC-Regular],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansTC-Medium.otf], [SourceHanSansTC-Medium],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansTC-Bold.otf], [SourceHanSansTC-Bold],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansHWTC-Bold.otf], [SourceHanSansHWTC-Bold],
  [Static OTF], [Chinese—Taiwan], [SourceHanSansTC-Heavy.otf], [SourceHanSansTC-Heavy],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHC-ExtraLight.otf], [SourceHanSansHC-ExtraLight],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHC-Light.otf], [SourceHanSansHC-Light],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHC-Normal.otf], [SourceHanSansHC-Normal],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHC-Regular.otf], [SourceHanSansHC-Regular],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHWHC-Regular.otf], [SourceHanSansHWHC-Regular],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHC-Medium.otf], [SourceHanSansHC-Medium],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHC-Bold.otf], [SourceHanSansHC-Bold],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHWHC-Bold.otf], [SourceHanSansHWHC-Bold],
  [Static OTF], [Chinese—Hong Kong], [SourceHanSansHC-Heavy.otf], [SourceHanSansHC-Heavy],
  [Static OTF], [Japanese], [SourceHanSans-ExtraLight.otf], [SourceHanSans-ExtraLight],
  [Static OTF], [Japanese], [SourceHanSans-Light.otf], [SourceHanSans-Light],
  [Static OTF], [Japanese], [SourceHanSans-Normal.otf], [SourceHanSans-Normal],
  [Static OTF], [Japanese], [SourceHanSans-Regular.otf], [SourceHanSans-Regular],
  [Static OTF], [Japanese], [SourceHanSansHW-Regular.otf], [SourceHanSansHW-Regular],
  [Static OTF], [Japanese], [SourceHanSans-Medium.otf], [SourceHanSans-Medium],
  [Static OTF], [Japanese], [SourceHanSans-Bold.otf], [SourceHanSans-Bold],
  [Static OTF], [Japanese], [SourceHanSansHW-Bold.otf], [SourceHanSansHW-Bold],
  [Static OTF], [Japanese], [SourceHanSans-Heavy.otf], [SourceHanSans-Heavy],
  [Static OTF], [Korean], [SourceHanSansK-ExtraLight.otf], [SourceHanSansK-ExtraLight],
  [Static OTF], [Korean], [SourceHanSansK-Light.otf], [SourceHanSansK-Light],
  [Static OTF], [Korean], [SourceHanSansK-Normal.otf], [SourceHanSansK-Normal],
  [Static OTF], [Korean], [SourceHanSansK-Regular.otf], [SourceHanSansK-Regular],
  [Static OTF], [Korean], [SourceHanSansHWK-Regular.otf], [SourceHanSansHWK-Regular],
  [Static OTF], [Korean], [SourceHanSansK-Medium.otf], [SourceHanSansK-Medium],
  [Static OTF], [Korean], [SourceHanSansK-Bold.otf], [SourceHanSansK-Bold],
  [Static OTF], [Korean], [SourceHanSansHWK-Bold.otf], [SourceHanSansHWK-Bold],
  [Static OTF], [Korean], [SourceHanSansK-Heavy.otf], [SourceHanSansK-Heavy],
  [Subset OTF], [CN], [SourceHanSansCN-ExtraLight.otf], [SourceHanSansCN-ExtraLight],
  [Subset OTF], [CN], [SourceHanSansCN-Light.otf], [SourceHanSansCN-Light],
  [Subset OTF], [CN], [SourceHanSansCN-Normal.otf], [SourceHanSansCN-Normal],
  [Subset OTF], [CN], [SourceHanSansCN-Regular.otf], [SourceHanSansCN-Regular],
  [Subset OTF], [CN], [SourceHanSansCN-Medium.otf], [SourceHanSansCN-Medium],
  [Subset OTF], [CN], [SourceHanSansCN-Bold.otf], [SourceHanSansCN-Bold],
  [Subset OTF], [CN], [SourceHanSansCN-Heavy.otf], [SourceHanSansCN-Heavy],
  [Subset OTF], [TW], [SourceHanSansTW-ExtraLight.otf], [SourceHanSansTW-ExtraLight],
  [Subset OTF], [TW], [SourceHanSansTW-Light.otf], [SourceHanSansTW-Light],
  [Subset OTF], [TW], [SourceHanSansTW-Normal.otf], [SourceHanSansTW-Normal],
  [Subset OTF], [TW], [SourceHanSansTW-Regular.otf], [SourceHanSansTW-Regular],
  [Subset OTF], [TW], [SourceHanSansTW-Medium.otf], [SourceHanSansTW-Medium],
  [Subset OTF], [TW], [SourceHanSansTW-Bold.otf], [SourceHanSansTW-Bold],
  [Subset OTF], [TW], [SourceHanSansTW-Heavy.otf], [SourceHanSansTW-Heavy],
  [Subset OTF], [HK], [SourceHanSansHK-ExtraLight.otf], [SourceHanSansHK-ExtraLight],
  [Subset OTF], [HK], [SourceHanSansHK-Light.otf], [SourceHanSansHK-Light],
  [Subset OTF], [HK], [SourceHanSansHK-Normal.otf], [SourceHanSansHK-Normal],
  [Subset OTF], [HK], [SourceHanSansHK-Regular.otf], [SourceHanSansHK-Regular],
  [Subset OTF], [HK], [SourceHanSansHK-Medium.otf], [SourceHanSansHK-Medium],
  [Subset OTF], [HK], [SourceHanSansHK-Bold.otf], [SourceHanSansHK-Bold],
  [Subset OTF], [HK], [SourceHanSansHK-Heavy.otf], [SourceHanSansHK-Heavy],
  [Subset OTF], [JP], [SourceHanSansJP-ExtraLight.otf], [SourceHanSansJP-ExtraLight],
  [Subset OTF], [JP], [SourceHanSansJP-Light.otf], [SourceHanSansJP-Light],
  [Subset OTF], [JP], [SourceHanSansJP-Normal.otf], [SourceHanSansJP-Normal],
  [Subset OTF], [JP], [SourceHanSansJP-Regular.otf], [SourceHanSansJP-Regular],
  [Subset OTF], [JP], [SourceHanSansJP-Medium.otf], [SourceHanSansJP-Medium],
  [Subset OTF], [JP], [SourceHanSansJP-Bold.otf], [SourceHanSansJP-Bold],
  [Subset OTF], [JP], [SourceHanSansJP-Heavy.otf], [SourceHanSansJP-Heavy],
  [Subset OTF], [KR], [SourceHanSansKR-ExtraLight.otf], [SourceHanSansKR-ExtraLight],
  [Subset OTF], [KR], [SourceHanSansKR-Light.otf], [SourceHanSansKR-Light],
  [Subset OTF], [KR], [SourceHanSansKR-Normal.otf], [SourceHanSansKR-Normal],
  [Subset OTF], [KR], [SourceHanSansKR-Regular.otf], [SourceHanSansKR-Regular],
  [Subset OTF], [KR], [SourceHanSansKR-Medium.otf], [SourceHanSansKR-Medium],
  [Subset OTF], [KR], [SourceHanSansKR-Bold.otf], [SourceHanSansKR-Bold],
  [Subset OTF], [KR], [SourceHanSansKR-Heavy.otf], [SourceHanSansKR-Heavy],
  [Variable OTC], [All], [SourceHanSans-VF.otf.ttc], [SourceHanSansVF-ExtraLight, SourceHanSansKVF-ExtraLight, SourceHanSansSCVF-ExtraLight, SourceHanSansTCVF-ExtraLight, SourceHanSansHCVF-ExtraLight, SourceHanSansVF-Light, SourceHanSansKVF-Light, SourceHanSansSCVF-Light, SourceHanSansTCVF-Light, SourceHanSansHCVF-Light, SourceHanSansVF-Normal, SourceHanSansKVF-Normal, SourceHanSansSCVF-Normal, SourceHanSansTCVF-Normal, SourceHanSansHCVF-Normal, SourceHanSansVF-Regular, SourceHanSansKVF-Regular, SourceHanSansSCVF-Regular, SourceHanSansTCVF-Regular, SourceHanSansHCVF-Regular, SourceHanSansVF-Medium, SourceHanSansKVF-Medium, SourceHanSansSCVF-Medium, SourceHanSansTCVF-Medium, SourceHanSansHCVF-Medium, SourceHanSansVF-Bold, SourceHanSansKVF-Bold, SourceHanSansSCVF-Bold, SourceHanSansTCVF-Bold, SourceHanSansHCVF-Bold],
  [Variable OTC], [All], [SourceHanSans-VF.ttf.ttc], [SourceHanSansVF-ExtraLight, SourceHanSansKVF-ExtraLight, SourceHanSansSCVF-ExtraLight, SourceHanSansTCVF-ExtraLight, SourceHanSansHCVF-ExtraLight, SourceHanSansVF-Light, SourceHanSansKVF-Light, SourceHanSansSCVF-Light, SourceHanSansTCVF-Light, SourceHanSansHCVF-Light, SourceHanSansVF-Normal, SourceHanSansKVF-Normal, SourceHanSansSCVF-Normal, SourceHanSansTCVF-Normal, SourceHanSansHCVF-Normal, SourceHanSansVF-Regular, SourceHanSansKVF-Regular, SourceHanSansSCVF-Regular, SourceHanSansTCVF-Regular, SourceHanSansHCVF-Regular, SourceHanSansVF-Medium, SourceHanSansKVF-Medium, SourceHanSansSCVF-Medium, SourceHanSansTCVF-Medium, SourceHanSansHCVF-Medium, SourceHanSansVF-Bold, SourceHanSansKVF-Bold, SourceHanSansSCVF-Bold, SourceHanSansTCVF-Bold, SourceHanSansHCVF-Bold],
  [Variable HW OTC], [All], [SourceHanSansHW-VF.otf.ttc], [SourceHanSansSCHWVF-Regular, SourceHanSansSCHWVF-Bold, SourceHanSansTCHWVF-Regular, SourceHanSansTCHWVF-Bold, SourceHanSansHCHWVF-Regular, SourceHanSansHCHWVF-Bold, SourceHanSansHWVF-Regular, SourceHanSansHWVF-Bold, SourceHanSansKHWVF-Regular, SourceHanSansKHWVF-Bold],
  [Variable HW OTC], [All], [SourceHanSansHW-VF.ttf.ttc], [SourceHanSansSCHWVF-Regular, SourceHanSansSCHWVF-Bold, SourceHanSansTCHWVF-Regular, SourceHanSansTCHWVF-Bold, SourceHanSansHCHWVF-Regular, SourceHanSansHCHWVF-Bold, SourceHanSansHWVF-Regular, SourceHanSansHWVF-Bold, SourceHanSansKHWVF-Regular, SourceHanSansKHWVF-Bold],
  [OTC], [All], [SourceHanSans-ExtraLight.ttc], [SourceHanSans-ExtraLight, SourceHanSansK-ExtraLight, SourceHanSansSC-ExtraLight, SourceHanSansTC-ExtraLight, SourceHanSansHC-ExtraLight],
  [OTC], [All], [SourceHanSans-Light.ttc], [SourceHanSans-Light, SourceHanSansK-Light, SourceHanSansSC-Light, SourceHanSansTC-Light, SourceHanSansHC-Light],
  [OTC], [All], [SourceHanSans-Normal.ttc], [SourceHanSans-Normal, SourceHanSansK-Normal, SourceHanSansSC-Normal, SourceHanSansTC-Normal, SourceHanSansHC-Normal],
  [OTC], [All], [SourceHanSans-Regular.ttc], [SourceHanSans-Regular, SourceHanSansK-Regular, SourceHanSansSC-Regular, SourceHanSansTC-Regular, SourceHanSansHC-Regular, SourceHanSansHW-Regular, SourceHanSansHWK-Regular, SourceHanSansHWSC-Regular, SourceHanSansHWTC-Regular, SourceHanSansHWHC-Regular],
  [OTC], [All], [SourceHanSans-Medium.ttc], [SourceHanSans-Medium, SourceHanSansK-Medium, SourceHanSansSC-Medium, SourceHanSansTC-Medium, SourceHanSansHC-Medium],
  [OTC], [All], [SourceHanSans-Bold.ttc], [SourceHanSans-Bold, SourceHanSansK-Bold, SourceHanSansSC-Bold, SourceHanSansTC-Bold, SourceHanSansHC-Bold, SourceHanSansHW-Bold, SourceHanSansHWK-Bold, SourceHanSansHWSC-Bold, SourceHanSansHWTC-Bold, SourceHanSansHWHC-Bold],
  [OTC], [All], [SourceHanSans-Heavy.ttc], [SourceHanSans-Heavy, SourceHanSansK-Heavy, SourceHanSansSC-Heavy, SourceHanSansTC-Heavy, SourceHanSansHC-Heavy],
  [Super OTC], [All], [SourceHanSans.ttc], [SourceHanSans-ExtraLight, SourceHanSansK-ExtraLight, SourceHanSansSC-ExtraLight, SourceHanSansTC-ExtraLight, SourceHanSansHC-ExtraLight, SourceHanSans-Light, SourceHanSansK-Light, SourceHanSansSC-Light, SourceHanSansTC-Light, SourceHanSansHC-Light, SourceHanSans-Normal, SourceHanSansK-Normal, SourceHanSansSC-Normal, SourceHanSansTC-Normal, SourceHanSansHC-Normal, SourceHanSans-Regular, SourceHanSansK-Regular, SourceHanSansSC-Regular, SourceHanSansTC-Regular, SourceHanSansHC-Regular, SourceHanSansHW-Regular, SourceHanSansHWK-Regular, SourceHanSansHWSC-Regular, SourceHanSansHWTC-Regular, SourceHanSansHWHC-Regular, SourceHanSans-Medium, SourceHanSansK-Medium, SourceHanSansSC-Medium, SourceHanSansTC-Medium, SourceHanSansHC-Medium, SourceHanSans-Bold, SourceHanSansK-Bold, SourceHanSansSC-Bold, SourceHanSansTC-Bold, SourceHanSansHC-Bold, SourceHanSansHW-Bold, SourceHanSansHWK-Bold, SourceHanSansHWSC-Bold, SourceHanSansHWTC-Bold, SourceHanSansHWHC-Bold, SourceHanSans-Heavy, SourceHanSansK-Heavy, SourceHanSansSC-Heavy, SourceHanSansTC-Heavy, SourceHanSansHC-Heavy],)

- Updated Korean glyph for U+58C4 as reported in Source Han Serif Issue #87

- Addressed Issue #204 for U+50E7, U+89E6, U+8FD0, U+9EA4, U+25C4A

- Mapped HK U+5C13 尓 to JP glyph

- Fixed U+21B9 as reported in Issue #260

- Changed Korean mapping for U+51A4 as reported in Issue #202

- The weights for Kanbun glyphs U+3191–U+319F have been adjusted as mentioned in the table at the beginning of Issue #205.

- Fixed Korean IVS mapping for U+8ACB as reported in Issue #276

=== Version 2.001

Build Date: April 4, 2019. Built By: Dr. Ken Lunde (小林劍󠄁). Release Date: April 9, 2019.

Listed below are the changes that were made in this release:

- The copyright year was changed from "2014, 2015, 2018" to the range "2014–2019."

- The placeholder (aka blank) glyphs for U+32FF ㋿, uni32FF-JP (CID+2184) and uni32FF-JP-V (CID+65359), which is the code point that represents the two-ideograph square ligature form of the name of Japan's forthcoming new era, 令和 (reiwa), that takes effect on 2019-05-01, are now the actual glyphs. U+32FF will be included in Unicode Version 12.1 (2019-05-07).

- All of the mapping changes that were made to the fonts in this release are provided in the table at the beginning of Issue #202.

- All of the glyph corrections that were made to the fonts in this release are provided in the table at the beginning of Issue #204.

- All of the glyphs that were redesigned in this release are provided in the table at the beginning of Issue #205.

- The 45 glyphs that were added in this release, which replaced 45 of the 50 reserved glyphs, are provided in the table at the beginning of Issue #206. The glyphs are at CIDs 65485 through 65529. Two of the new glyphs are mapped from code points that are now supported.

- Miscellaneous changes that were made in this release are provided in the table at the beginning of Issue #207.

- The following 33 glyphs for ideographs are no longer used, and are expected to be removed in Version 3.000 (currently unplanned and unscheduled): uni58A6-TW (CID+13852), uni5B0F-TW (CID+15204), uni5B38-TW (CID+15300), uni5D45-TW (CID+16313), uni5D93-TW (CID+16476), uni5E61-TW (CID+16819), uni61BE-TW (CID+18366), uni64BC-TW (CID+19658), uni6937-TW (CID+21605), uni69F9-CN (CID+21965), uni7158-TW (CID+25284), uni71D4-TW (CID+25554), uni720B-JP (CID+25667), uni756A-TW (CID+27154), uni7690-CN (CID+27719), uni78FB-TW (CID+28713), uni7BB4-TW (CID+30074), uni7C53-TW (CID+30421), uni7DD8-TW (CID+31252), uni7E59-TW (CID+31534), uni7FB3-TW (CID+32075), uni81B0-TW (CID+33147), uni8543-TW (CID+35181), uni85E9-TW (CID+35584), uni87E0-TW (CID+36504), uni8B52-TW (CID+38257), uni8B85-TW (CID+38372), uni8E6F-TW (CID+39481), uni8F53-TW (CID+39883), uni8F57-TW (CID+39895), uni9407-TW (CID+42337), uni9C55-TW (CID+45975), and u24A01-KR (CID+60576).

- The seven per-weight glyph synopsis PDFs now include 2,090 pages, with the first 132 pages showing all 65,535 glyphs indexed by CID.

=== Version 2.000

Build Date: November 2, 2018. Built By: Dr. Ken Lunde (小林劍󠄁). Release Date: November 19, 2018.

Compared to the previous release—Version 1.004 that was released on 2015-06-16—a large number of changes were made, far too many to list here. Listed below are some of the more significant changes that were made in this release:

- A second flavor of Traditional Chinese, for Hong Kong and supporting the HKSCS-2016 standard, was added, which increased the total number of font resources by 16, from 72 to 88.

- 155 new mappings have been added to the CMap resources. 66 are from BMP code points, 22 are from Plane 1 code points, and the remaining 67 are from Plane 2 code points. Among the 67 new Plane 2 code points, 57 are from Extension B, two are from Extension C, three are from Extension E, and the remaining five are from Extension F.

- As a result of removing approximately 1,750 glyphs in order to make room for approximately 1,750 new glyphs, the CID assignments of the glyphs necessarily—and drastically—changed. The CID assignments of exactly 200 glyphs are unchanged from Version 1.004: 0–107, 2570–2633, 47223–47232, 47262–47272, 47281–47286, and 65484.

- The Traditional Chinese form of the Radical #162 辶 component was improved.

- The URO is complete up through U+9FEF (Unicode Version 11.0).

- The glyphs for some of the kana were tweaked.

- The glyphs and support for bopomofo, along with their tone marks, were improved. This involved adding the 'GDEF' (Glyph Definition) table, the 'mark' (Mark Positioning) GPOS feature, and the 'ruby' (Ruby Notation Forms) GSUB feature.

- The language and script declarations in the 'locl' and 'vert' GSUB features were improved.

- The 13-page glyph synopsis PDFs for the 500 pre-composed high-frequency hangul syllables have been incorporated into the Unicode-base glyph synopsis PDFs, and are bookmarked under the "Korean" bookmark.

- Blank placeholder glyphs for U+32FF, uni32FF (CID+2184) and uni32FF-V (CID+65359), are included. This character has been reserved for the two-ideograph square ligature that represents the name of Japan's forthcoming new era which starts on 2019-05-01, and will be the only character added in Unicode Version 12.1.

- Like Source Han Serif, the CIDFont and CMap resources do not include XUID arrays.

- Like Source Han Serif, there are no mappings for the range U+0000 through U+001F.

- Like Source Han Serif, the code points that correspond to Halfwidth Jamo variants map to glyphs that correspond to code points in the Hangul Compatibility Jamo block. In other words, the glyphs for half-width jamo have been removed.

- Like Source Han Serif, the 'name' table does not includes any Macintosh (PlatformID=1) strings.

- Like Source Han Serif, the Regular weight is now style-linked to the Bold weight. This means that the Bold weight may not appear in the font menu, particularly when using applications that support style-linking as a way to make text bold.

- Like Source Han Serif, the 'vert' GPOS feature is included.

- Like Source Han Serif, the deprecated 'hngl' (Hangul) GSUB feature is not included in the fonts and font instances whose default language is Korean.

== Known Issues

Please report all issues in the GitHub repository so that they can be properly tracked and addressed, and for greater visibility among the user community. The Wiki also conveys some useful information about upcoming releases. Also, be sure to thoroughly check the closed issues prior to submitting a new issue, being sure to exercise the search feature.

Because these fonts exercise several architectural limits, particularly the ones that include 65,535 glyphs, some environments may have difficulties using them properly, sometimes due to implementation limits or poor assumptions. If this is the case, please report such issues so that they can be recorded and tracked. You are also strongly encouraged to contact the developer of such environments to report the same.

=== General

• None

=== Western

• None

=== Chinese—Simplified & Traditional

• None

=== Simplified Chinese

• None

=== Traditional Chinese

• None

=== Traditional Chinese—TW

• None.

=== Traditional Chinese—HK

• None

=== Japanese

• None

=== Korean

• None