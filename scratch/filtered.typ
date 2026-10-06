#let dd = ""
#let ket = ""
#let nand = ""
#let mt(it) = it
$ g(T)=cases(c(T_i) quad &\,"len"(T)=1,
product_(i<="len"(T))p_i^c(T_i) quad &\,"len"(T)>1) $
$((not (p and q)) arrow r) arrow (p or (not q) or r)$
$tack.r (A and (B or C)) -> ((A and B) or (A and C))$
$P and Q tilde.eq not(P -> not Q), P or Q tilde.eq not P -> Q$
$ φ: (∀x.(P (x) → Q(x)) ∧ ∃x.(R(x) ∧ P (x))) → (R(x) → ¬Q(x)) $
$ P(a)->Q(a)=F->T=T=>forall x.(P(x)->Q(x))=T \
    R(a) ∧ P (a) = T and T = T => ∃x.(R(x) ∧ P (x)) = T\
    ∀x.(P (x) → Q(x)) ∧ ∃x.(R(x) ∧ P (x)) = T and T = T\
    R(a) -> not Q(a) = T -> not F = T -> T = T\
    phi: (∀x.(P (x) → Q(x)) ∧ ∃x.(R(x) ∧ P (x))) → (R(x) → ¬Q(x)) = F -> T = T $
$ P(a)->Q(a)=T->T=T=>forall x.(P(x)->Q(x))=T \
    R(a) ∧ P (a) = T and T = T => ∃x.(R(x) ∧ P (x)) = T\
    ∀x.(P (x) → Q(x)) ∧ ∃x.(R(x) ∧ P (x)) = T and T = T\
    R(a) -> not Q(a) = T -> not T = T -> F = F\
    phi: (∀x.(P (x) → Q(x)) ∧ ∃x.(R(x) ∧ P (x))) → (R(x) → ¬Q(x)) = T -> F = F $
$ forall x. (P(x)->B(x)) and exists x. (L(x) and P(x))->exists x. (L(x) and B(x)) $
$|-forall x. (P(x)->B(x)) and exists x. (L(x) and P(x))->exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)) and exists x. (L(x) and P(x))|-exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), exists x. (L(x) and P(x))|-exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), L(a) and P(a)|-exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), L(a), P(a)|-exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), L(a), P(a)|-L(a) and B(a), exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), P(a)->B(a), L(a), P(a)|-L(a) and B(a), exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), B(a), L(a), P(a)|-L(a) and B(a), exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), B(a), L(a), P(a)|-L(a), exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), B(a), L(a), P(a)|-B(a), exists x. (L(x) and B(x))$
$forall x. (P(x)->B(x)), L(a), P(a)|-P(a),L(a) and B(a), exists x. (L(x) and B(x))$
$ A: ∀x.(P (x, y) ∧ ∀y.∃z.(y =^dot f (z)) ∨ (y =^dot x)) $
$ A[(f(x)) / x]=A=∀x.(P (x, y) ∧ ∀y.∃z.(y =^dot f (z)) ∨ (y =^dot x)) $
$
      A[(f(x)) / y]&=(∀x.(P (x, y) ∧ ∀y.∃z.(y =^dot f (z)) ∨ (y =^dot x)))[(f(x)) / y]\
      &= (∀u.(P (u, y) ∧ ∀v.∃z.(v =^dot f (z)) ∨ (v =^dot u)))[(f(x)) / y]\
      &= ∀u.((P (u, y) ∧ ∀v.∃z.(v =^dot f (z)) ∨ (v =^dot u))[(f(x)) / y])\
      &= ∀u.(P (u, y)[(f(x)) / y] ∧ (∀v.∃z.(v =^dot f (z)) ∨ (v =^dot u))[(f(x)) / y])\
      &= ∀u.(P (u[(f(x)) / y], y[(f(x)) / y]) ∧ ∀v.∃z.(((v =^dot f (z)) ∨ (v =^dot u))[(f(x)) / y]))\
      &= ∀u.(P (u, f(x)) ∧ ∀v.∃z.((v =^dot f (z))[(f(x)) / y]) ∨ ((v =^dot u)[(f(x)) / y]))\
      &= ∀u.(P (u, f(x)) ∧ ∀v.∃z.(v[(f(x)) / y] =^dot f (z)[(f(x)) / y]) ∨ (v[(f(x)) / y] =^dot u[(f(x)) / y]))\
      &= ∀u.(P (u, f(x)) ∧ ∀v.∃z.(v =^dot f (z[(f(x)) / y])) ∨ (v =^dot u))\
      &= ∀u.(P (u, f(x)) ∧ ∀v.∃z.(v =^dot f (z)) ∨ (v =^dot u))
    $
$(exists^(>=23)x. not (x and not x)) and not (exists^(>=24)x. not (x and not x))$
$(exists^(>=23)x. not (x and not x)) and not (exists^(>=24)x. not (x and not x))$
$ {x|L(x, a, b) or L(a, x, b) or L(a, b, x)}union{a, b} $
$ forall x. forall y. P(x) and P(y) and not S(x, y) =>\
   ((exists l. Q(l) and I(x, l) and I(y, l))and (forall l_1. forall l_2. Q(l_1) and Q(l_2)=>((I(x, l_1) and I(x, l_2) and I(y, l_1) and I(y, l_2))=>S(l_1, l_2)))) $
$M scripts(tack.r.double.not)_sigma ∀x.(P (x) → Q(x)) ∧ ∀x.(R(x) → ¬Q(x)) → ∃x.(P (x) ∧ R(x))$
$ &quad (∀x.(P (x) → Q(x)) ∧ ∀x.(R(x) → ¬Q(x)) → ∃x.(P (x) ∧ R(x)))_(M[sigma])\
    &= (∀x.(P (x) → Q(x)) ∧ ∀x.(R(x) → ¬Q(x)))_(M[sigma]) →_* (∃x.(P (x) ∧ R(x)))_(M[sigma])\
    &= (∀x.(P (x) → Q(x)))_(M[sigma]) ∧_* (∀x.(R(x) → ¬Q(x)))_(M[sigma]) →_* (P (a)_(M[sigma]) ∧_* R(x)_(M[sigma]))\
    &= (P (a)_(M[sigma]) →_* Q(a)_(M[sigma])) ∧_* (R(a)_(M[sigma]) →_* ¬_*Q(a)_(M[sigma])) →_* (P (a)_(M[sigma]) ∧_* R(x)_(M[sigma]))\
    &= (F →_* F) ∧_* (F →_* ¬_*F) →_* (F ∧_* F)\
    &= T and_* T ->_* F = T ->_* F = F $
