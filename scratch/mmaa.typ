#import "@preview/i-figured:0.2.4"
#import "@preview/equate:0.1.0": equate


#show math.equation: i-figured.show-equation.with(level: 1)
#show heading: i-figured.reset-counters.with(level: 1)

// #show: equate.with(sub-numbering: false)
// #set math.equation(numbering: "(1.1)")

#set heading(numbering: "1.1.")

= Heading 1
$ beta &= 1\
gamma &<= 2 <= delta $

= Heading 2
$ alpha $