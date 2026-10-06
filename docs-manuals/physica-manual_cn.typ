// 版权所有 2023 Leedehai
// 本文档按 Creative Commons BY-ND 4.0 许可共享。
#import "physica.typ": *

#let version = "0.9.5"

#set document(

  title: [physica-manual.typ],
  author: ("Leedehai"),
  // 禁止将创建日期写入 PDF 元数据，确保相同 *.typ
  // 文件内容生成完全一致的 *.pdf 二进制文件。
  date: none,
  
)

// ——— 字体与常用包 ————————————————————————————
#import "@preview/showybox:2.0.4": showybox
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/ctheorems:1.1.3": *
#import "@preview/mitex:0.2.5": *


// 设置正文字体（英 / 中）、代码字体
#set text(font: ("Linux Libertine", "Noto Serif SC"), 12pt, lang: "zh", region: "cn")
#show raw: set text(font: "DejaVu Sans Mono", 10pt)

// 中文粗体、斜体效果
#show strong: set text(fill: black, font: ("Linux Libertine", "Noto Sans CJK SC"))
#show emph: set text(font: ("Linux Libertine", "Noto Sans CJK SC"))
// ————————————————————————————————————————————————


#set page(
  numbering: "1/1",
  header: align(right)[#text(8pt)[`physica` 包\ 版本 #version]],
)

#set heading(numbering: "1.")

#align(center, text(16pt)[*`physica` 包*])

#let linkurl(s, url) = {
  link(url)[#underline(text(fill: blue, s))]
}

#align(center)[
  Leedehai \
  #linkurl("GitHub", "https://github.com/leedehai/typst-physics") |
  #linkurl("Typst", "https://typst.app/docs/packages/")
]

#set par(justify: true)

#v(1em)

#align(center)[
/ physica: _noun_. Latin, study of nature.
]

#v(1em)

#outline(indent: auto)
#pagebreak(weak: true)

= 介绍

#v(1em)

#linkurl("Typst", "https://typst.app") 是一个排版框架，目标成为下一代 LATEX 替代品。它在友好的用户体验与高性能方面表现出色。

`physica` 包提供了便捷的 Typst 排版函数，使自然科学领域的学术写作更简单、更快捷，减少大量复杂且重复的表达。

本手册即使用 Typst CLI 与 `physica` 包生成，希望通过本文档自证该包用法。

= 使用 `physica`

#v(1em)

借助 `typst` 的 #linkurl("包管理", "https://github.com/typst/packages")：

```typst
#import "@preview/physica:0.9.5": *

$ curl (grad f), pdv(,x,y,z,[2,k]), tensor(Gamma,+k,-i,-j) = pdv(vb(e_i),x^j)vb(e^k) $
```

$ curl (grad f), pdv(,x,y,z,[2,k]), tensor(Gamma,+k,-i,-j)=pdv(vb(e_i),x^j)vb(e^k) $

= 符号一览

#v(1em)

// 若符号后还有别的符号，请先放上标。
#let builtin(symbol) = [#super(text(fill: blue, "typst "))#symbol]

#let hl(s) = {  // 高亮用法：hl("...") 或 hl(`...`)
  show regex("#\(.+?\)|#(\d|\w)+"): set text(eastern)
  show regex("\[|\]"): set text(red)
  show regex("\w+:"): set text(blue)
  show regex(";"): set text(red, weight: "bold")
  s
}

#let SUM = $limits(sum)_(i=0)^n i$

部分符号已由 Typst 内置，这里仅为完整性列出，并以 #builtin([`this`]) 注明，方便从 LATEX 转来的用户了解 Typst 已自带这些符号。

所有符号需在*数学模式* `$...$` 中使用。

== 括号