$∀x.(P (x) → Q(x)) ∧ ∀x.(R(x) → ¬Q(x)) → ∃x.(P (x) ∧ R(x))$
$tack.r.double.not ∀x.(P (x) → Q(x)) ∧ ∀x.(R(x) → ¬Q(x)) → ∃x.(P (x) ∧ R(x))$
$tack.r.not ∀x.(P (x) → Q(x)) ∧ ∀x.(R(x) → ¬Q(x)) → ∃x.(P (x) ∧ R(x))$
$ phi_(M[sigma]) &= (∀x.(P (x) → Q(x)) → (∃x.P (x) → ∀x.Q(x))_(M[sigma])\
    &= (∀x.(P (x) → Q(x)))_(M[sigma]) →_* ((∃x.P (x) → ∀x.Q(x))_(M[sigma])\
    &= (P(a)_(M[sigma]) ->_* Q(a)_(M[sigma]))->_* (P(a)_(M[sigma]) ->_* Q(a)_(M[sigma]))\
    &= (T ->_* T) ->_* (T ->_* T) = T ->_* T =T $
$ P(a)_(M[sigma]) = T \
     P(b)_(M[sigma]) = F \
     Q(a)_(M[sigma]) = T \
     Q(b)_(M[sigma]) = F $
$(P(a) → Q(a))_(M[sigma]) = P(a)_(M[sigma]) →_* Q(a)_(M[sigma]) = T →_* T = T$
$(P(b) → Q(b))_(M[sigma]) = P(b)_(M[sigma]) →_* Q(b)_(M[sigma]) = F →_* F = T$
$((∃x.P (x))_(M[sigma]) →_* (∀x.Q(x))_(M[sigma])) = T →_* F = F$
$ phi_(M[sigma]) &= (∀x.(P (x) → Q(x)))_(M[sigma]) →_* ((∃x.P (x))_(M[sigma]) →_* (∀x.Q(x))_(M[sigma])) \
    &= T →_* (T →_* F) \
    &= T →_* F \
    &= F $
$ U_i=cases(exists x. x=x &i=1,
   limits(op(exists))_(j=1)^n x_j. limits(op(display(and.big)))_(1<=p<q<=n) x_p != x_q quad &i>=2) $
$ U_i=cases(exists x. x=x quad quad i=1 ,
  limits(op(exists))_(j=1)^n x_j. limits(op(and))_(1<=p<q<=n) x_p != x_q) $
$ U_i=cases(exists x. x=x quad quad i=1 ,
  limits(op(display(#{show math.equation: set text(size: 100pt) ;$
$})))_(j=1)^n x_j. display(limits(op(and.big)))_(1<=p<q<=n) x_p != x_q) $
$ nabla^2 arrow(U) = 1/v^2 (partial^2 arrow(U))/(partial t^2) $
$ T=(sqrt((x_i-x_p)^2+z_p^2)+sqrt((x_j-x_p)^2+z_p^2))/v $
$ I = sum_i sum_j S_(i,j)(T) = sum_i sum_j S_(i,j)((sqrt((x_i-x_p)^2+z_p^2)+sqrt((x_j-x_p)^2+z_p^2))/v) $
$ p = integral.double_S f/h U i e^(2 pi f (t - h/c))dif S $
$ cal(F)(f)(x) = sum_(n in ZZ) hat(f)(n)e^(2 pi i n x) = sum_(n in ZZ) integral_(-infinity)^(infinity)f(x)e^(2 pi i n x) dif x dot e^(2 pi i n x) $
$ cal(S T F T)(f)(x, tau) = sum_(n in ZZ) hat(f)(n)e^(2 pi i n x) = sum_(n in ZZ) integral_(-infinity)^(infinity) omega(x-tau)f(x)e^(2 pi i n x) dif x dot e^(2 pi i n x) $
$ integral^(+infinity)_(-infinity) omega(t) dif t = 1 $
$ f(x) = 1/(sigma sqrt(2 pi)) e^(x^2/(2 sigma^2)) $
$ integral_(-infinity)^(+infinity) psi^2(t) dif t = 1 $
$ integral_(-infinity)^(+infinity) abs(psi(t)) dif t < +infinity $
$ integral_(-infinity)^(+infinity) psi(t) dif t = 0 $
$ psi(t) = 2/(sqrt(3 sigma) pi^(1/4))(1-(t/sigma)^2)e^(-t^2/(2sigma^2)) $
$ U(x', y', z')=1/(sqrt(4pi)R) U(x, y, z) e^(2 pi R/lambda i) $
$ U(x', y', z') = integral.double_D 1/(sqrt(4pi)R) U(x, y, 0) e^(2 pi R/lambda i) dif S $
$ R=sqrt((x'-x)^2+(y'-y)^2+z'^2)~z'+((-x+x')^2+(-y+y')^2)/(2 z')+ cal(O) (1/z')^3 $
$ 1/R = 1/sqrt((x'-x)^2+(y'-y)^2+z'^2) ~ 1/z'+ cal(O) (1/z')^3 $
$ U(x', y', z') &= integral.double_D 1/(sqrt(4pi)R) U(x, y, 0) e^(2 pi R/lambda i) dif S\
&= e^(2 pi z'/lambda i)/(sqrt(4pi)z') integral.double_D  U(x, y, 0) e^(2 pi ((-x+x')^2+(-y+y')^2)/(2 z' lambda) i) dif S\
&= 1/(sqrt(4pi)z') e^(2 pi z'/lambda i) dot e^( pi/(lambda z') (x'^2+y'^2) i) integral.double_D  U(x, y, 0) e^(-2pi(x x'/(lambda z')+y y'/(lambda z')) i) cancel(e^(pi((x'^2+y'^2)/(lambda z')) i)) dif S \
=> U(x'/(lambda z'), y'/(lambda z'), z')&= 1/(sqrt(4pi)z') e^(2 pi z'/lambda i) dot e^( pi/(lambda z') (x'^2+y'^2) i) cal(F)(U(x, y, \_=0)) #h(3em) (e^(pi((x'^2+y'^2)/(lambda z')) i)~1+cal(O)(1/z')) $
$1/(sqrt(4pi)z') e^(2 pi z'/lambda i) dot e^( pi/(lambda z') (x'^2+y'^2) i)$
$ mat(x'; t') = 1/sqrt(1-v^2/c^2)mat(1, -v; -v/c^2, 1) mat(x; t) $
$ R_(mu nu)-1/2R g_(mu nu) + Lambda g_(mu nu) = (8pi G)/c^4T_(mu nu) $
$ i planck.reduce dd("")/dd(t) ket(Psi(t))=hat(H) ket(Psi(t)) $
$ and_(p in {O_1, O_2,...}) p and {O_1, O_2,...} tack.r not S $
$ p_(k-1)&=p_k x+a_(k-1)\
    &= a_(k-1) + x sum_(j=k)^n a_j x^(j-k) ("归纳假设")\
    &= a_(k-1) + sum_(j=k)^n a_j x^(j-(k-1))\
    &= sum_(j=k-1)^n a_j x^(j-(k-1)) $
$"INT-MUL"(y, z) = "INT-MUL"(c times y, floor(z / c))+y times (z mod c)) = "INT-MUL"(c times y, 0) + y z =^("由定义") 0 + y z = y z$
$c^(k-1)<=z<=c^k=>c^(k-2)<=z / c<=c^(k-1)=>floor(c^(k-2))<=floor(z / c)<=floor(c^(k-1))=>c^(k-2)<=floor(z / c)<=c^(k-1)$
$ "INT-MUL"(y, z) &= "INT-MUL"(c times y, floor(z / c))+y times (z mod c)) (c^(k-1)<=z<=c^k)\
    &= c times y times floor(z / c)+y times (z mod c))("归纳假设")\
    &= c y floor(z / c) + y times (z-floor(z / c) times c)("定义")\
    &= c y floor(z / c) + y z - y floor(z / c) c\
    &= y z $
$
    10 times 1 / n times (n / 4 -1 + 1) + 20 times 2 / n times (n / 2-n / 4) + 30 times 1 / (2n) times ((3n) / 4-n / 2) + n times 1 / (2n) times (n-(3n) / 4)\
    =5 / 2+10+15 / 4+n / 8=65 / 4+n / 8
  $
$forall i in [0, n-2], j in [1, n-1], i<j: A[i] != A[j]$
$ sum_(i=0)^(n-2)sum_(j=i+1)^(n-1) 1 = binom(n, 2) = (n(n-1)) / 2~n^2 $
$ (sum_(i=1)^(binom(n, 2))i) / (binom(n, 2)) = (sum_(i=1)^(binom(n, 2))i) / (binom(n, 2)) = ((binom(n, 2)(binom(n, 2)+1)) / 2) / (binom(n, 2))=(binom(n, 2)+1) / 2 = (n^2-n+2) / 4~n^2 $
$(0, 1), (0, 2), ..., (0, n-1), (1, 2), (1, 3), ......$
$ p_i=1 / (k-j_(i-1))p_(i-1) = 1 / (k-j_(i-1))times product_(l=m_j_i)^i 1 / (k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1) / ((k-l)^(n-l-1)) $
$ sum_(i=0)^(binom(n, 2))p_i = sum_(i=0)^(binom(n, 2))(1 / (k-j_(i-1))times product_(l=m_j_i)^i 1 / (k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1) / ((k-l)^(n-l-1))) $
$ sum_(i=0)^(binom(n, 2))(1 / (k-j_(i-1))times product_(l=m_j_i)^i 1 / (k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1) / ((k-l)^(n-l-1))) approx sum_(i=0)^(n-2)(n-i-1) / (k-i) $
$ sum_(i=0)^(n-2)(n-i-1) / (k-i)&~integral_(0)^(n-2)(n-i-1) / (k-i) dd(i) = n - 2 + (k - n + 1) log (k - n + 2) / k $
$ n - 2 + (k - n + 1) log (k - n + 2) / k ~ n+n log k / n ~ n + c' n log (c'' n + c''') / n ~ n $
$ log((k - n + 2) / k) = - (n - 2) / k - ((n - 2) / k)^2 / 2 + cal(O)((n / k)^3) $
$ n - 2 + (k - n + 1) log (k - n + 2) / k &= n-2-(k(1-n / k)+1)((n - 2) / k + ((n - 2) / k)^2 / 2 + cal(O)((n / k)^3))\
        &~ n-2-k(1-n / k)((n - 2) / k + ((n - 2) / k)^2 / 2 + cal(O)((n / k)^3))\
        &= n-2- (1 - n / k) ( (n - 2)+ (n - 2)^2 / (2k) +cal(O)(n^3 / k^2))\
        &= n-2-(n-2-(n-2)n / k+(n-2)^2 / (2k)+cal(O)(n^3 / k^2))\
        &= (n-2)n / k + (n-2)^2 / (2k)+cal(O)(n^3 / k^2)\
        &~ n^2 / k $
