
#let target() = {
  if "target" in dictionary(std) { std.target() } else { "paged" }
}


// get the bounding box of an equation
#let bounded(eq) = text(top-edge: "bounds", bottom-edge: "bounds", eq)

// a dict that stores the height of equations
#let eq_height_dict = state("eq_height_dict", (:))

#let inside_pin = state("inside_pin", false)

// when called, retrieves the height of the equation, which is then stored in a state variable
#let pin(label) = context {
  let height = here().position().y
  eq_height_dict.update(it => {
    if label in it.keys() or height < 0.000001pt {
      it
    } else {
      it.insert(label, height)
      it
    }
  })
}

// insert a function call `pin(label)`` at the start of the equation.
#let add_pin(eq) = {
  let label = repr(eq)

  inside_pin.update(true)
  // bounded($ inline(pin(label)#eq) $)
  $ inline(pin(label)#bounded(eq)) $
  inside_pin.update(false)
}


// apply styling only for non-HTML output
#show: doc => {
  context if target() == "paged" {
    set page(width: 22cm, margin: 2em)
    doc
  } else {
    show math.equation: eq => {
      if eq.block {
        if inside_pin.get() {
          html.frame(eq)
        } else {
          html.elem(
            "div",
            attrs: (
              style: "display: flex; justify-content: center; width: 100%; margin: 1em 0;",
            ),
            html.frame(eq),
          )
        }
      } else {
        let label = repr(eq)

        if label in eq_height_dict.final().keys() {
          let height = eq_height_dict.final().at(label, default: none)

          eq_height_dict.update(d => {
            d.insert(label, height)
            d
          })

          let y_length = measure(bounded(eq)).height // total height of the bounding box of the equation

          let shift = y_length - height
          box(html.frame(move(bounded(eq), dy: shift)))
        } else {
          box(html.frame(add_pin(eq)))
        }
      }
    }
    doc
  }
}



#set text(size: 14pt, font: "New Computer Modern")
#set box(stroke: 0.1pt + red)


= Typst Math to HTML Test

== 1. Inline vs. Block
This is an inline equation: $a^2 + b^2 = c^2#move(sym.AA, dy: 6pt)$.  It should sit baseline-aligned with the text. 1. Let $omega = (dif x) / y$, 2. Let $omega$, 3. Let #box($omega = (dif x) / y$), 4. Let $omega$, Let $omega = (dif x) / y$ 5. Let #box(text(bottom-edge: "bounds", $omega = (dif x) / y$))

#place(dy: -1.185em, line(length: 100%, stroke: blue))

I want a $product_(n=0) 1 / n! x^n F(U)$ and $F(U)$
// This is an inline equation: $a^2 + b^2 = c^2#move(sym.AA, dy: 6pt)$. It should sit baseline-aligned with the text. 1.Let $omega = (dif x) / y$, 2.Let $omega$, 3.Let #box($omega = (dif x) / y$), 4.Let $omega$ #math-box($omega = (dif x) / y$), 5.Let #box(text(bottom-edge: "bounds", $omega = (dif x) / y$)), 6.Let #box($omega$)
#place(dy: -1.185em, line(length: 100%, stroke: blue))
// $
//   integral_(C_1) omega = 4 K lr((k)) ,
// $
where $C_2$ is a closed path around from $0$ to $1$ and back to $0$.

$C_1$ is a closed path around from $0$ to $1$ and back to $0$ $0$.

I need #box($limits(sum)_(i=1)^n f(U)$) I need $limits(sum)_(i=1)^n f(U)$  I need $limits(sum)_(i=1)^n f(U)$ I need  $limits(sum)_(i=1)^n f(U)$

// I need #box($limits(sum)_(i=1)^n f(U)$) I need  $limits(sum)_(i=1)^n f(U)$ I need  #math-box($limits(sum)_(i=1)^n f(U)$)

Below is a block equation. It should be centered and display larger operators:
$ sum_(k=1)^n k = (n(n+1)) / 2 $

== 2. Complex Fractions & Roots
Testing vertical scaling and nesting:
$ x = (-b plus.minus sqrt(b^2 - 4a c)) / (2a) $

== 3. Matrices (Grid Layout)
Matrices are often the hardest part for HTML exporters. Check if the brackets stretch and columns align: inline matrix test $bold(M) = mat(
  1, 0, 0;
  0, cos(theta), -sin(theta);
  0, sin(theta), cos(theta)
)$ Matrices are often the hardest part for HTML exporters. Check if the brackets stretch and columns align:
$
  bold(M) = mat(
    1, 0, 0;
    0, cos(theta), -sin(theta);
    0, sin(theta), cos(theta)
  )
$

== 4. Alignment & Multi-line
Testing alignment points (`&`). In HTML, this usually requires a specific table or grid structure: $p/q$ #box($p/q$) $p/q$ #box($p/q$) $p/q$ #box($p/q$)
$
  f(x) & = (x + 1) (x - 1) \
       & = x^2 - x + x - 1 \
       & = x^2 - 1
$

== 5. Cases & Text in Math
Testing formatting inside math blocks (`"text"`):
$
  f(n) = cases(
    n/2 & "if" n "is even",
    3n+1 & "if" n "is odd"
  )
$

== 6. Variable Sizing
Testing integrals and limits #box($ inline(lim_(N -> infinity) limits(sum)_(k=1)^N 1/k^2 = pi^2 / 6) $) Testing integrals and limits $lim_(N -> infinity) limits(sum)_(k=1)^N 1/k^2 = pi^2 / 6$:
$ lim_(N -> infinity) sum_(k=1)^N 1/k^2 = pi^2 / 6 $


// #context eq_height_dict.final()