#v(1em)

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  stroke: none,
  [*符号*], [*缩写*], [*示例*], [*说明*],

  [#builtin([`abs(`_content_`)`])],
  [],
  [`abs(phi(x))`   #sym.arrow $abs(phi(x))$],
  [绝对值],

  [#builtin([`norm(`_content_`)`])],
  [],
  [`norm(phi(x))`   #sym.arrow $norm(phi(x))$],
  [范数],

  [`Order(`_content_`)`],
  [],
  [`Order(x^2)`   #sym.arrow $Order(x^2)$],
  [大 O 符号],

  [`order(`_content_`)`],
  [],
  [`order(1)`   #sym.arrow $order(1)$],
  [小 o 符号],

  [`Set(`_content_`)`],
  [],
  [
    `Set(a_n), Set(a_i, forall i)` \ #sym.arrow $Set(a_n), Set(a_i, forall i)$ \
    `Set(vec(1,n), forall n)` \ #sym.arrow $Set(vec(1,n), forall n)$
  ],
  [数学集合；`Set` 不能用小写，`set` 为 Typst 关键字],

  [`evaluated(`_content_`)`],
  [],
  [
    `evaluated(f(x))_0^oo` \ #sym.arrow $evaluated(f(x))_0^oo$ \
    `evaluated(f(x)/g(x))_0^1` \ #sym.arrow $evaluated(f(x)/g(x))_0^1$
  ],
  [右侧竖线表示取值区间],

  [`expectationvalue`],
  [`expval`],
  [
    `expval(u)`  #sym.arrow $expval(u)$ \
    `expval(p,psi)`  #sym.arrow $expval(p,psi)$ \
  ],
  [期望值；见下方 Dirac 记号],
)

== 向量记号

#v(1em)

#table(
  columns: (5fr, 2fr, auto, 5fr),
  align: left,
  stroke: none,
  [*符号*], [*缩写*], [*示例*], [*说明*],

  [#builtin([`vec(`...`)`])],
  [],
  [`vec(1,2)` #sym.arrow $vec(1,2)$],
  [列向量],

  [`vecrow(`...`)`],
  [],
  [
    `vecrow(alpha, b)` \ #sym.arrow $vecrow(alpha, b)$ \
    `vecrow(sum_0^n i, b, delim:"[")` \ #sym.arrow $vecrow(sum_0^n i,b,delim:"[")$ \
  ],
  [行向量],

  [`TT`],
  [],
  [`v^TT, A^TT` #sym.arrow $v^TT, A^TT$],
  [转置，见 @matrix-transpose],

  [`vectorbold(`_content_`)`],
  [`vb`],
  [`vb(a),vb(mu_1)` #sym.arrow $vb(a),vb(mu_1)$],
  [粗体向量],

  [`vectorunit(`_content_`)`],
  [`vu`],
  [`vu(a),vu(mu_1)` #sym.arrow $vu(a),vu(mu_1)$],
  [单位向量],

  [`vectorarrow(`_content_`)`],
  [`va`],
  [`va(a),va(mu_1)` #sym.arrow $va(a),va(mu_1)$],
  [箭头向量 \ #sub[(非粗体，参见 ISO 80000‑2:2019)]],

  [`grad`],
  [],
  [`grad f` #sym.arrow $grad f$],
  [梯度],

  [`div`],
  [],
  [`div vb(E)` #sym.arrow $div vb(E)$],
  [散度],

  [`curl`],
  [],
  [`curl vb(B)` #sym.arrow $curl vb(B)$],
  [旋度],

  [`laplacian`],
  [],
  [`diaer(u) = c^2 laplacian u` \ #sym.arrow $diaer(u) = c^2 laplacian u$],
  [拉普拉斯算子，非 #builtin(`laplace`)],

  [`dotproduct`],
  [`dprod`],
  [`a dprod b` #sym.arrow $a dprod b$],
  [点积],

  [`crossproduct`],
  [`cprod`],
  [`a cprod b` #sym.arrow $a cprod b$],
  [叉积],

  [`innerproduct`],
  [`iprod`],
  [
    `iprod(u, v)` #sym.arrow $iprod(u, v)$ \
    `iprod(sum_i a_i, b)` \ #sym.arrow $iprod(sum_i a_i, b)$
  ],
  [内积],
)









//PART2

== 矩阵记号

#v(1em)

=== 行列式、（反）对角阵、单位阵、零矩阵

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  stroke: none,
  [*符号*], [*缩写*], [*示例*], [*说明*],

  [`TT`],
  [],
  [`v^TT, A^TT` #sym.arrow $v^TT, A^TT$],
  [转置，见 @matrix-transpose],

  [#builtin([`mat(`...`)`])],
  [],
  [`mat(1,2;3,4)` #sym.arrow $mat(1,2;3,4)$],
  [矩阵],

  [`matrixdet(`...`)`],
  [`mdet`],
  [
    #hl(`mdet(1,x;1,y)`) #sym.arrow $mdet(1,x;1,y)$
  ],
  [行列式],

  [`diagonalmatrix(`...`)`],
  [`dmat`],
  [
    `dmat(1,2)` #sym.arrow $dmat(1,2)$ \
    #hl(`dmat(1,a,xi,delim:"[",fill:0)`) \ #sym.arrow $dmat(1,a,xi,delim:"[",fill:0)$
  ],
  [对角矩阵],

  [`antidiagonalmatrix(`...`)`],
  [`admat`],
  [
    `admat(1,2)` #sym.arrow $admat(1,2)$ \
    #hl(`admat(1,a,xi,delim:"[",fill:dot)`) \ #sym.arrow $admat(1,a,xi,delim:"[",fill:dot)$
  ],
  [反对角矩阵],

  [`identitymatrix(`...`)`],
  [`imat`],
  [
    `imat(2)` #sym.arrow $imat(2)$ \
    #hl(`imat(3,delim:"[",fill:*)`) #sym.arrow \ $imat(3,delim:"[",fill:*)$
  ],
  [单位矩阵],

  [`zeromatrix(`...`)`],
  [`zmat`],
  [
    `zmat(2)` #sym.arrow $zmat(2)$ \
    #hl(`zmat(3,delim:"[")`) #sym.arrow \ $zmat(3,delim:"[")$
  ],
  [零矩阵],
)

=== 雅可比矩阵

`jacobianmatrix(`...`)`，即 `jmat(`...`)`。

#table(
  columns: (25%, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    \ Typst（与 LaTeX 类似）在矩阵中会压缩分式…
  ],
  [
    #hl(`jmat(f_1,f_2; x,y)`)
    $ jmat(f_1,f_2;x,y) $
  ],
  [
    #hl(`jmat(f,g; x,y,z; delim:"[")`)
    $ jmat(f,g;x,y,z;delim:"[") $
  ],
  [
    \ …但可通过参数 #hl(`big:#true`) 取消压缩
  ],
  [
    #hl(`jmat(f_1,f_2;x,y;big:#true)`)
    $ jmat(f_1,f_2;x,y;big:#true) $
  ],
  [
    #hl(`jmat(f,g;x,y,z;delim:"|",big:#true)`)
    $ jmat(f,g;x,y,z;delim:"|",big:#true) $
  ],
)

=== 赫塞矩阵

`hessianmatrix(`...`)`，即 `hmat(`...`)`。

#table(
  columns: (25%, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    \ Typst（与 LaTeX 类似）在矩阵中会压缩分式…
  ],
  [
    #hl(`hmat(f; x,y)`)
    $ hmat(f; x,y) $
  ],
  [
    #hl(`hmat(; x,y,z; delim:"[")`)
    $ hmat(; x,y,z; delim:"[") $
  ],
  [
    \ …但可通过参数 #hl(`big:#true`) 取消压缩
  ],
  [
    #hl(`hmat(f;x,y;big:#true)`)
    $ hmat(f;x,y;big:#true) $
  ],
  [
    #hl(`hmat(;x,y,z;delim:"|",big:#true)`)
    $ hmat(; x,y,z;delim:"|",big:#true) $
  ],
)

=== 带元素生成函数的矩阵

`xmatrix(`_m, n, func_`)`，即 `xmat(`...`)`。元素生成函数 _func_ 接收从 1 开始的行号、列号。

#table(
  columns: (auto, auto),
  align: left,
  stroke: none,
  column-gutter: 1em,

  [
#hl(`#let g = (i,j) => $g^(#(i - 1)#(j - 1))$
xmat(2, 2, #g)`)
    $ #let g = (i,j) => $g^(#(i - 1)#(j - 1))$
    xmat(2, 2, #g) $
  ],
)

=== 旋转矩阵（2D 与 3D）

#table(
  columns: (auto, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    #hl(`rot2mat(theta)`)
    $ rot2mat(theta) $
  ],
  [
    #hl(`rot2mat(-a/2,delim:"[")`)
    $ rot2mat(-a/2, delim:"[") $
  ],
  [
    #hl(`rot2mat(display(a/2),delim:"[")`)
    $ rot2mat(display(a/2),delim:"[") $
  ],

  [
    #hl(`rot3xmat(theta)`)
    $ rot3xmat(theta) $
  ],
  [
    #hl(`rot3ymat(45^degree)`)
    $ rot3ymat(45^degree) $
  ],
  [
    #hl(`rot3zmat(theta,delim:"[")`)
    $ rot3zmat(theta,delim:"[") $
  ],
)

=== Gram 矩阵

#table(
  columns: (auto, auto, auto),
  align: center,
  stroke: none,
  column-gutter: 1em,

  [
    #hl(`grammat(alpha,beta)`)
    $ grammat(alpha, beta) $
  ],
  [
    #hl(`grammat(v_1,v_2,v_3, delim:"[")`)
    $ grammat(v_1,v_2,v_3, delim:"[") $
  ],
  [
    #hl(`grammat(v_1,v_2, norm:#true)`)
    $ grammat(v_1,v_2, norm:#true) $
  ],
)

//PART3

== Dirac 符号记法 <dirac-braket>

#v(1em)

#table(
  columns: (auto, 1fr, 6fr, 3fr),
  align: left,
  stroke: none,
  [*符号*], [*缩写*], [*示例*], [*说明*],

  [`bra(`_content_`)`],
  [],
  [
    `bra(u)`  #sym.arrow $bra(u)$ \
    `bra(vec(1,2))` #sym.arrow $bra(vec(1,2))$
  ],
  [Bra],

  [`ket(`_content_`)`],
  [],
  [
    `ket(u)`  #sym.arrow $ket(u)$ \
    `ket(vec(1,2))` #sym.arrow $ket(vec(1,2))$
  ],
  [Ket],

  [`braket(`..`)`],
  [],
  [
    `braket(a), braket(u, v)` \ #sym.arrow $braket(a), braket(u, v)$ \
    `braket(psi,A/N,phi)` #sym.arrow $braket(psi,A/N,phi)$
  ],
  [Braket，可接 1 / 2 / 3 个参数],

  [`ketbra(`..`)`],
  [],
  [
    `ketbra(a), ketbra(u, v)` \ #sym.arrow $ketbra(a), ketbra(u, v)$ \
    `ketbra(a/N, b)` #sym.arrow $ketbra(a/N, b)$
  ],
  [Ketbra，可接 1 或 2 个参数],

  [`expval(`_content_`)`],
  [],
  [
    `expval(u)`  #sym.arrow $expval(u)$ \
    `expval(A,psi)` #sym.arrow $expval(A,psi)$
  ],
  [期望值],

  [`matrixelement(`..`)`],
  [`mel`],
  [
    `mel(n, partial_nu H, m)` \ #sym.arrow $mel(n, partial_nu H, m)$
  ],
  [矩阵元，同 `braket(n,M,n)`],
)


//PART4

== 数学函数

#v(1em)

Typst 内置数学运算符：#linkurl(`math.op`, "https://typst.app/docs/reference/math/op/")。

#table(
  columns: (auto, auto),
  align: left,
  stroke: none,
  column-gutter: 25pt,
  [*表达式*], [*结果*],

  [`sin(x), sinh(x), arcsin(x), asin(x)`],
  [$sin(x), sinh(x), arcsin(x), asin(x)$],

  [`cos(x), cosh(x), arccos(x), acos(x)`],
  [$cos(x), cosh(x), arccos(x), acos(x)$],

  [`tan(x), tanh(x), arctan(x), atan(x)`],
  [$tan(x), tanh(x), arctan(x), atan(x)$],

  [`sec(x), sech(x), arcsec(x), asec(x)`],
  [$sec(x), sech(x), arcsec(x), asec(x)$],

  [`csc(x), csch(x), arccsc(x), acsc(x)`],
  [$csc(x), csch(x), arccsc(x), acsc(x)$],

  [`cot(x), coth(x), arccot(x), acot(x)`],
  [$cot(x), coth(x), arccot(x), acot(x)$],
)

#table(
  columns: (3fr, 3fr, 4fr),
  align: left,
  stroke: none,
  [*表达式*], [*结果*], [*说明*],

  [#builtin([`Pr(x)`])],
  [$Pr(x)$],
  [概率],

  [#builtin([`exp x`])],
  [$exp x$],
  [指数],

  [#builtin([`log x, lg x, ln x`])],
  [$log x, lg x, ln x$],
  [对数],

  [`lb x`],
  [$lb x$],
  [二进制对数],

  [#builtin([`det A`])],
  [$det A$],
  [行列式],

  [`diag(-1,1,1,1)`],
  [$diag(-1,1,1,1)$],
  [对角矩阵（紧凑记法；若需完整矩阵形式用 `dmat`）],

  [`trace A, tr A`],
  [$trace A, tr A$],
  [迹],

  [`Trace A, Tr A`],
  [$Trace A, Tr A$],
  [迹（另一写法）],

  [`rank A`],
  [$rank A$],
  [矩阵秩],

  [`erf(x)`],
  [$erf(x)$],
  [高斯误差函数],

  [`Res A`],
  [$Res A$],
  [留数（复分析）],

  [`Re z, Im z`],
  [$Re z, Im z$],
  [实部、虚部（复分析）],

  [`sgn x`],
  [$sgn x$],
  [符号函数],
)

== 微分与导数

#v(1em)

#table(
  columns: (auto, 1fr, 6fr, 5fr),
  align: left,
  stroke: none,
  [*符号*], [*缩写*], [*示例*], [*说明*],

  [`differential(`...`)`],
  [`dd`],
  [
    例如 $dd(f), dd(x,y), dd(x,3), dd(x,y,p:and)$ \
    参见 @differentials
  ],
  [微分],

  [`variation(`...`)`],
  [`var`],
  [
    `var(f)` #sym.arrow $var(f)$ \
    `var(x,y)` #sym.arrow $var(x,y)$ \
  ],
  [变分，等价于 `dd(..., d: delta)`],

  [`difference(`...`)`],
  [],
  [
    `difference(f)` #sym.arrow $difference(f)$ \
    `difference(x,y)` #sym.arrow $difference(x,y)$ \
  ],
  [差分，等价于 `dd(..., d: Delta)`],

  [`derivative(`...`)`],
  [`dv`],
  [
    例如 $dv(,x), dv(f,x), dv(f,x,k,d:Delta), dv(f,x,s:\/)$ \
    参见 @ordinary-derivatives
  ],
  [导数],

  [`partialderivative(`...`)`],
  [`pdv`],
  [
    例如 $pdv(,x), pdv(f,x), pdv(f,x,y,2), pdv(f,x,y,[2,3]), pdv(f,x,s:\/)$ \
    参见 @partial-derivatives
  ],
  [偏导，可混阶],
)

=== 微分 <differentials>

#v(1em)

函数：`differential(`\*_args_, \*\*_kwargs_`)`，缩写为 `dd(`...`)`  
- 位置参数 _args_: 变量名，可*选*跟阶数，如 `2`，或阶数组 `[2,3]`、`[k]`、`[m n, lambda+1]`。  
- 关键字参数 _kwargs_:  
  - `d`: 微分符号 [默认 `upright(d)`]；  
  - `p`: 各分量之间的乘号 [默认 `none`]；  
  - `compact`: 仅当 `p` 为 `none` 时生效；`#true` 时移除 TeXBook 建议的 d 之间细空格 [默认 `#false`]。  

TeXBook 建议在 dx, dy 前加细空格以美观（第 18 章 p.168）。若不想加空格，可用 `compact:#true`：$dd(r,theta)$ vs. $dd(r,theta,compact:#true)$。  

*阶数分配算法*  
- 无阶数 → 所有变量阶为 1；  
- 单数字阶 → 每变量同阶；  
- 阶数组 → 顺序赋阶；不足部分 → 余下变量阶为 1；  
- 阶为 1 时渲染为 $upright(d) x$，不显示指数 1。  

#align(center, [*示例*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`dd(f), f(r,theta) dd(r,theta)`) \
    $ dd(f), f(r,theta) dd(r,theta) $
  ],
  [
    *(2)* #hl(`dd(x,3), dd(f,[k]), dd(f,[k],d:delta)`) \
    $ dd(x,3), dd(f,[k]), dd(f,[k],d:delta) $
  ],
  [
    *(3)* #hl(`dd(f,2), dd(vb(x),t,[3,])`) \
    $ dd(f,2), dd(vb(x),t,[3,]) $
  ],
  [
    *(4)* #hl(`dd(x,y), dd(x,y,[2,3]), dd(x,y,z,[2,3])`) \
    $ dd(x,y), dd(x,y,[2,3]), dd(x,y,z,[2,3]) $
  ],
  [
    *(5)* #hl(`dd(x, y, z, [[1,1],rho+1,n_1])`) \
    $ dd(x, y, z, [[1,1],rho+1,n_1]) $
  ],
  [
    *(6)* #hl(`dd(x,y,d:Delta), dd(x,y,2,d:Delta)`) \
    $ dd(x,y,d:Delta), dd(x,y,2,d:Delta) $
  ],
  [
    *(7)* #hl(`dd(t,x_1,x_2,x_3,p:and)`) \
    $ dd(t,x_1,x_2,x_3,p:and) $
  ],
  [
    *(7)* #hl(`dd(t,x_1,x_2,x_3,d:upright(D))`) \
    $ dd(t,x_1,x_2,x_3,d:upright(D)) $
  ]
)
//PART5

=== 常规导数 <ordinary-derivatives>

#v(1em)

函数：`derivative(`_f_, \*_args_, \*\*_kwargs_`)`，缩写 `dv(`...`)`  
- _f_: 被微分的函数，可为 `#none` 或省略；  
- 位置参数 _args_: 变量名，可*选*跟阶数，例如 `2`；  
- 关键字参数 _kwargs_:  
  - `d`: 微分符号 [默认 `upright(d)`]；  
  - `s`: 分子与分母间的“斜线” [默认 `none`]。默认渲染普通分式 $dv(f,x)$。  
    - 设为 `\/` 可生成平坦行内形式 $dv(f,x,s:\/)$；  
    - 设为 `large` 时，将 “d/dx” 算符置于（可能很长的）函数表达式前，并自动调整括号大小以匹配高度。  

*阶数分配*: 仅一个变量，阶默认为 1；若阶为 1，渲染为 $x$ 而非 $x^1$。  

#align(center, [*示例*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`dv(,x), dv(,x,2), dv(f,x,k+1)`) \
    $ dv(,x), dv(,x,2), dv(f,x,k+1) $
  ],
  [
    *(2)* #hl(`dv(, vb(r)), dv(, vb(r)_e, 2)`) \
    $ dv(, vb(r)), dv(, vb(r)_e, 2) $
  ],
  [
    *(3)* #hl(`dv(f,x,2,s:\/), dv(f,xi,k+1,s:\/)`) \
    $ dv(f,x,2,s:\/), dv(f,xi,k+1,s:\/) $
  ],
  [
    *(4)* #hl(`dv((sum f_i (x) dd(x)),x,s:"large")`) \
    $ dv((sum f_i (x) dd(x)),x,s:"large") $
  ],
  [
    *(5)* #hl(`dv(, x, d:delta), dv(, x, 2, d:Delta)`) \
    $ dv(, x, d:delta), dv(, x, 2, d:Delta) $
  ],
  [
    *(6)* #hl(`dv(vb(u), t, 2, d: upright(D))`) \
    $ dv(vb(u), t, 2, d: upright(D)) $
  ],
  [
    *(7)* #hl(`dv(vb(u),t,2,d:upright(D),s:\/)`) \
    $ dv(vb(u),t,2,d:upright(D),s:\/) $
  ],
  [
    *(7)* #hl(`dv((u+v),t,2,d:upright(D),s:"large")`) \
    $ dv((u+v),t,2,d:upright(D),s:"large") $
  ],
)



//PART6

=== 偏导数（含混合阶） <partial-derivatives>

#v(1em)

函数：`partialderivative(`_f_, \*_args_, \*\*_kwargs_`)`，缩写 `pdv(`...`)`  
- _f_: 被偏微分的函数，可为 `#none` 或省略；  
- 位置参数 _args_: 变量名，可*选*跟阶数（如 `2`），或阶数组 `[2,3]`、`[k]`、`[m n, lambda+1]`；  
- 关键字参数 _kwargs_:  
  - `d`: 微分符号 [默认 `partial`]；  
  - `s`: 分子分母间的“斜线” [默认 `none`]。默认渲染普通分式 $pdv(f,x)$；常见非默认：  
    1. `\/` → 生成平坦行内形式；  
    2. `"large"` → 将 “∂/∂x” 放在函数表达式前，并自适应括号大小。  
  - `total`: 用户指定的总阶数。  
    - 若省略，则：  
      1. 若所有变量阶为数字 → **自动计算** 总阶；  
      2. 若含符号 → 尝试最简计算，必要时用户以 `total:` 覆盖。  

*阶数分配算法*  
- 无阶数 → 所有变量阶 = 1；  
- 单数字阶 → 赋同阶，例如 `pdv(f,x,y,2)` 得 $x←2,y←2$；  
- 阶数组 → 顺序赋阶；不足部分 → 余下变量阶 = 1；  
- 阶为 1 时渲染为 $x$ 而非 $x^1$。  

#align(center, [*示例*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`pdv(,x), pdv(,t,2), pdv(,lambda,[k])`) \
    $ pdv(,x), pdv(,t,2), pdv(,lambda,[k]) $
  ],
  [
    *(2)* #hl(`pdv(f,vb(r)), pdv(phi,vb(r)_e,2)`) \
    $ pdv(phi,vb(r)), pdv(phi,vb(r)_e,2) $
  ],
  [
    *(3)* #hl(`pdv(,x,y), pdv(,x,y,2)`) \
    $ pdv(,x,y), pdv(,x,y,2) $
  ],
  [
    *(4)* #hl(`pdv(f,x,y,2), pdv(f,x,y,3)`) \
    $ pdv(phi,x,y,2), pdv(phi,x,y,3) $
  ],
  [
    *(5)* #hl(`pdv(,x,y,[2,]), pdv(,x,y,[1,2])`) \
    $ pdv(,x,y,[2,]), pdv(,x,y,[1,2]) $
  ],
  [
    *(6)* #hl(`pdv(,t,2,s:\/), pdv(f,x,y,s:\/)`) \
    $ pdv(,t,2,s:\/), pdv(f,x,y,s:\/) $
  ],
  [
    *(7)* #hl(`pdv(,y)(pdv((x+y),x,s:"large"))`) \
    $ pdv(,y)(pdv((x+y),x,s:"large")) $
  ],
  [
    *(8)* #hl(`pdv(,x)[integral_0^x f(x,y) dd(x,y)]`) \
    $ pdv(,z)[integral_0^z f(x) dd(x,y)] $
  ],
  [
    *(9)* #hl(`pdv(, (x^1), (x^2), (x^3), [1,3])`) \
    $ pdv(, (x^1), (x^2), (x^3), [1,3]) $
  ],
  [
    *(10)* #hl(`pdv(phi,x,y,z,tau, [2,2,2,1])`) \
    $ pdv(phi,x,y,z,tau, [2,2,2,1]) $
  ],
  [
    *(11)* #hl(`pdv(,x,y,z,t,[1,xi,2,eta+2])`) \
    $ pdv(,x,y,z,t,[1,xi,2,eta+2]) $
  ],
  [
    *(12)* #hl(`pdv(,x,y,z,[xi n,n-1],total:(xi+1)n)`) \
    $ pdv(,x,y,z,[xi n,n-1],total:(xi+1)n) $
  ],
  [
    *(13)* #hl(`pdv(S, phi.alt, phi.alt, d:delta)`) \
    $ pdv(S, phi.alt, phi.alt, d:delta) $
  ],
  [
    *(14)* #hl(`pdv(W[J], J^mu (x), J^nu (y), d:delta)`) \
    $ pdv(W[J], J^mu (x), J^nu (y), d:delta) $
  ]
)

*(15)* #hl(`integral_V dd(V) (pdv(cal(L), phi) - partial_mu (pdv(cal(L), (partial_mu phi)))) = 0`) \
$ integral_V dd(V) (pdv(cal(L), phi) - partial_mu (pdv(cal(L), (partial_mu phi)))) = 0 $
//PART7

== 特殊 show 规则

#v(1em)

=== 上标 T 表示矩阵转置 <matrix-transpose>

#v(1em)

在 Typst 中，可直接写 `..^T` 像手写那样表达矩阵转置。若唯一上标是 `T`，它将被自动格式化为“转置”而非普通字母 $T$。

该转换（$square.stroked.dotted^T => square.stroked.dotted^{TT}$）在以下情况 **不会触发**：

- 基底是 `limits(...)` 或 `scripts(...)`；  
- 基底是积分 $integral$、求和 $sum$（非希腊 $Σ$）、连乘 $product$（非希腊 $Π$）或竖线 $|$；  
- 基底为方程或 `lr(...)` 且其最后子元素属于上述对象。

**重写方法**  
- 若确实要打印显式转置符，可用 `TT`：`A^TT` → $A^{TT}$；  
- 若要打印普通上标字母 T，可用 `scripts(T)`：`2^scripts(T)` → $2^{scripts(T)}$。

> 需通过 show 规则显式启用：

```typ
#show: super-T-as-transpose
(A B)^T = B^T A^T
```

若仅想在某块内启用，可写：

```typ
#[
  #show: super-T-as-transpose
  (A B)^T = B^T A^T
]
```

#align(center, [*示例*])

#show: super-T-as-transpose  // 必不可少

#grid(
  columns: (auto, auto),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`(U V_n W')^T = W'^T V_n^T U^T`) \
    $ (Sigma V_n W')^T = W'^T V_n^T Sigma^T $
  ],
  [
    *(2)* #hl(`vec(a, b)^T, mat(a, b; c, d)^T`) \
    $ vec(a, b)^T, mat(a, b; c, d)^T $
  ],
  [
    *(3)* #hl(`abs(a)^T, norm(a)^T, evaluated(F(t))^T_0`) \
    $ abs(a)^T, norm(a)^T, evaluated(F(t))^T_0 $
  ],
  [
    *(4)* #hl(`integral^T, sum^T, product^T`) \
    $ integral^T, sum^T, product^T $
  ],
  [
    *(5)* #hl(`limits(e)^T, scripts(e)^T`) \
    $ limits(e)^T, scripts(e)^T $
  ],
  [
    *(6)* #hl(`(M+N)^T, (m+n)^scripts(T)`) \
    $ (M+N)^T, (m+n)^scripts(T) $
  ]
)

=== 上标 + 表示矩阵厄米共轭

共轭转置（Hermitian 转置）常记 $A^{dagger}$ 或 $A^*$。写 `..^dagger` 在源码中较长，故本包允许写 `..^+`。

该转换（$square.stroked.dotted^+ => square.stroked.dotted^{dagger}$）同样在：

- 基底为 `limits(...)` / `scripts(...)`，或  
- 基底属前述积分、求和等对象的场合  

**不会触发**。

> 需显式启用：

```typ
#show: super-plus-as-dagger
U^+U = U U^+ = I
```

块级启用示例：

```typ
#[
  #show: super-plus-as-dagger
  U^+U = U U^+ = I
]
```

**重写方法**  
- 若要打印真实匕首：`A^dagger`；  
- 若要保持上标加号：`A^scripts(+)`。

#align(center, [*示例*])

#show: super-plus-as-dagger

#grid(
  columns: (auto, auto),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`U^+U = U U^+ = I`) \
    $ U^+U = U U^+ = I $
  ],
  [
    *(2)* #hl(`mat(1+i,1;2-i,1)^+ = mat(1-i,2+i;1,1)`) \
    $ mat(1+i,1;2-i,1)^+ = mat(1-i,2+i;1,1) $
  ],
  [
    *(3)* #hl(`limits(N)^+, scripts(N)^+`) \
    $ limits(N)^+, scripts(N)^+ $
  ],
  [
    *(4)* #hl(`#let eq = $scripts(N)$; eq^+`) \
    $ #let eq = $scripts(N)$; eq^+ $
  ],
)
//PART8

== 杂项 (Miscellaneous)

#v(1em)

=== 约化普朗克常数 (hbar)

#v(1em)

默认字体下，Typst 内置符号 `planck.reduce` $planck.reduce$ 的字母 “h” 带斜杠而非水平线，与俗称 “h‑bar” 不符。本包提供 `hbar` 呈现常见形式：$hbar$。对比如下：

#table(
  columns: (auto, auto, auto, auto, auto),
  align: horizon,
  column-gutter: 1em,
  stroke: none,

  [Typst 的 `planck.reduce`],
  [$ E = planck.reduce omega $],
  [$ (pi G^2) / (planck.reduce c^4) $],
  [$ A e^(frac(i(p x - E t), planck.reduce)) $],
  [$ i planck.reduce pdv(,t) psi = -frac(planck.reduce^2, 2m) laplacian psi $],

  [本包的 `hbar`],
  [$ E = hbar omega $],
  [$ (pi G^2) / (hbar c^4) $],
  [$ A e^(frac(i(p x - E t), hbar)) $],
  [$ i hbar pdv(,t) psi = -frac(hbar^2, 2m) laplacian psi $],
)

*已知限制*：`hbar` 使用 `strike` 函数，若你对 `strike` 设置了 show 规则，会影响 `hbar` 外观。可参考下例临时覆盖：  
（在 https://github.com/typst/typst/issues/420 解决前暂无更健壮方案。）

#raw(
  ```typst
  #import "@preview/physica:{VERSION}": hbar as old-hbar

  #show strike: set text(gray)
  #let hbar = {
    show strike: set text(black)
    old-hbar
  }

  $hbar$ 为黑色，而 $#old-hbar$ 为灰色。
  ```
  .text.replace("{VERSION}", version),
  lang: "typst",
)

=== 张量 (Tensors)

#v(1em)

张量常用 #linkurl("抽象指标记法", "https://en.wikipedia.org/wiki/Abstract_index_notation") 表示，对比/协变上、下指标一目了然。若仅靠普通上下标且同时含上下标，将违背排版规则，因为指标需垂直分离：例如 $tensor(T,+a,-b)$ 与 $tensor(T,-a,+b)$ 形状不同。简单写 “$T^a_b$” 是错误的；`T^(space w)_(i space j)` 也会导致 $w$ 与 $j$ 重叠。

函数：`tensor(`_symbol_, \*_args_`)`  
- _symbol_: 张量符号；  
- 位置参数 _args_: 形如 `+...` 或 `-...`，`+` 表示上标，`-` 表示下标。  

#align(center, [*示例*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`tensor(u,+a), tensor(v,-a)`) \
    $ tensor(u,+a), tensor(v,-a) $
  ],
  [
    *(2)* #hl(`tensor(h,+mu,+nu), tensor(g,-mu,-nu)`) \
    $ tensor(h,+mu,+nu), tensor(g,-mu,-nu) $
  ],
  [
    *(3)* #hl(`tensor(T,+a,-b), tensor(T,-a,+b)`) \
    $ tensor(T,+a,-b), tensor(T,-a,+b) $
  ],
  [
    *(4)* #hl(`tensor(T, -i, +w, -j)`) \
    $ tensor(T, -i, +w, -j) $
  ],
  [
    *(5)* #hl(`tensor((dd(x^lambda)),-a)`) \
    $ tensor((dd(x^lambda)),-a) $
  ],
  [
    *(6)* #hl(`tensor(AA,+a,+b,-c,-d,+e,-f,+g,-h)`) \
    $ tensor(AA,+a,+b,-c,-d,+e,-f,+g,-h) $
  ],
  [
    *(7)* #hl(`tensor(R, -a, -b, +d)`) \
    $ tensor(R, -a, -b, +d) $
  ],
  [
    *(8)* #hl(`tensor(T,+1,-I(1,-1),+a_bot,-+,+-)`) \
    $ tensor(T,+1,-I(1,-1),+a_bot,-+,+-) $
  ],
)

*(9)* `grad_mu A^nu = partial_mu A^nu + tensor(Gamma,+nu,-mu,-lambda) A^lambda`
$ grad_mu A^nu = partial_mu A^nu + tensor(Gamma,+nu,-mu,-lambda) A^lambda $

=== 同位素 (Isotopes)

#v(1em)

函数：`isotope(`_element_, _a_: ..., _z_: ...`)`.
- _element_: 元素符号（多字母符号用 `".."`）；  
- _a_: 质量数 A [默认 `none`]；  
- _z_: 原子序数 Z [默认 `none`]。  

*更新*: Typst 已合并我的 #linkurl("PR", "https://github.com/typst/typst/pull/825")，修正了与周围文本垂直错位的问题。

#align(center, [*示例*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`isotope(I, a:127)`) \
    $ isotope(I, a:127) $
  ],
  [
    *(2)* #hl(`isotope("Fe", z:26)`) \
    $ isotope("Fe", z:26) $
  ],
)

*(3)* #hl(`isotope("Bi",a:211,z:83) -> isotope("Tl",a:207,z:81) + isotope("He",a:4,z:2)`)  
$ isotope("Bi",a:211,z:83) -> isotope("Tl",a:207,z:81) + isotope("He",a:4,z:2) $

*(4)* #hl(`isotope("Tl",a:207,z:81) -> isotope("Pb",a:207,z:82) + isotope(e,a:0,z:-1)`)  
$ isotope("Tl",a:207,z:81) -> isotope("Pb",a:207,z:82) + isotope(e,a:0,z:-1) $

//PART9

=== 泰勒级数第 n 项

#v(1em)

函数：`taylorterm(`_func_, _x_, _x0_, _idx_`)`  
- _func_: 函数名，例如 `f`、`(f+g)`；  
- _x_: 变量名，例如 `x`；  
- _x0_: 展开点处变量值，例如 `x_0`、`(1+a)`；  
- _idx_: 级数项序号，如 `0`、`1`、`2`、`n`、`(n+1)`。  
若 _x0_ 或 _idx_ 为加/减表达式（如 `-a`、`a+b`），函数自动在适当位置加括号。

#align(center, [*示例*])

#grid(
  columns: (50%, 50%),
  row-gutter: 1em,
  column-gutter: 2em,

  [
    *(1)* #hl(`taylorterm(f,x,x_0,0)`) \
    $ taylorterm(f,x,x_0,0) $
  ],
  [
    *(2)* #hl(`taylorterm(f,x,x_0,1)`) \
    $ taylorterm(f,x,x_0,1) $
  ],
  [
    *(3)* #hl(`taylorterm(F,x^nu,x^nu_0,n)`) \
    $ taylorterm(F,x^nu,x^nu_0,n) $
  ],
  [
    *(4)* #hl(`taylorterm(f,x,x_0,n)`) \
    $ taylorterm(f,x,x_0,n) $
  ],
  [
    *(5)* #hl(`taylorterm(f,x,1+a,2)`) \
    $ taylorterm(f,x,1+a,2) $
  ],
  [
    *(6)* #hl(`taylorterm(f_p,x,x_0,n-1)`) \
    $ taylorterm(f_p,x,x_0,n-1) $
  ],
)

=== 信号序列（数字时序图）

在工程实践中，常需绘制数字时序图，例如 $signals("1|0|1|0")$。

函数：`signals(str, step:…, color:…)`  
- `str`: 描述信号的字符串，每字符代表一个图元（见下表）；  
- `step`（可选）：步宽，即每图元宽度 [默认 `#1em`]；  
- `color`（可选）：线条颜色 [默认 `#black`]。

#align(center, [*图元字符*])

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  row-gutter: 1em,
  column-gutter: 2em,

  [`HLM` #sym.arrow.l.r.double `"10-"` #text(size:0.5em,[整步]) \ $ signals("HLM&10-") $],
  [`hlm ^v` #text(size:0.5em,[半步/十分之一步]) \ $ signals("hlm&^v") $],
  [`| ' ,` (边沿) #text(size:0.5em,[0 步]) \ $ signals("|&'&,") $],
  [`= #` #text(size:0.5em,[空白/填充]) \ $ signals("=&#") $],

  [`R` (上升) \ $ signals("R") $],
  [`F` (下降) \ $ signals("F") $],
  [`C` (充电) \ $ signals("C") $],
  [`D` (放电) \ $ signals("D") $],

  [`<` \ $ signals("<") $],
  [`>` \ $ signals(">") $],
  [`X` \ $ signals("X") $],
  [],

  [忽略: 空格；分隔符: `&`],
  [重复: `.` (点)],
)

#align(center, [*示例*])

*(1)* `signals("10.1"), signals("1|0|1|0R"), signals("CD"), signals("CD", step:#2em)`  
$ signals("10.1"), signals("1|0|1|0R"), signals("CD"), signals("CD", step:#2em) $

*(2)* `signals("M'H|L|h|l|^|v,&|H'M'H|l,m,l|")` (`&` 为分隔符)  
$ signals("M'H|L|h|l|^|v,&|H'M'H|l,m,l|") $

*(3)* `signals("-|=|-", step: #2em), signals("-|#|-"), signals("-<=>-<=")`
$ signals("-|=|-", step: #2em), signals("-|#|-"), signals("-<=>-<=") $

*(4)* `signals("R1..F0..", step:#.5em)signals("R1.|v|1", step:#.5em, color:#fuchsia)`  
$ signals("R1..F0..", step:#.5em)signals("R1.|v|1", step:#.5em, color:#fuchsia) $

*(5)*
```typst
"clk:" & signals("|1....|0....|1....|0....|1....|0....|1....|0..", step: #0.5em) \
"bus:" & signals(" #.... X=... ..... ..... X=... ..... ..... X#.", step: #0.5em)
```
$
"clk:" & signals("|1....|0....|1....|0....|1....|0....|1....|0..", step: #0.5em) \
"bus:" & signals(" #.... X=... ..... ..... X=... ..... ..... X#.", step: #0.5em)
$

=== 简易符号加法 (Symbolic addition)

本包实现了极简的符号加法函数，用于在未指定 `total` 时自动计算偏导总阶（参见 @partial-derivatives）。虽简单，却足够大多数场景。

函数：`BMEsymadd([ ... ])`  
- 参数为需相加的符号列表，如 `[1,2]`、`[a+1,b^2+1,2]` 等。

#align(center,[*示例*])

#grid(
  columns:(auto,auto,auto),
  row-gutter:1em,
  column-gutter:2em,

  [*(1)* #hl(`BMEsymadd([1]), BMEsymadd([2,3])`)],
  [#sym.arrow],
  [$BMEsymadd([1]), BMEsymadd([2,3])$],

  [*(2)* #hl(`BMEsymadd([a, b^2, 1])`)],
  [#sym.arrow],
  [$BMEsymadd([a, b^2, 1])$],

  [*(3)* #hl(`BMEsymadd([a+1,2c,b,2,b])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2c,b,2,b])$],

  [*(4)* #hl(`BMEsymadd([a+1,2(b+1),1,b+1,15])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2(b+1),1,b+1,15])$],

  [*(5)* #hl(`BMEsymadd([a+1,2(b+1),1,(b+1),15])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2(b+1),1,(b+1),15])$],

  [*(6)* #hl(`BMEsymadd([a+1,2(b+1),1,3(b+1),15])`)],
  [#sym.arrow],
  [$BMEsymadd([a+1,2(b+1),1,3(b+1),15])$],

  [*(7)* #hl(`BMEsymadd([2a+1,xi,b+1,a xi + 2b+a,2b+1])`)],
  [#sym.arrow],
  [$BMEsymadd([2a+1,xi,b+1,a xi + 2b+a,2b+1])$],
)

#pagebreak()

= 致谢 (Acknowledgement)

#v(1em)

衷心感谢以下 LaTeX 宏包，为物理排版指引方向：  
- `physics` by Sergio C. de la Barrera,
- `derivatives` by Simon Jensen,
- `tensor` by Philip G. Ratcliffe et al.

= 许可 (License)

源代码：  
#sym.copyright Copyright 2023 Leedehai. 许可见  
#linkurl("此处", "https://github.com/Leedehai/typst-physics/blob/master/LICENSE.txt")。

本文档：  
知识共享 “署名‑禁止演绎 4.0” 许可 (#linkurl("CC BY‑ND 4.0", "https://creativecommons.org/licenses/by-nd/4.0/legalcode"))。