$ &p_i = product_(j=0)^(i-1) (k-j) / k\
      =>&log p_i = sum_(j=0)^(i-1)log (k-j) / k=sum_(j=0)^(i-1)log (1-j / k) approx - sum_(j=0)^(i-1)log j / k = -(i(i-1)) / (2k) (j / k"不大")\
      =>& p_i = e^(-(i(i-1)) / (2k)) $
$ &F(i)=1-p_i=1-e^(-(i(i-1)) / (2k))\
      =>&f(i)=dd(F) / dd(i) = (e^(-((i-1) i) / (2 k)) (-1+2 i)) / (2 k) $
$ E= integral_0^(+infinity) i f(i) dd(i) = integral_0^(+infinity) i (e^(-((i-1) i) / (2 k)) (-1+2 i)) / (2 k) dd(i) = e^(1 / (8k)) sqrt(pi / 2 k) (1+"erf"(1 / (2 sqrt(2k)))) $
$ e^(1 / (8k)) (1+"erf"(1 / (2 sqrt(2k))))~1 (k->+infinity) $
$ sum_(i=0)^(sqrt(pi / 2 k)-1)i = (sqrt(pi / 2 k)-1)sqrt(pi / 2 k) / 2=(k pi-sqrt(2k pi)) / 4~k $
$cases(Theta(n^2) quad &(n<<k), Theta(n) quad &(n approx k), Theta(k) quad &(n>>k))$
$ forall n>=1, n in NN: exists! k in NN: 2^k<=n<=2^(k+1)-1 $
$ 2^k<=n<=2^(k+1)-1&=> k=log 2^k<=log n<=log(2^(k+1)-1)<log(2^(k+1))=k+1\
  &=> floor(log n)+1 = k+1 $
$ 2^k+1 <= n+1 <= 2^(k+1)&=>k=log(2^k)<log(2^k+1)<=log(n+1)<=log(2^(k+1))=k+1\
  &=>ceil(log(n+1))=k+1 $
$
        0 <= f(n) <= c_1 g(n) <= c_1 c_2 h(n) = c h(n)
      $
$
        f(n) >= c_1 g(n) >= c_1 c_2 h(n) = c h(n)
      $
$
        c_1 c_3 h(n) <= c_1 g(n) <= f(n) <= c_2 g(n) <= c_2 c_4 h(n)
      $
$
        0 <= f(n) < epsilon_1 g(n) < epsilon_1 epsilon_2 h(n) = epsilon h(n)
      $
$
        f(n) > M_1 g(n) > M_1 M_2 h(n) = M h(n)
      $
$
        1 / c_2 f(n) <= g(n) <= 1 / c_1 f(n)
      $
$
        f(n) >= c_1 g(n) "且" f(n) < c_1 g(n)
      $
$
        f(n) <= c_2 g(n) "且" f(n) > c_2 g(n)
      $
$ log n, n, n log n, n^2, n^2 + log n, n^3, 7n^5 - n^3+n, 2^n $
$
      log log n, log^2 n, ln n, log n, sqrt(n), n, n log n, n^(1+epsilon), n^2, n^2 + log n, n^3, 7n^5 - n^3+n, 2^(n-1), 2^n, e^n, n!
    $
$ T(n) = sum_(i=0)^(log n)c(log n - i log 2) ~ c log^2 n-c log 2 ((log n)(log n + 1)) / 2 ~ log^2n in Theta(log^2 n) $
$f(n)=n in Theta(n) in Omega(n^(log_b a+epsilon))=Omega(n^epsilon)$
$f(n) = Θ(n) = Θ(n^(log_b a)) = Theta(n^(log_2 2))=Theta(n)$
$f(n) = Θ(n^(log_b a) · log^k n)=>T(n) = Θ(n^(log_b a) · log^(k+1) n)$
$f(n) = Θ(n^(log_b a) · log^k n)=>T(n) = Θ(n^(log_b a) · log^(k+1) n)$
$log_b a = log_25 49 = log_5 7 approx 1.2 < 3 / 2=>f(n)=n^1.5 log n = Omega(n^(log_5 7))$
$a f(n / b)=49(n / 25)^(3 / 2)log(n / 25) = 49 n^1.5 / 125 (log n-log 25) <= k n^1.5 log n$
$k >= 49 / 125 (log n - 2 log 5) / (log n) = 49 / 125 (1- (2 log 5) / (log n))$
$ T(n) = sum_(i=0)^n i^c ~ integral_0^n i^c dd(i) ~ i^(c+1)|_0^n ~ n^(c+1) in Theta(n^(c+1)) $
$ T(n) = sum_(i=0)^n c^i ~ integral_0^n c^i dd(i) ~ c^i / (log c)|_0^n ~ c^n in Theta(c^n) $
$ &T(n)-T(n-2)=2n^3-3n^2+3n-1=n^3+(n-1)^3\
    =>&T(n)=sum_(i=1)^n i^3"在形式上符合递推式" $
$ T(n)=sum_(i=1)^n i^3=(sum_(i=1)^n i)^2=((n(n+1)) / 2)^2~n^4 in Theta(n^4) $
$T(n) = T(n / 2) + T(n / 4) +T(n / 8) + n > 0+0+0+n=n$
$T(n)=T(n / 2) + T(n / 4) +T(n / 8)+n<=c n(1 / 2 + 1 / 4+ 1 / 8)+n=n(1+7 / 8c)$
$U(m) = T(2^m)=>T(n)=U(m) = 2^(m / 2)T(2^(m / 2)) + O(2^m)= 2^(m / 2)U(m / 2) + O(2^m) => U(m) / 2^m = U(m / 2) / 2^(m / 2)+O(1)("同除"2^m)$
$V(m) = U(m) / 2^m => V(m) = V(m / 2) + O(1)=>V(m) = Theta(log m) => U(m) = 2^m V(m) = 2^m Theta(log m) = Theta(2^m log m) = T(2^m) => T(n) = Theta(n log log n)$
$ sum_(i=1)^(n-1)sum_(j=i+1)^n sum_(k=1)^j 1 &= sum_(i=1)^(n-1)sum_(j=i+1)^n j\
    &= sum_(i=1)^(n-1)n-i\
    &= (n-1)n -(n(n-1)) / 2\
    &=(n(n-1)) / 2\
    &=O(n^2) $
