#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
// #show strong: content => {
//   show regex("\p{Hani}"): it => box(place(text("·", size: 1.3em), dx: 0.3em, dy: 0.5em) + it)
//   content.body
// }
#set text(font: ("New Computer Modern math", "Noto Serif CJK SC"), lang: "zh")
#show math.equation: set text(font: ("New Computer Modern math", "Noto Serif CJK SC"), lang: "zh")
#show regex("[“”]"): set text(font: "SimSun")

#set page(height: auto)

#let uline(length) = underline([#(" " * length)#sym.zws]);

#outline(indent: 1.5em)

#line(length: 100%, stroke: rgb(245, 245, 245));

= 常见技巧

== 当你遇到分母是一坨的式子

=== 换元法

比如让你求 $frac(a, 2 a + 3 b) + frac(b, 3 a + 2 b)$ 的最值。

首先应该想到基本不等式。发现直接套的话乘积不是定值。怎么办？

注意到如果分母只有一项，那么不管分子怎么样都能拆开来，这是比较好做的。

但是这个式子的分母有两项。考虑换元法。

设 $x = 2 a + 3 b$，$y = 3 a + 2 b$，则
$a = frac(3 y - 2 x, 5)$，$b = frac(3 x - 2 y, 5)$。

带入原式，化简得 $1 / 5 (3 y / x + 3 x / y - 4)$。

这个是容易做的。

#line(length: 100%, stroke: rgb(245, 245, 245));

来一道要比就比心态的题：$a > 1$，$b > 1$，求
$frac(b^2, a - 1) + frac(a^2, b - 1)$ 最小值。

听说权方和不等式能秒，但是考虑不用怎么做。

看到分母一坨不好做，换元。设 $x = a - 1$，$y = b - 1$。

原式就变成这样 $frac(y^2 + 2 y + 1, x) + frac(x^2 + 2 x + 1, y)$

考虑展开，乍一看很不可做。

但是我们先展开看看
$frac(2 y, x) + frac(2 x, y) + y^2 / x + x^2 / y + 1 / x + 1 / y$。

前两项直接套基本不等式秒了，问题是后四项好像套不了。

这时候需要你成为心态王，直接套基本不等式：

$y^2 / x + x^2 / y + 1 / x + 1 / y$

$gt.eq 2 sqrt(x y) + 2 sqrt(frac(1, x y))$

你发现如果这两项能乘起来就爽了。

注意到再套一遍基本不等式就能把这两项转成乘积的形式。

$gt.eq 2 sqrt(2 sqrt(x y) times 2 sqrt(frac(1, x y)))$

$gt.eq 4$

= 不等式

== 常数代换法

形如给出 $k_1 a + k_2 b = k$，求 $k_3 / a + k_4 / b$
的最值，或者反过来的题目。

$k_3 / a + k_4 / b$

$= (k_3 / a + k_4 / b) times 1$

$= (k_3 / a + k_4 / b) times (k_1a + k_2b) times (1 / k)$。

然后接着展开就得到了形如 $k_5 a / b + k_6 b / a$
的式子，直接套基本不等式就行了。

== 消元法

这个方法比较深刻，有好几种情况。

一般有多于一个未知数。然后还给你未知数之间的关系。

其中一种情况比较 naive，形如 $k_1 x + k_2 b = k$
的形式想必小学生都会，直接移项就好了。

还有一些乱七八糟，我也不知道怎么注意到用换元法，你可以试一试？

还有一种情况比较深刻，形如 $x^2 + y^2 = k^2$。

这种形式，不知道是谁注意力惊人，发现
$x = k sin theta$，$y = k cos theta$ 的时候成立。

证明显然。

然后你就把 $x$ 和 $y$ 用一个未知数 $theta$ 表示了。非常牛。

减法的形式也能这样表示。$x^2 - y^2 = k^2$。

$x = frac(k, cos theta)$，$y = k tan theta$ 的时候成立。

证明的话只要大胆化简就好了。

然后化完之后一般是三角恒等变换或者辅助角公式换成单项的三角函数就能求出最值。

== 统一形式法

