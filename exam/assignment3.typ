#import "lib.typ":*
#show: doc => conf(
  title: [Assignment 3],
  authors: [XXX],
  id: [XXX],
  email: "XXX@XXX",
  doc
)

= Chapter 5,2b

The dynamics under the risk-neutral measure are:

$
  dif ln S_t = (r_t - 1/2 sigma_s^2) dif t + Sigma_s dot dif W_t^Q\
  dif ln P(t,T) = (r_t - 1/2 sigma_P^2) dif t +Sigma_P dot dif W_t^Q
$

The payoff of the put option is $V_T = (K-S_T)^+$.

The price of the put option at time $t$ is:

$
  V_t = P(t,T) EE^Q [frac((K-S_T)^+,P(T,T))]
$

Since $P(T,T)=1$,

$
  V_t = P(t,T) EE^Q [(K-S_T)^+]
$

Using the BS framework with stochastic interest rates, the price can be expressed as:

$
  V_t = P(t,T) [K N(-d_2) - S_t N(-d_1)]\
  d_1 = frac(ln(S_t slash K)+ (r_t+1/2 sigma^2)(T-t),sigma sqrt(T-t)), d_2 = d_1-sigma sqrt(T-t)
$

$
  sigma = sqrt(sigma_s^2+sigma_P^2-2rho sigma_s sigma_P)
$

= Chapter 5,6

First, we need to change the measure:

$
  E^(Q_T) [X] = frac(E^Q [X dot B_T^(-1)],E^Q [B_T^(-1)])
$

$B_T$ is the price of a zero coupon bond maturinf at time $T$.

So, $f(0;T-Delta T,T)$ under $Q$ is:

$
  f(0;T - Delta T, T) = E^(Q_T) [f(T;T - Delta T, T)] = frac(E^Q [f(T; T - Delta T,T) dot B_T^(-1)],E^Q [B_T^(-1)])
$

The difference between the SOFR term rate and the futures implied rate is:

$
  f(0;T- Delta T, T) - tilde(f)(0;T- Delta T, T) &= frac(E^Q [f(T; T - Delta T,T) dot B_T^(-1)],E^Q [B_T^(-1)]) - E^Q [f(T; T- Delta T,T)]\
  &= frac(E^Q [f(T; T - Delta T,T) dot B_T^(-1)]- E^Q [f(T; T- Delta T,T)] dot E^Q [B_T^(-1)],E^Q [B_T^(-1)])
$

We find that:

$
  "Cov"^Q (f(T;T-Delta T,T),B_T^(-1)) = E^Q [f(T; T - Delta T,T) dot B_T^(-1)]- E^Q [f(T; T- Delta T,T)] dot E^Q [B_T^(-1)]
$

So, we have 

$
  f(0;T- Delta T, T) - tilde(f)(0;T- Delta T, T) = frac("Cov"^Q (f(T;T-Delta T,T),B_T^(-1)),E^Q [B_T^(-1)])
$

= additional 1

$
  Delta P = 96.82-96.76 = 0.06 = 6 "bp"
$

total loss for 6 contracts is:

$
  6 times 25 times 6 = 900 \$
$

= additional 2

First, we calculate the present value of fixed leg:

$
  "PV"_("fixed") = 1.5 % times 100000000 times sum_(n=1)^4 1/(1+0.017)^n = 5746500
$

Then, we calculate the present value of floating leg:

$
  "PV"_("float") = 1.7% times 100000000 times sum_(n=1)^4 1/(1+0.017)^n = 6512700
$

For receiver,

$
  "return" = "PV"_("fixed") - "PV"_("float") = 5746500 - 6512700 = -766200
$

= additional 3

XYZ Co. can use the FRA to lock in the annual interest rate at 3.6% by entering into an FRA, where they agree to pay the fixed rate and receive the floating 3-month SOFR rate.

The interest for the 3-month loan period is calculated below:

$
  100M times 3.6% times 3/12 = 900000
$

So the total payment at the end of 9-month includes the principal is:

$
  100M + 0.9M = 100.9M
$

= additional 4