$ sum_(i=1)^(n)sum_(j=1)^i sum_(k=j)^(i+j) 1 &= sum_(i=1)^(n)sum_(j=1)^i i+1\
    &= sum_(i=1)^(n)i(i+1)\
    &= sum_(i=1)^(n)i^2 + sum_(i=1)^(n)i\
    &= (n(n+1)(2n+1)) / 6 +(n(n+1)) / 2\
    &= O(n^3) $
$ sum_(i=1)^(n)sum_(j=1)^i sum_(k=j)^(i+j)sum_(l=1)^(i+j-k) 1 &= sum_(i=1)^(n)sum_(j=1)^i sum_(k=j)^(i+j)i+j-k \
    &= sum_(i=1)^(n)sum_(j=1)^i (i+1)(i+j)-((i+2j)(i+1)) / 2\
    &= sum_(i=1)^(n)sum_(j=1)^i (i(i+1)) / 2\
    &= sum_(i=1)^(n) (i^2(i+1)) / 2\
    &= 1 / 2 (sum_(i=1)^(n)i^3 + sum_(i=1)^(n) i^2)\
    &= 1 / 2 ((n(n+1) / 2)^2+(n(n+1)(2n+1)) / 6)\
    &= O(n^4) $
$ sum_(i=1)^(n)sum_(j=i+1)^n sum_(k=i+j-1)^n 1 &= sum_(i=1)^(n)sum_(j=i+1)^n n-i-j+2\
    &= sum_(i=1)^(n)((i-n)(3i-n-3)) / 2\
    &= (n^2-n) / 2\
    &= O(n^2) $
$ sum_(i=2)^n sum_(j=1)^(i-1)1=sum_(i=2)^n i-1 = (n(n-1)) / 2 ~ n^2 in Theta(n^2) $
$
        P("最大的标号为"k)=product_(i=k+1)^n (1 / 2)^(i-1) = sqrt(2)^((k - n) (-1 + k + n))
      $
$
        E=sum_(i=2)^n i (1-sqrt(2)^((i - n) (-1 + i + n)))~integral_(2)^n i （1-sqrt(2)^((i - n) (-1 + i + n))) dd(i)\
        =
      $
$
      (-4+n+(1 / (log 2))2^(-(5 / 8)-n^2 / 2) (2^(13 / 8) (2^(1+n / 2)-2^(n^2 / 2))+2^(n / 2) "erfi"(3 / 2 sqrt((log 2) / 2)) sqrt(pi log 2)-2^(n / 2) "erfi"((-1+2 n) / 2 sqrt((log 2) / 2)) sqrt(pi log 2))) / 2\
      ~n / 2 in Theta(n)
    $
$forall i in [0, n-2], j in [1, n-1], i<j: A[i] != A[j]$
$ sum_(i=0)^(n-2)sum_(j=i+1)^(n-1) 1 = binom(n, 2) = (n(n-1)) / 2~n^2 $
$ (sum_(i=1)^(binom(n, 2))i) / (binom(n, 2)) = (sum_(i=1)^(binom(n, 2))i) / (binom(n, 2)) = ((binom(n, 2)(binom(n, 2)+1)) / 2) / (binom(n, 2))=(binom(n, 2)+1) / 2 = (n^2-n+2) / 4~n^2 $
$(0, 1), (0, 2), ..., (0, n-1), (1, 2), (1, 3), ......$
$ p_i=1 / (k-j_(i-1))p_(i-1) = 1 / (k-j_(i-1))times product_(l=m_j_i)^i 1 / (k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1) / ((k-l)^(n-l-1)) $
$ sum_(i=0)^(binom(n, 2))p_i = sum_(i=0)^(binom(n, 2))(1 / (k-j_(i-1))times product_(l=m_j_i)^i 1 / (k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1) / ((k-l)^(n-l-1))) $
$ sum_(i=0)^(binom(n, 2))(1 / (k-j_(i-1))times product_(l=m_j_i)^i 1 / (k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1) / ((k-l)^(n-l-1))) approx sum_(i=0)^(n-2)(n-i-1) / (k-i) $
$ sum_(i=0)^(n-2)(n-i-1) / (k-i)&~integral_(0)^(n-2)(n-i-1) / (k-i) dd(i) = n - 2 + (k - n + 1) log (k - n + 2) / k $
$ n - 2 + (k - n + 1) log (k - n + 2) / k ~ n+n log k / n ~ n + c' n log (c'' n + c''') / n ~ n $
$ log((k - n + 2) / k) = - (n - 2) / k - ((n - 2) / k)^2 / 2 + cal(O)((n / k)^3) $
$ n - 2 + (k - n + 1) log (k - n + 2) / k &= n-2-(k(1-n / k)+1)((n - 2) / k + ((n - 2) / k)^2 / 2 + cal(O)((n / k)^3))\
        &~ n-2-k(1-n / k)((n - 2) / k + ((n - 2) / k)^2 / 2 + cal(O)((n / k)^3))\
        &= n-2- (1 - n / k) ( (n - 2)+ (n - 2)^2 / (2k) +cal(O)(n^3 / k^2))\
        &= n-2-(n-2-(n-2)n / k+(n-2)^2 / (2k)+cal(O)(n^3 / k^2))\
        &= (n-2)n / k + (n-2)^2 / (2k)+cal(O)(n^3 / k^2)\
        &~ n^2 / k $
$ &p_i = product_(j=0)^(i-1) (k-j) / k\
      =>&log p_i = sum_(j=0)^(i-1)log (k-j) / k=sum_(j=0)^(i-1)log (1-j / k) approx - sum_(j=0)^(i-1)log j / k = -(i(i-1)) / (2k) (j / k"不大")\
      =>& p_i = e^(-(i(i-1)) / (2k)) $
$ &F(i)=1-p_i=1-e^(-(i(i-1)) / (2k))\
      =>&f(i)=dd(F) / dd(i) = (e^(-((i-1) i) / (2 k)) (-1+2 i)) / (2 k) $
