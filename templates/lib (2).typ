#let plg = plugin("cjk_num_format.wasm")
#set text(font: "Sarasa Mono SC", lang: "en", region: "cn")
#let sep-by-thousands(value, separators: none, lang: none, region: none) = context {
  str(
    plg.sep_by_thousands(
      cbor.encode((
        lang: if lang == none { text.lang } else { lang },
        region: if region == none { text.region } else { region },
        value: value,
        separators: separators,
      )),
    ),
  )
}

#sep-by-thousands(1140001123001230102)元
