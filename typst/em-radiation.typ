#import "lib.typ": *


#show: mine.with(
  title: "em-radiation",
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

#let up(x) = { $upright(#x)$ }
#let hup(x) = { $hat(upright(#x))$ }
#let four_p = $A^mu (t, #up("x"))$

= Radiation

$
  A^mu (t,upright(x)) = mu_0 / (4pi)integral d^3 x' (j^mu (t-(|upright(x)-upright(x')|) / c,upright(x'))) / (|upright(x)-upright(x')|)
$

$upright(x) = r hup(n)$ and $|x'| < d$

For $r -> infinity$, then $|x-x'| -> |x| = r >> |x'| < d$.

$
  #four_p = mu_0 / (4 pi) 1 / r integral d^3 x' j^mu (t-r / c+ (hat(up(n)) dot up(x)') / c) , up(x')) + O(1 / r^2)
$

We are only interested in part of $O(1 / r)$ for radiation.

#let iomegac = $i omega / c$
#let nxs = $hup(n) dot up(x')$
#let e_p = $e^(-i omega dot hup(n) dot up(x)'\/c)$
#let partialt = $(partial) / (partial t)$
$
  partial_i #e_p = - i omega / c (partial_i n_j) x'_j #e_p
$
$
  partial_i n_j &= partial_i (x_j / r) = delta_(i j) / r - x_j / r^2 partial_i r \
  &= 1 / r (delta_(i j) - (x_i x_j) / r^2) = 1 / r (delta_(i j) - n_i n_j)
$
We found that the plus $1 / r$ contribution could be neglected.

We only need:
$
  partial_i e^(iomegac r) = iomegac partial_i (r) e^(iomegac r) = iomegac n_i e^(iomegac r)
$

Thus:
$
  up(E) &= - 1 / c (nabla phi.alt + partialt up(A))\
  &= 1 / (4pi epsilon_0)1 / r integral d^3 x' integral (d omega) / (2 pi) i omega / c^2e^(-i omega [t -(r / c) + (hup(n) dot up(x)') / c])(up(j)(omega,up(x')) - c hup(n) rho(omega, up(x')))\
$

Notice that we can do fourier transform on $e^(- i omega nxs / c)$
$
  up(E)(t,up(x)) = 1 / (4 pi epsilon_0 c^2) 1 / r integral (d omega) / (2pi) e^(-i omega (t-r / c)) i omega [up(j)(omega, omega hup(n) / c) - c hup(n) rho(omega, omega hup(n) / c)]
$

We know in continuity that:
$
  omega rho(omega, up(k)) - up(k) dot up(j)(omega,up(k)) = 0 \
  k = omega hup(n) / c \
  c rho(omega, omega hup(n) / c) = up(n) dot up(j)(omega,omega hup(n) / c)
$
$
  up(E)(t,up(x)) = (...)integral (d omega) / (2pi) (...) i omega [up(j)(omega, omega hup(n) / c) - hup(n) (hup(n) dot up(j)(omega, omega hup(n) / c))]
$
We write last term as: $up(j)_(perp)(...) = - hup(n) times (hup(n) times up(j)(...))$.