$ E= integral_0^(+infinity) i f(i) dd(i) = integral_0^(+infinity) i (e^(-((i-1) i) / (2 k)) (-1+2 i)) / (2 k) dd(i) = e^(1 / (8k)) sqrt(pi / 2 k) (1+"erf"(1 / (2 sqrt(2k)))) $
$ e^(1 / (8k)) (1+"erf"(1 / (2 sqrt(2k))))~1 (k->+infinity) $
$ sum_(i=0)^(sqrt(pi / 2 k)-1)i = (sqrt(pi / 2 k)-1)sqrt(pi / 2 k) / 2=(k pi-sqrt(2k pi)) / 4~k $
$cases(Theta(n^2) quad &(n<<k), Theta(n) quad &(n approx k), Theta(k) quad &(n>>k))$
$ mat(x'; t') = mat(1, -v; 0, 1) mat(x; t) &~~> mat(x'; t') = 1/sqrt(1-v^2/c^2)mat(1, -v; -v/c^2, 1) mat(x; t) \
&~~>R_(mu nu)-1/2R g_(mu nu) + Lambda g_(mu nu) = (8pi G)/c^4T_(mu nu) $
$ i planck.reduce dd("")/dd(t) ket(Psi(t))=hat(H) ket(Psi(t)) $
$ delta integral_(t_1) ^(t_2) L(arrow(q), arrow(dot(q)), t) dd(t)=0 $
$ R_(mu nu)-1/2R g_(mu nu) + Lambda g_(mu nu) = (8pi G)/c^4T_(mu nu) $
$tau: angle.l "emp" arrow.hook t, "ins" arrow.hook "nat" -> t -> t, "rem" arrow.hook t->"nat"times t angle.r$
$tau': angle.l "emp" arrow.hook t, "ins" arrow.hook "nat" -> t -> t angle.r$
$∀x. Q(x) -> P => ∀x. ¬Q(x) ∨ P => (¬¬∀x. ¬Q(x)) ∨ P => (¬∃x. Q(x)) ∨ P => (∃x. Q(x)) -> P
$
$ p=1-(1-2^(-10))^(1000000) tilde.eq 99.9999999...% $
$ #text(red)[#sym.circle.filled] =>(C I E) ...0100101 =>(f) ...1101100#text()[(uniform & unique)] $
$ hat(n) tilde.eq 2^((1/(log 2) -1) #text()[cnt]) $
$ epsilon_n tilde ((Gamma (-1/m)(1-2^(1/m))/(log 2))^m+ epsilon.alt_n)n $
$ nu_n tilde ((Gamma (-2/m)(1-2^(2/m))/(log_2 m))^m - (Gamma (-1/m)(1-2^(1/m))/(log_2 m))^(2m) + eta_n)n^2 $
$ hat(n) tilde.eq ((Gamma (-1/m)(1-2^(1/m))/(log 2)) - m)2^(1/m) sum_(i <= m) #text[cnt]_i $
$ p_(k-1)&=p_k x+a_(k-1)\
&= a_(k-1) + x sum_(j=k)^n a_j x^(j-k) ("归纳假设")\
&= a_(k-1) + sum_(j=k)^n a_j x^(j-(k-1))\
&= sum_(j=k-1)^n a_j x^(j-(k-1)) $
$"INT-MUL"(y, z) = "INT-MUL"(c times y, floor(z/c))+y times (z mod c)) = "INT-MUL"(c times y, 0) + y z =^("由定义") 0 + y z = y z$
$c^(k-1)<=z<=c^k=>c^(k-2)<=z/c<=c^(k-1)=>floor(c^(k-2))<=floor(z/c)<=floor(c^(k-1))=>c^(k-2)<=floor(z/c)<=c^(k-1)$
$ "INT-MUL"(y, z) &= "INT-MUL"(c times y, floor(z/c))+y times (z mod c)) (c^(k-1)<=z<=c^k)\
  &= c times y times floor(z/c)+y times (z mod c))("归纳假设")\
  &= c y floor(z/c) + y times (z-floor(z/c) times c)("定义")\
  &= c y  floor(z/c) + y z - y floor(z/c) c\
  &= y z $
$ 10 times 1/n times (n/4 -1 + 1) + 20 times 2/n times (n/2-n/4) + 30 times 1/(2n) times ((3n)/4-n/2) + n times 1/(2n) times (n-(3n)/4)\
=5/2+10+15/4+n/8=65/4+n/8 $
$forall i in [0, n-2], j in [1, n-1], i<j: A[i] != A[j]$
$ sum_(i=0)^(n-2)sum_(j=i+1)^(n-1) 1 = binom(n, 2) = (n(n-1))/2~n^2 $
$ (sum_(i=1)^(binom(n, 2))i)/(binom(n, 2)) = (sum_(i=1)^(binom(n, 2))i)/(binom(n, 2)) = ((binom(n, 2)(binom(n, 2)+1))/2)/(binom(n, 2))=(binom(n, 2)+1)/2 = (n^2-n+2)/4~n^2 $
$(0, 1), (0, 2), ..., (0, n-1), (1, 2), (1, 3), ......$
$ p_i=1/(k-j_(i-1))p_(i-1) = 1/(k-j_(i-1))times product_(l=m_j_i)^i 1/(k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1)/((k-l)^(n-l-1)) $
$ sum_(i=0)^(binom(n, 2))p_i = sum_(i=0)^(binom(n, 2))(1/(k-j_(i-1))times product_(l=m_j_i)^i 1/(k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1)/((k-l)^(n-l-1))) $
$ sum_(i=0)^(binom(n, 2))(1/(k-j_(i-1))times product_(l=m_j_i)^i 1/(k-j_(l-1)) times product_(l=0)^(j_(i-1)-1)A_(k-l-1)^(n-l-1)/((k-l)^(n-l-1))) approx sum_(i=0)^(n-2)(n-i-1)/(k-i) $
$ sum_(i=0)^(n-2)(n-i-1)/(k-i)&~integral_(0)^(n-2)(n-i-1)/(k-i) dd(i) = n - 2 + (k - n + 1) log (k - n + 2)/k $
$ n - 2 + (k - n + 1) log (k - n + 2)/k ~ n+n log k/n ~ n + c' n log (c'' n + c''')/n ~ n $
$ log((k - n + 2)/k) = - (n - 2)/k - ((n - 2)/k)^2/2 + cal(O)((n/k)^3) $
$ n - 2 + (k - n + 1) log (k - n + 2)/k &= n-2-(k(1-n/k)+1)((n - 2)/k + ((n - 2)/k)^2/2 + cal(O)((n/k)^3))\
      &~ n-2-k(1-n/k)((n - 2)/k + ((n - 2)/k)^2/2 + cal(O)((n/k)^3))\
      &= n-2- (1 - n/k) ( (n - 2)+ (n - 2)^2/(2k) +cal(O)(n^3/k^2))\
      &= n-2-(n-2-(n-2)n/k+(n-2)^2/(2k)+cal(O)(n^3/k^2))\
      &= (n-2)n/k + (n-2)^2/(2k)+cal(O)(n^3/k^2)\
      &~ n^2/k $
$ &p_i = product_(j=0)^(i-1) (k-j)/k\
    =>&log p_i = sum_(j=0)^(i-1)log (k-j)/k=sum_(j=0)^(i-1)log (1-j/k) approx - sum_(j=0)^(i-1)log j/k = -(i(i-1))/(2k) (j/k"不大")\
    =>& p_i = e^(-(i(i-1))/(2k)) $
$ &F(i)=1-p_i=1-e^(-(i(i-1))/(2k))\
    =>&f(i)=dd(F)/dd(i) = (e^(-((i-1) i)/(2 k)) (-1+2 i))/(2 k) $
$ E= integral_0^(+infinity) i f(i) dd(i) = integral_0^(+infinity) i (e^(-((i-1) i)/(2 k)) (-1+2 i))/(2 k) dd(i) = e^(1/(8k)) sqrt(pi/2 k) (1+"erf"(1/(2 sqrt(2k)))) $
$ e^(1/(8k)) (1+"erf"(1/(2 sqrt(2k))))~1 (k->+infinity) $
$ sum_(i=0)^(sqrt(pi/2 k)-1)i = (sqrt(pi/2 k)-1)sqrt(pi/2 k)/2=(k pi-sqrt(2k pi))/4~k $
$cases(Theta(n^2) quad &(n<<k), Theta(n) quad &(n approx k), Theta(k) quad &(n>>k))$
$ forall n>=1, n in NN: exists! k in NN: 2^k<=n<=2^(k+1)-1 $
$ 2^k<=n<=2^(k+1)-1&=> k=log 2^k<=log n<=log(2^(k+1)-1)<log(2^(k+1))=k+1\
&=> floor(log n)+1 = k+1 $
$ 2^k+1 <= n+1 <= 2^(k+1)&=>k=log(2^k)<log(2^k+1)<=log(n+1)<=log(2^(k+1))=k+1\
&=>ceil(log(n+1))=k+1 $
$
    0 <= f(n) <= c_1 g(n) <= c_1 c_2 h(n) = c h(n)
    $
$
    f(n) >= c_1 g(n) >= c_1 c_2 h(n) = c h(n)
    $
$
    c_1 c_3 h(n) <= c_1 g(n) <= f(n) <= c_2 g(n) <= c_2 c_4 h(n)
    $
$
    0 <= f(n) < epsilon_1 g(n) < epsilon_1 epsilon_2 h(n) = epsilon h(n)
    $
$
    f(n) > M_1 g(n) > M_1 M_2 h(n) = M h(n)
    $
$
      f(n) >= c_1 g(n) "且" f(n) < c_1 g(n)
      $
$
      f(n) <= c_2 g(n) "且" f(n) > c_2 g(n)
      $