用这种方法的题有两个情况。一种是条件式子里面东西比较多，求的式子比较简洁。另一种是条件给的比较简洁，求的东西比较多。

第一种：

比如这题：$a + 2 b = sqrt(2 a b + 4)$，求 $a + 2 b$ 的最小值。

注意到给的条件里有 $a + 2 b$ 和 $2 a b$，要求 $a + 2 b$。

求的式子比较简洁，条件比较多。

把要求的设为 $t$，然后给的条件里出现了 $t$ 和其他的东西 $x$。

考虑通过如 $x gt.eq f (t)$ 或 $x lt.eq f (t)$，的不等式将 $x$ 用 $t$
表示。

然后条件就变成了只含 $t$ 的不等式，解一下就行了。

比如这题，注意到 $2 a b = a times 2 b$。所以
$2 a b lt.eq (frac(a + 2 b, 2))^2$。

$sqrt(2 a b + 4) lt.eq sqrt((frac(a + 2 b, 2))^2 + 4)$

由题可知：$a + 2 b lt.eq sqrt((frac(a + 2 b, 2))^2 + 4)$

两边平方并且令 $t = a + 2 b$ 就能解出来了。

注意第一步，我刚做的时候直接把 $a b$ 拆出来了，然后就做不下去了。

#line(length: 100%, stroke: rgb(245, 245, 245));

第二种：

$a b = 18$，求 $frac(a^2 + b^2, a - b)$ 最小值。

感觉这种比较靠注意力。

因为你无法换元的样子。貌似要考虑把要求的式子其中几项化成条件给出的式子。只留下一项或几项好算的就能基本不等式了。

注意到 $(a - b)^2 = a^2 + b^2 - 2 a b$。

原式化成 $frac((a - b)^2 - 2 a b, a - b)$。

$= frac((a - b)^2 - 36, a - b)$

$= (a - b) - frac(36, a - b)$

基本不等式即可。

= 求值域类问题

== 单调性

首先应该就考虑这玩意

如果函数单调，直接把左右端点带入就行，就算边界取在无穷只要把低次项忽略就好了。

常见的单调函数有 $display(frac(a x + b, c x + d))$

=== 例题一

==== 题面

设实数 $a$，$b$，$c$ 满足 $a > b > 1$，$c > 1$，则下列不等式中不成立的是

#table(
    columns: 4,
    stroke: none,
    [A. $display(frac(b, a) < frac(a + b c, b + a c) < a)$],
    [B. $display(frac(1, a) < frac(a + b c, b + a c) < b)$],
    [C. $display(frac(1, c) < frac(a + b c, b + a c) < c)$],
    [D. $display(frac(1, sqrt(a b)) < frac(a + b c, b + a c) < sqrt(a b))$]
);

==== 解答 

发现 $a$ 和 $b$ 之间有神秘关系，考虑把这两个放在一起考虑，所以设 $c$ 为主元。发现 $frac(a + b c, b + a c)$ 是单调的，所以 A 和 B 选项直接把 $c = 1$ 和 $c = +infinity$ 带入就好了，发现是对的。

C选项，两边都有 $c$，不太好把 $c$ 当主元，上下同除 $a$ 得 $display(frac(1 + display(frac(b, a)) c, display(frac(b, a)) + c))$，设 $display(frac(a, b))$ 为主元，取值范围 $(0, 1)$。两边带入发现是对的。

D选项，还是设 $c$ 为主元，把 $c = +infinity$ 带入发现需要证明 $display(frac(1, sqrt(a b)) < frac(b, a))$。等价于证明 $a < b sqrt(a b)$，这个显然是错误的。

== 从 $f(y)$ 的取值范围反推 $y$ 的取值范围

当 $y = f(x)$ 的 $f(x)$ 非常丑陋的时候，而且 $x$ 的取值没有限制（分母上取值限制为 $0$ 也可以），考虑把 $y$ 变成复杂一点来简化 $f(x)$。

=== 例题一

==== 题面

求 $display(y = frac(sin x - 2, cos x - 2))$ 的值域。

==== 解答

#set par(leading: 1em, spacing: 2em)

