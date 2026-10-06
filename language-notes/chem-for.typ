/*
  name: chem-for
  author: RedJACK
  email: jackonessalad@qq.com
  version: v0.1
*/

// 判断是否为英文字符
#let isAlpha = (c) => {
  return c >= "a" and c <= "z" or c >= "A" and c <= "Z"
}

// 判断是否为数字字符
#let isDigit = (c) => {
  return c >= "0" and c <= "9"
}

// 化学式显示
#let ca = (s) => {
  set text(font: "linux libertine")
  let res = []
  let f = false
  let p = false
  for c in s {
    if c == " " {
      f = false
    } else if c == "^" {
      f = true
      continue
    }
    if not p {
      if isAlpha(c) {
        p = true
      } else {
        res += [#c]
        continue
      }
    }
    if f {
      res += [#super[#c]]
    } else {
      if c == "<" {
        res += [$arrow.b$]
      } else if c == ">" {
        res += [$arrow.t$]
      } else if c == "." {
        res += [$dot$]
      } else if c == "+" or c == "-" {
        res += [#super[#c]]
      } else if isDigit(c) {
        res += [#sub[#c]]
      } else {
        res += [#c]
      }
    }
  }
  res
}

// 化学方程式显示
#let cb = (s, a: none, b: none) => {
  let ss = s.split(" ")
  let sym = $=$
  if "->" in s {
    sym = $arrow.r.long$
  } else if "<=>" in s {
    sym = $harpoons.rtlb$
  }
  for sa in ss {
    if sa == "=" or sa == "->" or sa == "<=>" {
      if a != none and b != none {
        [$#sym^(#a)_(#b)$ ]
      } else if a != none {
        [$#sym^scripts(#a)$ ]
      } else {
        [$#sym$ ]
      }
    } else {
      [#ca(sa) ]
    }
  }
}