$ log n, n, n log n, n^2, n^2 + log n, n^3, 7n^5 - n^3+n, 2^n $
$ log log n, log^2 n, ln n, log n, sqrt(n), n, n log n, n^(1+epsilon), n^2, n^2 + log n, n^3, 7n^5 - n^3+n, 2^(n-1), 2^n, e^n, n! $
$ T(n) = sum_(i=0)^(log n)c(log n - i log 2) ~ c log^2 n-c log 2 ((log n)(log n + 1))/2 ~ log^2n in Theta(log^2 n) $
$f(n)=n in Theta(n) in Omega(n^(log_b a+epsilon))=Omega(n^epsilon)$
$f(n) = Θ(n) = Θ(n^(log_b a)) = Theta(n^(log_2 2))=Theta(n)$
$f(n) = Θ(n^(log_b a) · log^k n)=>T(n) = Θ(n^(log_b a) · log^(k+1) n)$
$f(n) = Θ(n^(log_b a) · log^k n)=>T(n) = Θ(n^(log_b a) · log^(k+1) n)$
$log_b a = log_25 49 = log_5 7 approx 1.2 < 3/2=>f(n)=n^1.5 log n = Omega(n^(log_5 7))$
$a f(n/b)=49(n/25)^(3/2)log(n/25) = 49 n^1.5 / 125 (log n-log 25) <= k n^1.5 log n$
$k >= 49/125 (log n - 2 log 5)/(log n) = 49/125 (1- (2 log 5)/(log n))$
$ T(n) = sum_(i=0)^n i^c ~ integral_0^n i^c dd(i) ~ i^(c+1)|_0^n ~ n^(c+1) in Theta(n^(c+1)) $
$ T(n) = sum_(i=0)^n c^i ~ integral_0^n c^i dd(i) ~ c^i/(log c)|_0^n ~ c^n in Theta(c^n) $
$ &T(n)-T(n-2)=2n^3-3n^2+3n-1=n^3+(n-1)^3\
=>&T(n)=sum_(i=1)^n i^3"在形式上符合递推式" $
$ T(n)=sum_(i=1)^n i^3=(sum_(i=1)^n i)^2=((n(n+1))/2)^2~n^4 in Theta(n^4) $
$T(n)=T(n/2) + T(n/4) +T(n/8)+n<=c n(1/2 + 1/4+ 1/8)+n=n(1+7/8c)$
$U(m) = T(2^m)=>T(n)=U(m) = 2^(m/2)T(2^(m/2)) + O(2^m)= 2^(m/2)U(m/2) + O(2^m) => U(m)/2^m = U(m/2)/2^(m/2)+O(1)("同除"2^m) $
$V(m) = U(m)/2^m => V(m) = V(m/2) + O(1)=>V(m) = Theta(log m) => U(m) = 2^m V(m) = 2^m Theta(log m) = Theta(2^m log m) = T(2^m) => T(n) = Theta(n log log n)$
$ sum_(i=1)^(n-1)sum_(j=i+1)^n sum_(k=1)^j 1 &= sum_(i=1)^(n-1)sum_(j=i+1)^n j\
&= sum_(i=1)^(n-1)n-i\
&= (n-1)n -(n(n-1))/2\
&=(n(n-1))/2\
&=O(n^2) $
$ sum_(i=1)^(n)sum_(j=1)^i sum_(k=j)^(i+j) 1 &= sum_(i=1)^(n)sum_(j=1)^i i+1\
&= sum_(i=1)^(n)i(i+1)\
&= sum_(i=1)^(n)i^2 + sum_(i=1)^(n)i\
&= (n(n+1)(2n+1))/6 +(n(n+1))/2\
&= O(n^3) $
$ sum_(i=1)^(n)sum_(j=1)^i sum_(k=j)^(i+j)sum_(l=1)^(i+j-k) 1 &= sum_(i=1)^(n)sum_(j=1)^i sum_(k=j)^(i+j)i+j-k \
&= sum_(i=1)^(n)sum_(j=1)^i (i+1)(i+j)-((i+2j)(i+1))/2\
&= sum_(i=1)^(n)sum_(j=1)^i (i(i+1))/2\
&= sum_(i=1)^(n) (i^2(i+1))/2\
&= 1/2 (sum_(i=1)^(n)i^3 + sum_(i=1)^(n) i^2)\
&= 1/2 ((n(n+1)/2)^2+(n(n+1)(2n+1))/6)\
&= O(n^4) $
$ sum_(i=1)^(n)sum_(j=i+1)^n sum_(k=i+j-1)^n 1 &= sum_(i=1)^(n)sum_(j=i+1)^n n-i-j+2\
&= sum_(i=1)^(n)((i-n)(3i-n-3))/2\
&= (n^2-n)/2\
&= O(n^2) $
$ sum_(i=2)^n sum_(j=1)^(i-1)1=sum_(i=2)^n i-1 = (n(n-1))/2 ~ n^2 in Theta(n^2) $
$ P("最大的标号为"k)=product_(i=k+1)^n (1/2)^(i-1) = sqrt(2)^((k - n)  (-1 + k + n)) $
$ E=sum_(i=2)^n i (1-sqrt(2)^((i - n)  (-1 + i + n)))~integral_(2)^n i （1-sqrt(2)^((i - n)  (-1 + i + n))) dd(i)\
  = $
$ (-4+n+(1/(log 2))2^(-(5/8)-n^2/2) (2^(13/8) (2^(1+n/2)-2^(n^2/2))+2^(n/2) "erfi"(3/2 sqrt((log 2)/2)) sqrt(pi log 2)-2^(n/2) "erfi"((-1+2 n)/2 sqrt((log 2) /2)) sqrt(pi log 2)))/2\
  ~n/2 in Theta(n) $
$ T(n)=n+n-1+sum_(i=0)^(n-1)1/n (T(i)+T(n-i-1)) quad (n>=2) $
$ T(n)=O(n)+sum_(i=0)^(n-1)1/n (T(i)+T(n-i-1)) quad (n>=2) $
$(10, 0), (9, 0), (8, 0), (0, 10), (0, 9), (0, 8), (5, 5), (4, 4)$
$ d^0+...+d^(m-2)+n=n+sum_(i=0)^(m-2)d^i=(d^(m-1)-1)/(d-1)+n quad (m>=2) $
$ (d^(m-2)-1)/(d-1)+ceil(n/d)=(d^(m-2)-1)/(d-1)+floor(n/d+1-1/d)=floor((d^(m-1)-1)/(d(d-1))-2/d+k/d+1)=floor((i-2)/d+1) $
$ sum_(x=1)^k x 2^(k-x) 
  &= sum_(x=1)^k x 2^k dot 1/(2^x) \
  &= 2^k sum_(x=1)^k x/(2^x) \
  $
$ &1/2S_k = sum_(x=1)^k x/(2^(x+1))\
  &=>S_k-1/2S_k=1/2S_k=sum_(x=1)^k 2^(-x)-k/2^(k+1)=1/2 dot (1-1/2^k)/(1-1/2) -k/2^(k+1) = 1-2^(-k)-k 2^(-(k+1))\
  &=> S_k = 2 - 2 dot 2^(-k) - k 2^(-k) = 2-(k+2)2^(-k) $
$ sum_(x=1)^k x 2^(k-x) = 2^k (2-(k+2)2^(-k)) = 2^(k+1)-k-2 = 2^(k+1)-1 -k-1=n-(k+1)<n-1 $
$2^k-k-1+2^(k-1)-k+k=2^k+2^(k-1) -k-1 = (2^k+2^(k-1)-1)-k=n-k<=n-1(k>=1)$
$(a+(a+b)/2)^2/4=1/16 (2a+b)^2=1/16 (4a^2+4a b+b^2)$
$(a+(a+(a+b)/2)/2)/2, ((a+b)/2+(a+(a+b)/2)/2)/2, ((a+b)/2+(b+(a+b)/2)/2)/2, ((b+(a+b)/2)/2+b)/2 $
$(4 alpha h_c)/(h_c + alpha 5 h_c)=4alpha/(5 alpha + 1)$
$ 3^k >= 2n+1\
  => k >= log_3(2n+1) => k >= ceil(log_3(2n+1)) $
