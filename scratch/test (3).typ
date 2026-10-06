// The curvy part of the long division. Could just use the ")" character, but this
// looks a bit better (although is much more maintenance :) )
// NOTE: you will probably have to tweak the 'dx' term to get it to line up properly
#place(dx:195.5pt, dy:17.1pt)[
    #box(width:10pt, height: 20pt,
        path(
            fill: none,
            stroke: 0.5pt + black,
            (0pt, 20pt),
            ((5pt, 10pt), (0pt, 6pt)),
            (0pt, 0pt),
        )
    )
]

// Uses the '&' and '&&' column markers to line up the 'x' in each exponent
// position - e.g., the 'x' in the 'x^2' term lines up. The lines in the long
// division operation are manually drawn and placed.
#[$
     &   &&      &    & x^2 &  + & x & - 2      \

     #place(dx:0pt, dy:0pt, block(height:0.5pt, line(length: 8em, stroke:0.5pt))) \

x-1  &   && x^3  &    &     & -3 & x & + 2      \
     & - && x^3  &  + & x^2 &    &   &          \

     #place(dx:0pt, dy:0pt, block(height:0.5pt, line(length: 4em, stroke:0.5pt))) \

     &   &&      &    & x^2 & -3 & x &          \
     &   &&      &  - & x^2 &  + & x &          \

     #place(dx:25pt, dy:0pt, block(height:0.5pt, line(length: 4em, stroke:0.5pt))) \

     &   &&      &    &     & -2 & x & + 2      \
     &   &&      &    &     &  2 & x & - 2      \

     #place(dx:50pt, dy:0pt, block(height:0.5pt, line(length: 3.4em, stroke:0.5pt))) \

     &   &&      &    &     &    &   & 0        \
$]