$display(y(cos x - 2) = sin x - 2)$

$display(2 - 2y = sin x - y cos x)$

$display(2 - 2y = sqrt(1 + y ^ 2) sin(x + phi))$

$display(frac(2 - 2y, sqrt(1 + y ^ 2)) = sin(x + phi))$

$display(frac(2 - 2y, sqrt(1 + y ^ 2)) in [-1, 1])$

// #linebreak()

$display(abs(frac(2 - 2y, sqrt(1 + y ^ 2))) <= 1)$

// #linebreak()


$display((frac(2 - 2y, sqrt(1 + y ^ 2)))^2 <= 1)$

然后随便解就行了。

== 判别式法

设有 $y = f(x)$，那么 $x$ 取一个值的时候，$y$ 必有对应的取值，所以对于一个以 $y$ 为系数关于 $x$ 的方程必定有解。

然后一般来说会化成一个关于 $x$ 的二次方程，然后限制 $Delta >= 0$ 即可求出 $y$ 的范围。 

#set par(leading: 0.65em, spacing: 1.3em)

=== 例题一

==== 题面

$x ^ 2 + 2y ^ 2 + 3z ^ 2 = 1$，求 $x + 2y + 3z$ 的最大值。

==== 解答

令 $t = x + 2y + 3z$。

由题可知：$(t - 2y - 3z) ^ 2 + 2y ^ 2 + 3z ^ 2 = 1$

设 $z$ 为主元，其他看作系数，因为这个方程必定有解， $Delta >= 0$。

$Delta = -12 y ^ 2 + 4 t y - t ^ 2 + 4 >= 0$

发现还有两项，不好搞，怎么办？

因为我们要求 $t$ 的限制，所以设 $y$ 为主元，发现二次项前的系数是负的，而且这玩意还大于零，说明 $-12 y ^ 2 + 4 t y - t ^ 2 + 4 = 0$ 必定有解。再算一遍 $Delta$ 即可。

// $frac("ax" + b, "cx" + d)$

= 三角函数

== 整体代换法

=== 做法

不少选择题会有形如 $f (x) = A sin (omega x + phi.alt) + B$ 的函数。

这种函数看着难，其实不是很难。

首先你显然可以不管 $B$ 和 $A$。

然后设 $t = omega x + phi.alt$。 之后它问你的问题就变成解
$g (t) = sin (t)$ 的问题了，你只要把它给 $x$ 的限制转到 $t$ 上就行了。

这个是好做的。

如果要你求 $x$ 要满足的限制，你只要先求 $t$ 要满足的限制，再转到 $x$
上就好了。

=== 应用

全是用处，各种选择题和大题都可以用，而且做得非常爽。

== 化简思路

主要统一三点：名称，角度，次数。

先讲名称怎么统一：

+ 弦切互化。
+ $1 = sin^2 x + cos^2 x$ 和乱七八糟的公式。

第一个当出现分式而且分子分母齐次的时候，直接上下同 乘/除
$cos$，就能全化成 \[$tan$ 与常数\] 或者 \[$sin$ 与 $cos$\]。

第二个就比较靠注意力了。但是一般先考虑统一角度和次数，统一完了之后名称问题就不是很大了。

可以通过 $cos^2$ 的降次来选择变成哪个名称。

然后角度和次数基本是绑在一起的。

考虑所有公式：

$1 - cos 2 x = sin^2 x\
1 + cos 2 x = cos^2 x\
1 + sin 2 x = (sin x + cos x)^2\
1 = sin^2 x + cos^2 x$

注意到！

这几个公式都含有 $1$！

所以 $1$ 可以变为二次式。

而且碰到 $1$ 就可以考虑变成二次式。

而且注意到降次要升角，升次要降角，所以一般将比较大的角升次。

= 平面向量 & 复数

== 起点重合，终点共线的向量结论

=== 结论

这个结论比较重要：

设有向量
$arrow(O A)$，$arrow(O B)$，$arrow(O C)$，$upright(A)$，$upright(B)$，$upright(C)$
三点共线，$lr(|arrow(A B)|) : lr(|arrow(C B)|) = k_1 : k_2 med (k_1 + k_2 = 1)$，那么
$arrow(O B) = k_2 dot.op arrow(O A) + k_1 dot.op arrow(O C)$。