$ (4.17"ms"+0.1024"ms"+10"ms"+2"ms")times 2+0.04"ms" = 32.5848"ms" $
$ upright(t)_(M 1) = n_(M 1)/f_(M 1) = (12 n)/(1"GHz") = 12n "ns" $
$ upright(t)_(M 2) = n_(M 2)/f_(M 2) = (19 n)/(1.5"GHz") = (38)/3n "ns" $
$ t = n_i/f = (n times "CPI")/f = (8 upright(G) times 1.25)/(4 "GHz") = 2.5 upright(s) $
$ "CPI"_(s 1) = (5+2times 2+2 times 3+4)/10 = 1.9 $
$ (12 upright(s) times (1-1/1.2) times 1.2 "GHz")/( 5-2) = 8 times 10^8 $
$ I_("total") = 500 upright(M) times 2 + 4000 upright(M) times 1 + 3000 upright(M) times 4 + 3000 upright(M) times 1  = 18000 upright(M) $
$ Delta"CPI"_("float") = (18000 upright(M))/(2 times 500 M) = 18 $
$ Delta"CPI"_("RAM") = (18000 upright(M))/(2 times 3000 M) = 3 $
$ t' = (500 upright(M) times 0.8 times 2 + 4000 upright(M) times 1 times 0.6 + 3000 upright(M) times 4 times 0.8 + 1000 upright(M) times 1 times 0.6)/(2.5"GHz") = 0.536 upright(s) $
$sum_(i=1)^n "RTT"_i+2"RTT"_0+8 times 2"RTT"_0 = sum_(i=1)^n "RTT"_i+18"RTT"_0$
$sum_(i=1)^n "RTT"_i+2"RTT"_0+2 times 2"RTT"_0 = sum_(i=1)^n "RTT"_i+6"RTT"_0$
$sum_(i=1)^n "RTT"_i+2"RTT"_0+"RTT"_0 = sum_(i=1)^n "RTT"_i+3"RTT"_0$
$x->z: x->y->z, x->w->z, x->w->y->z, x->v->w->z, x->v->w->y->z, x->v->u->w->z, x->v->u->w->y->z, x->u->w->z, x->u->w->y->z, x->u->v->w->z, x->u->v->w->y->z$
$z->u: z->y->x->u, z->y->x->v->u, z->y->x->w->u, z->y->x->w->v->u, z->y->w->x->u, z->y->w->v->u, z->y->w->u, z->y->w->x->v->u, z->y->w->v->x->u$
$z->w: z->w, z->y->w, z->y->x->w, z->y->x->v->w, z->y->x->v->u->w, z->y->x->u->w$
$ (8 times (2^32+ceil(2^32 / 536)times 66))/(155 times 10^6) = 482382523/1937500 approx 248.9716"s" $
$ "EstimatedRTT"_n = (1-alpha)^(n-1)"SampleRTT"_n + alpha sum_(i=1)^(n-1) (1-alpha)^(i-1)"SampleRTT"_i $
$ "EstimatedRTT"_n = alpha sum_(i=1)^(+infinity) (1-alpha)^(i-1)"SampleRTT"_i = alpha/(1-alpha) sum_(i=1)^(+infinity) (1-alpha)^i"SampleRTT"_i $
$ L = 1/((W/2)(sum_(i<= (log 2)/(log 1+ alpha)) (1+alpha)^i))=1/((W/2)((2alpha +1)/alpha))=(2alpha)/(W(2alpha +1)) $
$4 "MB"=4times 1000^2 times 8 "bit" = 32000000 "bit"\
    500 "kbps" = 5000000 "bit"\/"s"\
    t = 32000000/5000000 = 6.4 "s" $
$ P(X>=21)&=1-P(X<=20)=1-sum_(i=0)^20binom(120, i) 0.1^i 0.9^(120-i)\
&=1-(198411761550320602368936760148862963295633695942461558791069\
356206041400781918569485304582689366989977846954420978917821)/(2 times 10^119)\
&=(15882384496793976310632398511370367043663040575384412089306\
43793958599218081430514695417310633010022153045579021082179)/(2 times 10^119)\
&approx 0.00794119 $
$ P(X>=21)&=1-P(X<=20)approx 1-P(Y<=20)=1-P((Y-12)/sqrt(10.8)<= (20-12)/sqrt(10.8))\
  &=1-Phi((20-12)/sqrt(10.8)))approx 1-Phi(2.43432)approx 1-0.99254approx 0.00746 $
$ (20000 "km")/(2.5 times 10^8 "m/s")times 2"Mbps" = 4/25 "Mb" = 160000 "bit" $
$ (5 times 10^6)/(1500-40)=250000/73 approx 3424.66 lt.approx 3425 $
$f_1: {(0,0),(1,0)},f_2: {(0,1),(1,0)},f_3:{(0,0),(1,1)},f_4: {(0,1),(1,1)}$
$1 in ZZ\\{0}, 2 in ZZ\\{0}, "while" 1/2 in.not ZZ\\{0}$
$f_2(x):= cases(
    b "if" x=a or x=b,
    c "if" x=c 
  )$