Notice that $i omega e^(- i omega t) = - partial_t e^(-i omega t)$
$
  up(E)(t,up(x)) &= -(...)1 / r partial_t integral (d omega) / (2pi) e^(-i omega (t - r / c)) integral d^3 x' d t' e^(i omega t' - i omega nxs / c) up(j)_perp (t',up(x')) \
  &= - (...)1 / r partial_t integral d^3 x' d t up(j)_perp(t', up(x')) delta(t' - (t- r / c + nxs / c)) \
  &= - (...)1 / r partial_t integral d^3 x' up(j)_perp (t- r / c + nxs / c , up(x'))
$

We know $up(B)(t,up(x)) = nabla times up(A)$, So it just as:
$
	c up(B)/mu_0 =  epsilon_0 c^2 hup(n) times up(E) \
	c up(B) = hup(n) times up(E)
$

$
	up(S) &= 1/(mu_0 c) E^2 hup(n) \
	&= epsilon_0 c E^2 hup(n) \
	&= epsilon_0 c 1/(4pi epsilon_0 c^2 r)^2(...)
$
$
	(d cal(E))/(d t d Omega) &= epsilon_0 c (1/(4pi epsilon_0 c^2))|partial_t integral d^3 x' up(j)_perp (t- r / c + nxs / c, up(x'))|^2 \
$

We can also transform to frequency domain, based on previous electric field in frequency domain:
$
	(d cal(E))/(d t d Omega) &= (...) omega^2|up(j)_perp (omega, omega hup(n) / c)|^2 \
$
And we can transform back to explicit source term:
$
	|hup(n) times (hup(n) times up(v))| = |hup(n) times up(v)|
$

By continuity equation that $c rho ~ hup(n) dot up(j)$
$
	|up(j)_perp (...)|^2 &= |hup(n) times up(j)(...)|^2 =|up(j) - hup(n) c rho(...)|^2 \
	&= |up(j)|^2 - 2 c rho(...) (hup(n) dot up(j)) + c^2 rho^2(...) \
	&= |up(j)|^2 - c^2|rho(...)|^2 \
$

= Low-Frequency Limit

In $#e_p$, we see that $|x'| < d$, if we want to expand this term, we should restrict that $(omega' d)/c << 1$. Which go quickly to zero for large $omega'$. 

Thus for a source with typical frequency: $omega_s ~ v/d$, we know that $v << c$. or $lambda_s = c/omega_s >> d$.

$
  up(E)(t,up(x)) &= -(...)1 / r partial_t integral (d omega) / (2pi) e^(-i omega (t - r / c)) integral d^3 x' d t' e^(i omega t' - i omega nxs / c) up(j)_perp (t',up(x')) \
$

Suppose we only localize the source with $delta(t' - (t - r/c))$, turn $-i omega ~ partial_t $. Expand the term $#e_p$:
$
	sum_k integral d^3 x' (partial_t hup(n) dot up(x') /c)^k  up(j)_perp (t-r/c, up(x')) \
	sum_k (hup(n) dot )^k (partial_t)^k integral d^3 x' up((x'/c))^k up(j)_perp (t-r/c, up(x')) \
$
Thus we expand those terms like $n_i + x_i$, $n_i n_j + x_i x_j$, $n_i n_j n_k + x_i x_j x_k$ and so on...

$
	up(j)_perp (t-r/c, up(x')) &= up(j)(t - r/c, up(x')) - hup(n) (hup(n) dot up(j)(t - r/c, up(x'))) \
	&= up(j)(t - r/c, up(x')) - hup(n) c rho(t-r/c,up(x')) \
$

Notice a addtional $partial_t$ in front of resulting $partial_t^(k+1)$

A useful check is that $up(j) ~ v q; 1/c^2 partial_t up(j) ~ (omega_s q v) / c^2 ~ q/d (v/c)^2 $ is already second order, and $c partial_t rho$ is zero due to whole integral. Thus start from $1/c^3 c partial_t^2 rho n_i ~ 1/c^2 dot.double(d) ~ (omega_s^2 q d)/c^2 ~ q/d v^2/c^2$ again second order.

That's means all radiation terms start from $(v/c)^2$ order and disappers in $v -> 0$.

We check the second order which is first term:

$
	integral d^3 x' up(j)(t,up(x')) &= integral d^3 x' j_k (t,up(x')) partial_k x^i 
	&= - integral d^3 x' x_i partial_k j_k (t,up(x')) \
	&= partial_t integral d^3 x' rho(t,up(x')) x_i \
	&= dot(d)_i (t)
$

Thus:
$
	up(E)(t,up(x)) = - (1)/(4 pi epsilon_0 c^2) 1/r (dot.double(up(d))(t - r/c) - hup(n) (hup(n) dot dot.double(up(d))(t - r/c))) \
$