证明：

$ k_2 dot.op arrow(A B) = k_1 dot.op arrow(C B) $

$ k_2 dot.op (arrow(A O) + arrow(O B)) = k_1 dot.op (arrow(C O) + arrow(O B)) $

$ (k_1 + k_2) dot.op arrow(O B) = k_2 dot.op arrow(O A) + k_1 dot.op arrow(O C) $

=== 应用

这个非常有用。

一般来说做题目，就是把未知向量表示成已知向量。

而这个东西可以做这件事：当未知向量同时在两个三角形中时，可以根据平面向量基本定理列方程，解出两个三角形中间边上的向量。

// #box(image("https://img2024.cnblogs.com/blog/3078970/202409/3078970-20240917190440854-217407795.png"))

\$\\LaTeX\$ 代码
```
\documentclass{standalone}
\usepackage{tikz}
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\draw (0, 0) -- (1, 4) -- (9, 0) -- (0, 0);
\draw (0.5, 2) -- (9, 0);
\draw (0, 0) -- (3, 3);
\draw (1, 4) -- (1.732, 1.732);
\node[above] at (1, 4) {$A$};
\node[left] at (0, 0) {$B$};
\node[right] at (9, 0) {$C$};
\node[left] at (0.5, 2) {$D$};
\node[right] at (3, 3) {$E$};
\node[below] at (1.732, 1.732) {$F$};
\end{tikzpicture}
\end{document}
```

如图，三角形 $A B C$ 中，$D$ 是 $A B$ 上一点，$E$ 是 $A C$
上一点，$A D : D B = 1 : 1$，$A E : E C = 1 : 3$，$B E$ 与 $C D$ 交于
$F$，连接 $A F$。

你可以求出 $D F : D C$，$E F : F B$。求法如下：

设 $D F = k_1$，$D C = 1 - k_1$。设 $E F = k_2$，$F B = 1 - k_2$。

列出方程组：

$ (1 - k_1) 1 / 2 arrow(A B) + k_1 arrow(A C) = arrow(A F)\
k_2 arrow(A B) + (1 - k_2) 1 / 4 arrow(A C) = arrow(A F) $

根据平面向量基本定理，$arrow(A B)$ 和 $arrow(A C)$ 前的系数应该相等：

$ 1 / 2 (1 - k_1) = k_2\
k_1 = 1 / 4 (1 - k_2) $

得到一个二元一次方程，这个随便解。

= 立体几何

== 三垂直定理

=== 证明

// #box(image("https://img2024.cnblogs.com/blog/3078970/202409/3078970-20240918113921714-338332440.png"))

\$\\LaTeX\$ 代码
```
\documentclass{standalone}
\usepackage{tikz}
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\draw (0, 0) -- (4, 4) -- (12, 4) -- (8, 0) -- (0, 0);
\draw (9, 8) -- (6, 2);
\draw [dotted] (6, 2) -- (5, 0);
\draw (5, 0) -- (4, -2);
\draw (6, 2) -- (9, 2);
\draw (9, 8) -- (9, 2);
\draw (8, 1) -- (9, 3);
\node [left] at (6, 2) {A};
\node [above] at (9, 8.2) {B};
\node [right] at (9.2, 8) {l};
\node [right] at (9, 2) {E};
\node [below] at (8, 1) {C};
\node [aove] at (9, 3) {D};
\node [above right] at (0.2, 0) {$\alpha$};
\end{tikzpicture}
\end{document}
```

如图，$C D subset alpha$，$l sect alpha = A$，$B$ 是 $l$ 上一点，作
$B E tack.t alpha$ 于点 $E$。

三垂线指的是 $A B$，$C D$，$A E$，这三条直线。

$A B tack.t C D arrow.l.r.double A E tack.t C D$。

以 $A B tack.t C D$ 为条件证明，另外一种读者自证不难。

$because B E tack.t alpha$

$therefore C D tack.t B E$

又 $because C D tack.t A B$