$q = q and 1 = q and (x or p) = (q and x) or (q and p) = 0 or (q and p) = q and p$
$forall x, y in S: x and y prec.eq x prec.eq a in S$
$forall x, y in S: x or y prec.eq a or a prec.eq a in S$
$forall x, y in S: x and y prec.eq x prec.eq x or y$
$a prec.eq b prec.eq c: a and (b or c) = a and c = a, a and b or a and c = a or a = a$
$b prec.eq a prec.eq c: a and (b or c) = a and c = a, a and b or a and c = b or a = a$
$b prec.eq c prec.eq a: a and (b or c) = a and c = c, a and b or a and c = b or c = c$
$x prec.eq x or y, x prec.eq x or z => x prec.eq (x or y) and (x or z)$
$y and z prec.eq y prec.eq y or x, y and z prec.eq z prec.eq z or x => y and z prec.eq (y or x) and (z or x)$
$=> x or (y and z) prec.eq (x or y) and (x or z) or (x or y) and (x or z) = (x or y) and (x or z)$
$x succ.eq x and y, x succ.eq x and z => x succ.eq (x and y) or (x and z)$
$y or z succ.eq y succ.eq y and x, y or z succ.eq z succ.eq z and x => y or z succ.eq (y and x) or (z and x)$
$=> x and (y or z) succ.eq (x and y) or (x and z) and (x and y) or (x and z) = (x and y) or (x and z)$
$cal(V) delta(G) <= Sigma_(v in G)deg v <= cal(V) Delta(G)$
$therefore cal(V) delta(G) <= 2cal(E) <= cal(V) Delta(G) => delta(G) <= (2cal(E))/cal(V) <= Delta(G)$
$k = (2E)/V = (Sigma_(v in G)deg v)/V >= (V max_(v in G) deg v)/V = max_(v in G) deg v => 2 E V - V max_(v in G) deg v>= 2 E V - 2E => (2E-max_(v in G) deg v)/(V-1) >= (2E)/V => k'>k$
$therefore k' = (2E-deg x)/(V-1) = ((2E)/V - (deg x)/V)/(1-1/V) >= a(1/(1-1/V)-1/(2(V-1)))= (2V-1)/(2V-2) a>= a(V>=2)$
$k' = (2E-deg x)/(V-1) >= a => deg x <= 2E- a(V-1) = a V - a(V-1) = a$
$f(x) = f(x compose e) = f(x) compose' f(e) => f(x)^(-1) f(x) = f(x)^(-1) compose' f(x) compose' f(e) => f(e) = e' => e in ker G$
$f(x) compose' f(x^(-1)) = f(x compose x^(-1)) = f(e) = e' => f(x^(-1)) = f(x)^(-1)$
$f(x compose y^(-1)) = f(x) compose' f(y^(-1)) = f(x) compose' f(y)^(-1) = e' compose' e'^(-1) = e' => x compose y^(-1) in ker G$
$x compose' y^(-1) = f(p) compose' f(q)^(-1) = f(p) compose' f(q^(-1)) = f(p compose q^(-1))$
$y = f(x) = f(a^n) = f(a^(n-1) compose a) = f(a^(n-1)) compose' f(a) = ... = f(a)^n$
$a^(|n|) = e => f(a^(|n|)) = f(a)^(|n|) = f(e) = e' => |f(a)| lt.eq |a|$
$(a and b) or (a and b and c) or (b and c) = (a and b) or (b and c) = b and (a or c)$
$a' or b = 1 => a and (a' or b) = a and 1 => a and a' or a and b = a => 0 or a and b = a => a and b = a => a prec.eq b => a and b = a => a and b' = a and b and b' = a and (b and b') = a and 0 = 0 => a and b' = 0 => (a and b')' = 0' => a' or b'' = 1 => a' or b = 1$
$a prec.eq b <=> a and b = a <=> (a and b)' = a' <=> a' or b' = a' <=> b' prec.eq a'$
$0 plus.circle x = x plus.circle 0 = (x and 0') or (0 and x') = (x and 1) or 0 = x$
$x plus.circle x = (x and x') or (x and x') = x and x' = 0 = e$
$(or.big_(1 <= i <= n)a_i)' = and.big_(1 <= i <= n)a_i '$
$(or.big_(1 <= i <= n)a_i)' = and.big_(1 <= i <= n)a_i '$
$(or.big_(1 <= i <= k+1)a_i)' = (or.big_(1 <= i <= k)a_i or a_(k+1))' = (or.big_(1 <= i <= k)a_i)' and a_(k+1) ' = and.big_(1 <= i <= k)a_i ' and a_(k+1) ' = and.big_(1 <= i <= k+1)a_i '$
$(and.big_(1 <= i <= n)a_i)' = or.big_(1 <= i <= n)a_i '$
$(and.big_(1 <= i <= n)a_i)' = or.big_(1 <= i <= n)a_i '$
$(and.big_(1 <= i <= k+1)a_i)' = (and.big_(1 <= i <= k)a_i and a_(k+1))' = (and.big_(1 <= i <= k)a_i)' or a_(k+1) ' = or.big_(1 <= i <= k)a_i ' or a_(k+1) ' = or.big_(1 <= i <= k+1)a_i '$
$h(x and^1 y) = g(f(x and^1 y)) = g(f(x) and^2 f(y)) = g(f(x)) and^3 g(f(y)) = h(x) and^3 h(y)$
$h(x or^1 y) = g(f(x or^1 y)) = g(f(x) or^2 f(y)) = g(f(x)) or^3 g(f(y)) = h(x) or^3 h(y)$
$F(x, y, z) = cases(1 "if" overline(x y z) in {001, 010, 011, 101}, , 0 "othervise")$
$F=(not x and not y and z) or (not x and y and not z) or (not x and y and z) or (x and not y and z)$
$F=(not x and not y and z) or (not x and y and not z) or (not x and y and z) or (x and not y and z) = (not y and z) or (not x and y and not z) or (not x and y and z) = (not y and z) or (not x and y)$
$F = or.big_(v_i in V) and.big_(union.big{x_j} in v_i)((v_(i, j) and x_j) or (v_(i, j) ' and x_j '))$
$x and y = (x nand y)' = (x nand y) nand (x nand y)$
$x or y = (x' and y')' = ((x nand x) and (y nand y))' = ((x nand x) nand (y nand y) nand (x nand x) nand (y nand y))' = (x nand x) nand (y nand y) nand (x nand x) nand (y nand y) nand (x nand x) nand (y nand y) nand (x nand x) nand (y nand y) = (x nand x) nand (y nand y)$
$A <=> B => v(A) = v(B) => v'(A)' = v'(B)' => v(A^*) = v(B^*) => A^* <=> B^*$
$a^k=a^(p r+q)=(a^r)^p compose a^q = e compose a^q = a^q$
$(b^(-1)a b)^n=(b^(-1) a b b^(-1) a b)(b^(-1) a b)^(n-2)=(b^(-1) a (b b^(-1)) a b)(b^(-1) a b)^(n-2)=(b^(-1) a e a b)(b^(-1) a b)^(n-2)=(b^(-1) a^2 b)(b^(-1) a b)^(n-2)=...=b^(-1)a^n b$
$(b^(-1) a b)^n = e <=> b^(-1) a^n b = e <=> a^n b = b <=> a^n = b b^(-a) = e$
$(b a)^n = b (a b)^(n-1) a = b (a b)^(-1) a = b (b^(-1) a^(-1)) a = (b b^(-1)) (a^(-1) a) = e e = e$
$[p]_n times [m]_n = [p m]_n = [1- q n]_n= [1-0]_n = [1]_n =e$
$(a b) x = (a b) (b^(-1)a^(-1)) = a (b b^(-1))a^(-1) = a e a^(-1) = a a^(-1) = e$
$y (a b) = (a^(-1)b^(-1)) (a b) = a^(-1) (b^(-1) b) a = a^(-1) e a = a^(-1) a = e$
$G=ZZ_6, compose = plus.circle _6, H={0,3}, K={0,2,4}$
$a (x y) = (a x) y = (x a) y = x (a y) = x (y a) = (x y) a$
$x^(-1) a x x^(-1) = x^(-1) x a x^(-1) => x^(-1) a = a x^(-1)$
$m n = x^(-1) p x x^(-1) q x = x^(-1) p (x x^(-1)) q x = x^(-1) p q x = x^(-1) (p q) x$
$m (x^(-1) p^(-1) x) = x^(-1) p x (x^(-1) p^(-1) x) = x^(-1) p (x x^(-1)) p^(-1) x = x^(-1) (p p^(-1)) x = x^(-1) x = e$
$(x^(-1) a x)^2 = x^(-1) a x x^(-1) a x = x^(-1) a a x = x^(-1) a^2 x = x^(-1) e x = x^(-1) x = e$
$(g h)^(|g h||h|) = g^(|g h||h|) (h^(|h|))^(|g h|) = g^(|g h||h|) e^(|g h|) = g^(|g h||h|)$
$(g h)^(|g h||h|) = ((g h)^(|g h|))^(|h|) = e^(|h|) = e$
$forall g in G, h in H: g h g^(-1) in H => forall g in G, h in H: g h in H g => forall g in G: g H subset.eq H g$
$"(uint32_t)&(pcb[current].stackTop) - pcb[current].stackTop = (uint32_t)&(pcb[i].stackTop) - pcb[i].stackTop"$
$2times 8 upright(B) times 1001 = 16000 upright(B)$
$ sum_(1<=i<=m) log i = log product_(1<=i<=m) i = log m! = log(sqrt(2 pi m)(m/e)^m) ~ O(log m + m log(m/e)) ~ O(m log m) $
$ d_mt("原图+传送门")(s, t) = min(d_mt("原图")(s, t), d_mt("原图")(s, q_u) + q_w + d_mt("反图")(t, q_v)) $
$ t_min_{a_i} = d(s, a_1) + sum_(1<=i<=p-1)(d(a_i, a_i+1) + b(i)) + d(a_p, t) $
$ b(i) = max(100-((x_0 + sum_(1<=j<i) q_i)-y_i), 0) $
$ t_min = min_({a_i}in G) t_min_{a_i} &= min_({a_i}in G) (d(s, a_1) + sum_(1<=i<=p-1)(d(a_i, a_i+1) + b(i)) + d(a_p, t))\
&= min_({a_i}in G) (d(s, a_1) + sum_(1<=i<=p-1)(d(a_i, a_i+1) + max(100-((x_0 + sum_(1<=j<i) q_i)-y_i), 0)) + d(a_p, t)) $
