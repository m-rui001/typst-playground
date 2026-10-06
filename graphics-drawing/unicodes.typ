// set --ppi 120 for 1920x1080 output
// @typstyle off
#let det(t) = {
  if t <= 0x007F        { (1, "Basic Latin") }
  else if t <= 0x00FF   { (2, "Latin-1 Supplement") }
  else if t <= 0x017F   { (3, "Latin Extended-A") }
  else if t <= 0x024F   { (4, "Latin Extended-B") }
  else if t <= 0x02AF   { (5, "IPA Extensions") }
  else if t <= 0x02FF   { (6, "Spacing Modifier Letters") }
  else if t <= 0x036F   { (7, "Combining Diacritical Marks") }
  else if t <= 0x03FF   { (8, "Greek and Coptic") }
  else if t <= 0x04FF   { (9, "Cyrillic") }
  else if t <= 0x052F   { (10, "Cyrillic Supplement") }
  else if t <= 0x058F   { (11, "Armenian") }
  else if t <= 0x05FF   { (12, "Hebrew") }
  else if t <= 0x06FF   { (13, "Arabic") }
  else if t <= 0x074F   { (14, "Syriac") }
  else if t <= 0x077F   { (15, "Arabic Supplement") }
  else if t <= 0x07BF   { (16, "Thaana") }
  else if t <= 0x07FF   { (17, "NKo") }
  else if t <= 0x083F   { (18, "Samaritan") }
  else if t <= 0x085F   { (19, "Mandaic") }
  else if t <= 0x086F   { (20, "Syriac Supplement") }
  else if t <= 0x08FF   { (21, "Arabic Extended-A") }
  else if t <= 0x097F   { (22, "Devanagari") }
  else if t <= 0x09FF   { (23, "Bengali") }
  else if t <= 0x0A7F   { (24, "Gurmukhi") }
  else if t <= 0x0AFF   { (25, "Gujarati") }
  else if t <= 0x0B7F   { (26, "Oriya") }
  else if t <= 0x0BFF   { (27, "Tamil") }
  else if t <= 0x0C7F   { (28, "Telugu") }
  else if t <= 0x0CFF   { (29, "Kannada") }
  else if t <= 0x0D7F   { (30, "Malayalam") }
  else if t <= 0x0DFF   { (31, "Sinhala") }
  else if t <= 0x0E7F   { (32, "Thai") }
  else if t <= 0x0EFF   { (33, "Lao") }
  else if t <= 0x0FFF   { (34, "Tibetan") }
  else if t <= 0x109F   { (35, "Myanmar") }
  else if t <= 0x10FF   { (36, "Georgian") }
  else if t <= 0x11FF   { (37, "Hangul Jamo") }
  else if t <= 0x137F   { (38, "Ethiopic") }
  else if t <= 0x139F   { (39, "Ethiopic Supplement") }
  else if t <= 0x13FF   { (40, "Cherokee") }
  else if t <= 0x167F   { (41, "Unified Canadian Aboriginal Syllabics") }
  else if t <= 0x169F   { (42, "Ogham") }
  else if t <= 0x16FF   { (43, "Runic") }
  else if t <= 0x171F   { (44, "Tagalog") }
  else if t <= 0x173F   { (45, "Hanunoo") }
  else if t <= 0x175F   { (46, "Buhid") }
  else if t <= 0x177F   { (47, "Tagbanwa") }
  else if t <= 0x17FF   { (48, "Khmer") }
  else if t <= 0x18AF   { (49, "Mongolian") }
  else if t <= 0x18FF   { (50, "Unified Canadian Aboriginal Syllabics Extended") }
  else if t <= 0x194F   { (51, "Limbu") }
  else if t <= 0x197F   { (52, "Tai Le") }
  else if t <= 0x19DF   { (53, "New Tai Lue") }
  else if t <= 0x19FF   { (54, "Khmer Symbols") }
  else if t <= 0x1A1F   { (55, "Buginese") }
  else if t <= 0x1AAF   { (56, "Tai Tham") }
  else if t <= 0x1AFF   { (57, "Combining Diacritical Marks Extended") }
  else if t <= 0x1B7F   { (58, "Balinese") }
  else if t <= 0x1BBF   { (59, "Sundanese") }
  else if t <= 0x1BFF   { (60, "Batak") }
  else if t <= 0x1C4F   { (61, "Lepcha") }
  else if t <= 0x1C7F   { (62, "Ol Chiki") }
  else if t <= 0x1C8F   { (63, "Cyrillic Extended-C") }
  else if t <= 0x1CBF   { (64, "Georgian Extended") }
  else if t <= 0x1CCF   { (65, "Sundanese Supplement") }
  else if t <= 0x1CFF   { (66, "Vedic Extensions") }
  else if t <= 0x1D7F   { (67, "Phonetic Extensions") }
  else if t <= 0x1DBF   { (68, "Phonetic Extensions Supplement") }
  else if t <= 0x1DFF   { (69, "Combining Diacritical Marks Supplement") }
  else if t <= 0x1EFF   { (70, "Latin Extended Additional") }
  else if t <= 0x1FFF   { (71, "Greek Extended") }
  else if t <= 0x206F   { (72, "General Punctuation") }
  else if t <= 0x209F   { (73, "Superscripts and Subscripts") }
  else if t <= 0x20CF   { (74, "Currency Symbols") }
  else if t <= 0x20FF   { (75, "Combining Diacritical Marks for Symbols") }
  else if t <= 0x214F   { (76, "Letterlike Symbols") }
  else if t <= 0x218F   { (77, "Number Forms") }
  else if t <= 0x21FF   { (78, "Arrows") }
  else if t <= 0x22FF   { (79, "Mathematical Operators") }
  else if t <= 0x23FF   { (80, "Miscellaneous Technical") }
  else if t <= 0x243F   { (81, "Control Pictures") }
  else if t <= 0x245F   { (82, "Optical Character Recognition") }
  else if t <= 0x24FF   { (83, "Enclosed Alphanumerics") }
  else if t <= 0x257F   { (84, "Box Drawing") }
  else if t <= 0x259F   { (85, "Block Elements") }
  else if t <= 0x25FF   { (86, "Geometric Shapes") }
  else if t <= 0x26FF   { (87, "Miscellaneous Symbols") }
  else if t <= 0x27BF   { (88, "Dingbats") }
  else if t <= 0x27EF   { (89, "Miscellaneous Mathematical Symbols-A") }
  else if t <= 0x27FF   { (90, "Supplemental Arrows-A") }
  else if t <= 0x28FF   { (91, "Braille Patterns") }
  else if t <= 0x297F   { (92, "Supplemental Arrows-B") }
  else if t <= 0x29FF   { (93, "Miscellaneous Mathematical Symbols-B") }
  else if t <= 0x2AFF   { (94, "Supplemental Mathematical Operators") }
  else if t <= 0x2BFF   { (95, "Miscellaneous Symbols and Arrows") }
  else if t <= 0x2C5F   { (96, "Glagolitic") }
  else if t <= 0x2C7F   { (97, "Latin Extended-C") }
  else if t <= 0x2CFF   { (98, "Coptic") }
  else if t <= 0x2D2F   { (99, "Georgian Supplement") }
  else if t <= 0x2D7F   { (100, "Tifinagh") }
  else if t <= 0x2DDF   { (101, "Ethiopic Extended") }
  else if t <= 0x2DFF   { (102, "Cyrillic Extended-A") }
  else if t <= 0x2E7F   { (103, "Supplemental Punctuation") }
  else if t <= 0x2EFF   { (104, "CJK Radicals Supplement") }
  else if t <= 0x2FDF   { (105, "Kangxi Radicals") }
  else if t <= 0x2FFF   { (106, "Ideographic Description Characters") }
  else if t <= 0x303F   { (107, "CJK Symbols and Punctuation") }
  else if t <= 0x309F   { (108, "Hiragana") }
  else if t <= 0x30FF   { (109, "Katakana") }
  else if t <= 0x312F   { (110, "Bopomofo") }
  else if t <= 0x318F   { (111, "Hangul Compatibility Jamo") }
  else if t <= 0x319F   { (112, "Kanbun") }
  else if t <= 0x31BF   { (113, "Bopomofo Extended") }
  else if t <= 0x31EF   { (114, "CJK Strokes") }
  else if t <= 0x31FF   { (115, "Katakana Phonetic Extensions") }
  else if t <= 0x32FF   { (116, "Enclosed CJK Letters and Months") }
  else if t <= 0x33FF   { (117, "CJK Compatibility") }
  else if t <= 0x4DBF   { (118, "CJK Unified Ideographs Extension A") }
  else if t <= 0x4DFF   { (119, "Yijing Hexagram Symbols") }
  else if t <= 0x9FFF   { (120, "CJK Unified Ideographs") }
  else if t <= 0xA48F   { (121, "Yi Syllables") }
  else if t <= 0xA4CF   { (122, "Yi Radicals") }
  else if t <= 0xA4FF   { (123, "Lisu") }
  else if t <= 0xA63F   { (124, "Vai") }
  else if t <= 0xA69F   { (125, "Cyrillic Extended-B") }
  else if t <= 0xA6FF   { (126, "Bamum") }
  else if t <= 0xA71F   { (127, "Modifier Tone Letters") }
  else if t <= 0xA7FF   { (128, "Latin Extended-D") }
  else if t <= 0xA82F   { (129, "Syloti Nagri") }
  else if t <= 0xA83F   { (130, "Common Indic Number Forms") }
  else if t <= 0xA87F   { (131, "Phags-pa") }
  else if t <= 0xA8DF   { (132, "Saurashtra") }
  else if t <= 0xA8FF   { (133, "Devanagari Extended") }
  else if t <= 0xA92F   { (134, "Kayah Li") }
  else if t <= 0xA95F   { (135, "Rejang") }
  else if t <= 0xA97F   { (136, "Hangul Jamo Extended-A") }
  else if t <= 0xA9DF   { (137, "Javanese") }
  else if t <= 0xA9FF   { (138, "Myanmar Extended-B") }
  else if t <= 0xAA5F   { (139, "Cham") }
  else if t <= 0xAA7F   { (140, "Myanmar Extended-A") }
  else if t <= 0xAADF   { (141, "Tai Viet") }
  else if t <= 0xAAFF   { (142, "Meetei Mayek Extensions") }
  else if t <= 0xAB2F   { (143, "Ethiopic Extended-A") }
  else if t <= 0xAB6F   { (144, "Latin Extended-E") }
  else if t <= 0xABBF   { (145, "Cherokee Supplement") }
  else if t <= 0xABFF   { (146, "Meetei Mayek") }
  else if t <= 0xD7AF   { (147, "Hangul Syllables") }
  else if t <= 0xD7FF   { (148, "Hangul Jamo Extended-B") }
  else if t <= 0xDB7F   { (149, "High Surrogates") }
  else if t <= 0xDBFF   { (150, "High Private Use Surrogates") }
  else if t <= 0xDFFF   { (151, "Low Surrogates") }
  else if t <= 0xF8FF   { (152, "Private Use Area") }
  else if t <= 0xFAFF   { (153, "CJK Compatibility Ideographs") }
  else if t <= 0xFB4F   { (154, "Alphabetic Presentation Forms") }
  else if t <= 0xFDFF   { (155, "Arabic Presentation Forms-A") }
  else if t <= 0xFE0F   { (156, "Variation Selectors") }
  else if t <= 0xFE1F   { (157, "Vertical Forms") }
  else if t <= 0xFE2F   { (158, "Combining Half Marks") }
  else if t <= 0xFE4F   { (159, "CJK Compatibility Forms") }
  else if t <= 0xFE6F   { (160, "Small Form Variants") }
  else if t <= 0xFEFF   { (161, "Arabic Presentation Forms-B") }
  else if t <= 0xFFEF   { (162, "Halfwidth and Fullwidth Forms") }
  else if t <= 0xFFFF   { (163, "Specials") }
  else if t <= 0x1007F  { (164, "Linear B Syllabary") }
  else if t <= 0x100FF  { (165, "Linear B Ideograms") }
  else if t <= 0x1013F  { (166, "Aegean Numbers") }
  else if t <= 0x1018F  { (167, "Ancient Greek Numbers") }
  else if t <= 0x101CF  { (168, "Ancient Symbols") }
  else if t <= 0x101FF  { (169, "Phaistos Disc") }
  else if t <= 0x1029F  { (170, "Lycian") }
  else if t <= 0x102DF  { (171, "Carian") }
  else if t <= 0x102FF  { (172, "Coptic Epact Numbers") }
  else if t <= 0x1032F  { (173, "Old Italic") }
  else if t <= 0x1034F  { (174, "Gothic") }
  else if t <= 0x1037F  { (175, "Old Permic") }
  else if t <= 0x1039F  { (176, "Ugaritic") }
  else if t <= 0x103DF  { (177, "Old Persian") }
  else if t <= 0x1044F  { (178, "Deseret") }
  else if t <= 0x1047F  { (179, "Shavian") }
  else if t <= 0x104AF  { (180, "Osmanya") }
  else if t <= 0x104FF  { (181, "Osage") }
  else if t <= 0x1052F  { (182, "Elbasan") }
  else if t <= 0x1056F  { (183, "Caucasian Albanian") }
  else if t <= 0x1077F  { (184, "Linear A") }
  else if t <= 0x1083F  { (185, "Cypriot Syllabary") }
  else if t <= 0x1085F  { (186, "Imperial Aramaic") }
  else if t <= 0x1087F  { (187, "Palmyrene") }
  else if t <= 0x108AF  { (188, "Nabataean") }
  else if t <= 0x108FF  { (189, "Hatran") }
  else if t <= 0x1091F  { (190, "Phoenician") }
  else if t <= 0x1093F  { (191, "Lydian") }
  else if t <= 0x1099F  { (192, "Meroitic Hieroglyphs") }
  else if t <= 0x109FF  { (193, "Meroitic Cursive") }
  else if t <= 0x10A5F  { (194, "Kharoshthi") }
  else if t <= 0x10A7F  { (195, "Old South Arabian") }
  else if t <= 0x10A9F  { (196, "Old North Arabian") }
  else if t <= 0x10AFF  { (197, "Manichaean") }
  else if t <= 0x10B3F  { (198, "Avestan") }
  else if t <= 0x10B5F  { (199, "Inscriptional Parthian") }
  else if t <= 0x10B7F  { (200, "Inscriptional Pahlavi") }
  else if t <= 0x10BAF  { (201, "Psalter Pahlavi") }
  else if t <= 0x10C4F  { (202, "Old Turkic") }
  else if t <= 0x10CFF  { (203, "Old Hungarian") }
  else if t <= 0x10D3F  { (204, "Hanifi Rohingya") }
  else if t <= 0x10E7F  { (205, "Rumi Numeral Symbols") }
  else if t <= 0x10EBF  { (206, "Yezidi") }
  else if t <= 0x10F2F  { (207, "Old Sogdian") }
  else if t <= 0x10F6F  { (208, "Sogdian") }
  else if t <= 0x10FDF  { (209, "Chorasmian") }
  else if t <= 0x10FFF  { (210, "Elymaic") }
  else if t <= 0x1107F  { (211, "Brahmi") }
  else if t <= 0x110CF  { (212, "Kaithi") }
  else if t <= 0x110FF  { (213, "Sora Sompeng") }
  else if t <= 0x1114F  { (214, "Chakma") }
  else if t <= 0x1117F  { (215, "Mahajani") }
  else if t <= 0x111DF  { (216, "Sharada") }
  else if t <= 0x111FF  { (217, "Sinhala Archaic Numbers") }
  else if t <= 0x1124F  { (218, "Khojki") }
  else if t <= 0x112AF  { (219, "Multani") }
  else if t <= 0x112FF  { (220, "Khudawadi") }
  else if t <= 0x1137F  { (221, "Grantha") }
  else if t <= 0x1147F  { (222, "Newa") }
  else if t <= 0x114DF  { (223, "Tirhuta") }
  else if t <= 0x115FF  { (224, "Siddham") }
  else if t <= 0x1165F  { (225, "Modi") }
  else if t <= 0x1167F  { (226, "Mongolian Supplement") }
  else if t <= 0x116CF  { (227, "Takri") }
  else if t <= 0x1173F  { (228, "Ahom") }
  else if t <= 0x1184F  { (229, "Dogra") }
  else if t <= 0x118FF  { (230, "Warang Citi") }
  else if t <= 0x1195F  { (231, "Dives Akuru") }
  else if t <= 0x119FF  { (232, "Nandinagari") }
  else if t <= 0x11A4F  { (233, "Zanabazar Square") }
  else if t <= 0x11AAF  { (234, "Soyombo") }
  else if t <= 0x11AFF  { (235, "Pau Cin Hau") }
  else if t <= 0x11C6F  { (236, "Bhaiksuki") }
  else if t <= 0x11CBF  { (237, "Marchen") }
  else if t <= 0x11D5F  { (238, "Masaram Gondi") }
  else if t <= 0x11DAF  { (239, "Gunjala Gondi") }
  else if t <= 0x11EFF  { (240, "Makasar") }
  else if t <= 0x11FBF  { (241, "Lisu Supplement") }
  else if t <= 0x11FFF  { (242, "Tamil Supplement") }
  else if t <= 0x123FF  { (243, "Cuneiform") }
  else if t <= 0x1247F  { (244, "Cuneiform Numbers and Punctuation") }
  else if t <= 0x1254F  { (245, "Early Dynastic Cuneiform") }
  else if t <= 0x1342F  { (246, "Egyptian Hieroglyphs") }
  else if t <= 0x1343F  { (247, "Egyptian Hieroglyph Format Controls") }
  else if t <= 0x1467F  { (248, "Anatolian Hieroglyphs") }
  else if t <= 0x16A3F  { (249, "Bamum Supplement") }
  else if t <= 0x16A6F  { (250, "Mro") }
  else if t <= 0x16AFF  { (251, "Bassa Vah") }
  else if t <= 0x16B8F  { (252, "Pahawh Hmong") }
  else if t <= 0x16E9F  { (253, "Medefaidrin") }
  else if t <= 0x16F9F  { (254, "Miao") }
  else if t <= 0x16FFF  { (255, "Ideographic Symbols and Punctuation") }
  else if t <= 0x187FF  { (256, "Tangut") }
  else if t <= 0x18AFF  { (257, "Tangut Components") }
  else if t <= 0x18CFF  { (258, "Khitan Small Script") }
  else if t <= 0x18D8F  { (259, "Tangut Supplement") }
  else if t <= 0x1B0FF  { (260, "Kana Supplement") }
  else if t <= 0x1B12F  { (261, "Kana Extended-A") }
  else if t <= 0x1B16F  { (262, "Small Kana Extension") }
  else if t <= 0x1B2FF  { (263, "Nushu") }
  else if t <= 0x1BC9F  { (264, "Duployan") }
  else if t <= 0x1BCAF  { (265, "Shorthand Format Controls") }
  else if t <= 0x1D0FF  { (266, "Byzantine Musical Symbols") }
  else if t <= 0x1D1FF  { (267, "Musical Symbols") }
  else if t <= 0x1D24F  { (268, "Ancient Greek Musical Notation") }
  else if t <= 0x1D2FF  { (269, "Mayan Numerals") }
  else if t <= 0x1D35F  { (270, "Tai Xuan Jing Symbols") }
  else if t <= 0x1D37F  { (271, "Counting Rod Numerals") }
  else if t <= 0x1D7FF  { (272, "Mathematical Alphanumeric Symbols") }
  else if t <= 0x1DAAF  { (273, "Sutton SignWriting") }
  else if t <= 0x1E02F  { (274, "Glagolitic Supplement") }
  else if t <= 0x1E14F  { (275, "Nyiakeng Puachue Hmong") }
  else if t <= 0x1E2FF  { (276, "Wancho") }
  else if t <= 0x1E8DF  { (277, "Mende Kikakui") }
  else if t <= 0x1E95F  { (278, "Adlam") }
  else if t <= 0x1ECBF  { (279, "Indic Siyaq Numbers") }
  else if t <= 0x1ED4F  { (280, "Ottoman Siyaq Numbers") }
  else if t <= 0x1EEFF  { (281, "Arabic Mathematical Alphabetic Symbols") }
  else if t <= 0x1F02F  { (282, "Mahjong Tiles") }
  else if t <= 0x1F09F  { (283, "Domino Tiles") }
  else if t <= 0x1F0FF  { (284, "Playing Cards") }
  else if t <= 0x1F1FF  { (285, "Enclosed Alphanumeric Supplement") }
  else if t <= 0x1F2FF  { (286, "Enclosed Ideographic Supplement") }
  else if t <= 0x1F5FF  { (287, "Miscellaneous Symbols and Pictographs") }
  else if t <= 0x1F64F  { (288, "Emoticons") }
  else if t <= 0x1F67F  { (289, "Ornamental Dingbats") }
  else if t <= 0x1F6FF  { (290, "Transport and Map Symbols") }
  else if t <= 0x1F77F  { (291, "Alchemical Symbols") }
  else if t <= 0x1F7FF  { (292, "Geometric Shapes Extended") }
  else if t <= 0x1F8FF  { (293, "Supplemental Arrows-C") }
  else if t <= 0x1F9FF  { (294, "Supplemental Symbols and Pictographs") }
  else if t <= 0x1FA6F  { (295, "Chess Symbols") }
  else if t <= 0x1FAFF  { (296, "Symbols and Pictographs Extended-A") }
  else if t <= 0x1FBFF  { (297, "Symbols for Legacy Computing") }
  else if t <= 0x2A6DF  { (298, "CJK Unified Ideographs Extension B") }
  else if t <= 0x2B73F  { (299, "CJK Unified Ideographs Extension C") }
  else if t <= 0x2B81F  { (300, "CJK Unified Ideographs Extension D") }
  else if t <= 0x2CEAF  { (301, "CJK Unified Ideographs Extension E") }
  else if t <= 0x2EBEF  { (302, "CJK Unified Ideographs Extension F") }
  else if t <= 0x2FA1F  { (303, "CJK Compatibility Ideographs Supplement") }
  else if t <= 0x3134F  { (304, "CJK Unified Ideographs Extension G") }
  else if t <= 0xE007F  { (305, "Tags") }
  else if t <= 0xE01EF  { (306, "Variation Selectors Supplement") }
  else if t <= 0xFFFFF  { (307, "Supplementary Private Use Area-A") }
  else if t <= 0x10FFFF { (308, "Supplementary Private Use Area-B") }
}
#let codepoint = int(sys.inputs.at("t", default: 0x4ee0))
#let (col, block) = det(codepoint)
#let colour = (
  red,
  blue,
  green,
  yellow,
  purple,
  orange,
  maroon,
  olive,
  aqua,
  fuchsia,
  eastern,
  teal,
).at(calc.rem(col, 12))
#let int2hexstr(num) = {
  if num == 0 { return "0" }

  let hex-digits = "0123456789ABCDEF"
  let result = ""
  let n = num

  while n > 0 {
    result = hex-digits.at(calc.rem(n, 16)) + result
    n = calc.quo(n, 16)
  }

  return result
}
#set text(font: (), size: 5in, fill: colour.mix(black), weight: 800)
#set page(width: 16in, height: 9in, fill: colour.mix(gray))
#place(center + horizon, str.from-unicode(codepoint))
#place(bottom + left, text(size: .6in, [
  #{
    (
      "U+" + int2hexstr(codepoint)
    )
  } \
  #block
]))