$therefore C D tack.t$ 平面 $A B E$

$therefore C D tack.t A E$

=== 用处
证明线线垂直，使用这个定理非常舒服。

你随便在作业本上找一道做一下就知道了

== 线线夹角公式

=== 证明
// #box(image("https://img2024.cnblogs.com/blog/3078970/202409/3078970-20240917205443391-1585718531.png"))

\$\\LaTeX\$ 代码
```
\documentclass{standalone}
\usepackage{tikz}
\usepackage{pgfplots}
\begin{document}
\begin{tikzpicture}
\draw (0, 0) -- (4, 4) -- (12, 4) -- (8, 0) -- (0, 0);
\draw (9, 8) -- (6, 2);
\draw [dotted] (6, 2) -- (5, 0);
\draw (5, 0) -- (4, -2);
\draw (6, 2) -- (9, 2);
\draw (9, 8) -- (9, 2);
\draw (6, 1) -- (4, 2);
\draw (8, 1) -- (6, 2);
\draw (9, 8) -- (8, 1);
\draw (8, 1) -- (9, 2);
\node [left] at (6, 2) {A};
\node [above] at (9, 8.2) {B};
\node [right] at (9.2, 8) {l};
\node [right] at (6, 1) {C};
\node [above] at (4, 2) {D};
\node [right] at (9, 2) {E};
\node [below] at (8, 1) {F};
\node [above right] at (0.2, 0) {$\alpha$};
\end{tikzpicture}
\end{document}
```

如图，直线 $l$ 交平面 $alpha$ 于点 $A$, 在 $l$ 上取一点 $B$, 过 $B$
作平面的垂线 $B E$，$E$ 为垂足。直线 $C D subset alpha$。

设 $l$ 和 $C D$ 夹角为 $theta$，$l$ 和 平面 $alpha$ 夹角为
$theta_1$，$C D$ 平移后的直线 $A F$ 和 $A E$ 夹角为 $theta_2$。

则 $cos theta = cos theta_1 cos theta_2$。

证明如下：

作 $E F$ 垂直于 $A F$，$F$ 为垂足。

$cos theta_2 = frac(A B, A E)$，$cos theta_1 = frac(A E, A F)$。

那么我们要证明 $cos theta = frac(A B, A F)$。

就是我们要证明 $angle A F B = pi / 2$。

$because B E tack.t alpha$。

$therefore B E tack.t A F$。

又 $because E F tack.t A F$

$therefore A F tack.t$ 平面 $B F E$。

$therefore A F tack.t F B$。

=== 应用

#strike[可以证明三垂直定理，读者自证不难。]

其他暂时不知道。

== 证明基本思路

// #figure(image("https://s21.ax1x.com/2024/09/19/pAKhXJU.png"),
//   caption: [
//     思维导图.png
//   ]
// )

== 二面角求法

+ 按定义求，不赘述了。

+ 三垂直定理求：

考虑两个平面 $alpha$，$beta$，交于 $l$。

在 $alpha$ 上随便取一个点 $A$ 向 $beta$ 做垂线，垂足为 $P$。过点 $P$ 作
$l$ 的垂线，垂足为 $Q$。

连接 $A Q$，三垂直定理可证 $A Q tack.t l$。所以二面角为 $angle A Q P$。

一般用这个方法。

#block[
#set enum(numbering: "1.", start: 3)
+ 这是个抽象方法：
]

假设有一个长方形平面 $A B C D$ 和另一个平面 $alpha$ 交于直线 $A B$，从
$C$，$D$ 作线直线 $C C'$，$D D'$ 垂直于 $alpha$，二面角的余弦值等于
$display(S_(A B C D) / S_(A B C' D'))$。

容易推广到其他不交的情况和不规则的情况。

#block[
#set enum(numbering: "1.", start: 4)
+ 注意到如果有几个面有公共棱，那么你求出这几个面合在一起的角，再把其他角求出来，做差就可以搞出要求的角了。

+ 观察！题目中有些条件可以限制一个几何体，而且多半这个几何体是确定的！只要几何体确定了，信息多半就够了，这就容易做了。
]
