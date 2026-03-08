#import "lib.typ": *
#import "@preview/physica:0.9.7": *

#show: mine.with(
  title: "Condensed",
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

=

==

We begin by defining the displacement operator that generates the coherent state from the vacuum:
$
  D(hat(phi.alt)) equiv exp(sum_beta phi.alt_beta hat(a)_beta^dagger)
$

Our goal is to show that this state satisfies the eigenvalue equation $hat(a)_alpha ket(phi.alt) = phi.alt_alpha ket(phi.alt)$.

To proceed, we need a useful identity for commutators involving exponentials. When two operators $hat(A)$ and $hat(B)$ have a commutator $[hat(A), hat(B)] = c$ that is simply a c-number (a complex number rather than an operator), we can establish that:
$
  [hat(A), e^(hat(B))] = [hat(A), hat(B)] e^(hat(B))
$
This follows from expanding the exponential as $e^(hat(B)) = sum_(n=0)^infinity hat(B)^n \/ n!$ and using the property $[hat(A), hat(B)^n] = n[hat(A), hat(B)]hat(B)^(n-1)$, which holds when the commutator is a c-number.

Now we apply this identity to our specific case. Taking $hat(A) = hat(a)_alpha$ and $hat(B) = sum_beta phi.alt_beta hat(a)_beta^dagger$, we first compute their commutator:
$
  [hat(a)_alpha, sum_beta phi.alt_beta hat(a)_beta^dagger] = sum_beta phi.alt_beta [hat(a)_alpha, hat(a)_beta^dagger] = sum_beta phi.alt_beta delta_(alpha beta) = phi.alt_alpha
$

$
  braket(phi.alt, phi.alt') = braket(0, exp(sum_alpha phi.alt_alpha^* hat(a)_alpha), phi.alt') = exp(sum_alpha phi.alt_alpha^* phi.alt_alpha) braket(0, phi.alt) = exp(phi.alt^* dot phi.alt)
$

$
  hat(alpha)^dagger ket(phi.alt) &= hat(alpha)^dagger exp(sum_alpha phi.alt_alpha hat(a)_alpha^dagger) ket(0) = pdv(, phi.alt_alpha) exp(sum_alpha phi.alt_alpha hat(a)_alpha^dagger) ket(0) = pdv(, phi.alt_alpha) ket(phi.alt)
$

$
  [hat(a)_alpha^dagger, ketbra(phi.alt, phi.alt)] = (pdv(, phi.alt_alpha) - phi.alt_alpha^*) ketbra(phi.alt, phi.alt)
$

The standard Gaussian measure on the complex plane:

$
  d^2 phi.alt = d (Re phi.alt) (Im phi.alt) => integral e^(- abs(phi.alt)^2) d^2 phi.alt = pi
$

Sometimes, we prefer to use $d phi.alt d phi.alt^* = 2 i d^2 phi.alt$:

$
  d mu(phi.alt) = product_alpha (dd(phi.alt_alpha, phi.alt^*_alpha))/(2pi i) exp(- sum_alpha abs(phi.alt_alpha)^2)
$

$
  integral d mu (phi.alt) [a^dagger_alpha, ketbra(phi.alt, phi.alt)] = integral d mu (phi.alt) (pdv(, phi.alt_alpha) - phi.alt_alpha^*) ketbra(phi.alt, phi.alt)
$

Use integral by parts:

$
  pdv(, phi.alt_alpha) exp(- sum_(alpha) abs(phi.alt_alpha)^2) = - phi.alt^*_alpha exp(- sum_(alpha) abs(phi.alt_alpha)^2)
$

So everything cancelled. Since the measure commutes with every $a_alpha, a_alpha^dagger$. By full Fock space irreducibility, Schur's lemma tells us that the measure must be proportional to the identity $O = c bold(1)$.

$
  & hat(a)_alpha ket(phi.alt) = phi.alt_alpha ket(phi.alt) = pdv(, phi.alt^*) ket(phi.alt) \
  & bra(phi.alt) hat(a)_alpha^dagger = bra(phi.alt) phi.alt_alpha^*
$

$
  ket(psi) = integral d mu(phi.alt) psi(phi.alt^*) ket(phi.alt)
$

$
  hat(a)_alpha -> pdv(, phi.alt^*), quad hat(a)^dagger_alpha -> phi.alt^*_alpha
$

It's clear that the unitary transformation:

$
  braket(phi.alt', psi) = integral d mu(phi.alt) braket(phi.alt', phi.alt) braket(phi.alt, psi) = integral d mu(phi.alt) exp(phi.alt' dot phi.alt) psi(phi.alt)
$

$
  braket(phi.alt', hat(A)(hat(a)^dagger,hat(a)), phi.alt) = A(phi.alt^*,phi.alt) braket(phi.alt', phi.alt) = A(phi.alt^*,phi.alt) e^(phi.alt' dot phi.alt)
$

==

Let $xi,xi^*$ be independent Grassmann variables.
$
  [xi,xi^*]_+ = 0, quad xi^2 = 0, quad (xi^*)^2 = 0
$

$
  e^(xi) = sum_(i>=0) 1/i! xi^i = 1 + xi => f(xi) = f_0 + f_1 xi
$

Because the translation invariance, the total integral at boundary is zero:

$
   integral d xi f(xi + eta) & = integral d xi f(xi) \
  a I_1 + b I_xi + b eta I_1 & = a I_1 + b I_xi => I_1 = 0
$

$
  I_xi = B => "choose" B = 1
$

$
  pdv(, xi) (xi^* xi) = pdv(, xi) (-xi xi^*) = - xi^*
$

$
  integral d xi^* d xi e^(- xi^* xi) f^*(xi) g(xi^*) &= integral d xi^* d xi (1 - xi^* xi) (f^*_0 + f^*_1 xi) (g_0 + g_1 xi^*) \
  &= f_0^* g_0 + f_1^* g_1
$

It's worth noting:

$
  xi_alpha ket(0) = xi_alpha (1-xi_alpha) ket(0) = xi_alpha (1-xi_alpha hat(a)^dagger_alpha) ket(0)
$

$
  ket(xi) = exp(- sum_alpha xi_alpha hat(a)^dagger_alpha) ket(0) = product_alpha (1-xi_alpha hat(a)^dagger_alpha) ket(0)
$

$
  hat(a)_alpha ket(xi) ~ hat(a)_alpha - hat(a)_alpha xi_alpha hat(a)^dagger_alpha ket(0) = xi_alpha ket(0) = xi_alpha (1-xi_alpha hat(a)^dagger_alpha) ket(0) => hat(a)_alpha ket(xi) = xi_alpha ket(xi)
$


=

==

For general bracket:

$
  [hat(a)_alpha,hat(a)^dagger_beta]_minus.plus = delta_(alpha beta)
$

$
  hat(rho) = exp(-beta (hat(H) - mu hat(N))) \/ Z
$

$
  expval(hat(O)(t)) = Tr [hat(rho) thin hat(O)(t)] & = Tr [hat(rho) e^(-i hat(H) t) hat(O) e^(i hat(H) t)] \
                                                   & = Tr [e^(i hat(H) t) hat(rho) e^(-i hat(H) t) hat(O)] \
                                                   & = Tr [hat(rho) hat(O)] = expval(hat(O)(0))
$

For $hat(H)$ independent of time. The last step is due to $hat(rho)$ commutes with $e^(i hat(H) t)$.

$
  G^((n))(alpha_i t_i, alpha'_i t'_i) = (-i)^n expval(hat(T)[product^n_(i = 1) a^((H))_alpha_i (t_i) product^1_(i=n) a^(dagger (H))_alpha'_i (t'_i)])
$

- $a_alpha^((H))(t)$ is annihilation operator in Heisenberg picture.
- $expval(dots)$ is ensemble or ground state average.
- $hat(T)(dots)$ is time ordering operator: $hat(T) [product_i hat(O) (t_i)] = product_i hat(O) (t_(rho(i)))$ where $rho(i)$ is any possible time permutation that make it ascending or descending based on the context and goal.

$
  G(alpha t;alpha' t) = -i expval(hat(T)[hat(a)_alpha_1 (t) hat(a)^dagger_alpha'_1 (t')])
$

$
  hat(a)^((H))_alpha (t) = e^(i H t) hat(a)_alpha e^(-i H t)
$

$
  expval(hat(a)^((H))_alpha (t) hat(a)_alpha^(dagger (H)) (t')) &= sum_n rho_n braket(n, hat(a)_alpha^((H))(t) hat(a)_alpha^(dagger (H)) (t'), n) \
  &= sum_n rho_n braket(n, e^(i H t) hat(a)_alpha e^(-i H(t-t')) hat(a)^dagger_alpha e^(-i H t), n) \
$

Suppose: $ket(psi_n (t)) = e^(- i H t) ket(n)$:

$
  "LHS" = sum_n rho_n braket(psi_n (t), hat(a)_alpha e^(-i H(t-t')) hat(a)^dagger_alpha, psi_n (t'))
$

Assuming simple Hamiltonian: $hat(K)_0 = sum_alpha (epsilon_alpha - mu) hat(a)^dagger_alpha hat(a)_alpha$

$
  [hat(a)_alpha, hat(a)^dagger_beta hat(a)_beta] = delta_(alpha beta) hat(a)_beta => [hat(a)_alpha, hat(K)_0] = (epsilon_alpha - mu_0) hat(a)_alpha
$

For Heisenberg picture:

$
  i planck pdv(, t) hat(a)_alpha (t) = [hat(a)_alpha (t), hat(K)_0] = (epsilon_alpha - mu) hat(a)_alpha (t) => hat(a)_alpha (t) = e^(-i (epsilon_alpha - mu)(t-t_0) \/planck) hat(a)_alpha (t_0)
$

$
  i planck pdv(, t) G_0 (alpha t; alpha' t') = - i i planck pdv(, t) [theta(t-t') expval(hat(a)_alpha (t) hat(a)^dagger_alpha (t')) + eta theta(t'-t) expval(hat(a)^dagger_alpha (t) hat(a)_alpha (t))]
$

For $t = t'$: $pdv(, t) theta(t-t') = delta(t-t')$, for $t!=t'$, focus on operator $i planck pdv(, t) hat(a)_alpha (t) = (epsilon_alpha - mu) hat(a)_alpha (t)$:

$
  "LHS" &= - i delta(t-t') expval([hat(a)_alpha (t) hat(a)^dagger_alpha (t') ]) + (epsilon_alpha - mu) G_0 (alpha t;alpha' t') \
  &= planck delta_(alpha alpha') delta(t-t') + (epsilon_alpha - mu) G_0 (alpha t; alpha' t')
$

For fixed $alpha', t'$, we treat it as a first-order linear differential equation on $t$. If we fix the diagonal property in $alpha,alpha'$ due to $delta_(alpha,alpha')$:

$
  i planck pdv(, t) G_alpha (t,t') & = planck delta(t-t') + (epsilon_alpha - mu) G_alpha (t,t') \
                    G_alpha (t,t') & = C exp(- i (epsilon_alpha - mu) (t-t') \/ planck)
$

Where discontinuity condition:

$
  i planck (G_alpha (t-t' = 0^+) - G_alpha (t-t'=0^-)) = planck => G_alpha (0^+) - G_alpha (0^-) = - i
$

$
  G_alpha (tau = t - t') = A_(plus.minus) exp(- i (epsilon_alpha - mu) (t-t') \/ planck)
$

For $tau > 0$ or $tau < 0$.

$
  lim_(t -> t^+) G_0 (alpha t;alpha' t') = - i expval(hat(a)_alpha (t') hat(a)^dagger_alpha' (t'))
$

Due to $hat(K)_0 prop hat(a)^dagger_alpha hat(a)_alpha$ is diagonal, therefore each $alpha,alpha'$ belongs to different modes that:

$
  expval(hat(a)_alpha hat(a)^dagger_alpha') = expval(hat(a)_alpha) expval(hat(a)^dagger_alpha') = 0 quad alpha != alpha'
$

$
  "LHS" = - i expval(hat(a)_alpha (t') hat(a)^dagger_alpha (t')) = 1 + eta n_alpha, quad n_alpha = expval(hat(a)^dagger_alpha hat(a)_alpha)
$

Generally:

$
  lim_(t -> t^+) G_0(alpha t;alpha' t') = - i delta_(alpha alpha') (1 + eta n_alpha), quad lim_(t -> t^-) G_0(alpha t;alpha' t') = - i delta_(alpha alpha') eta n_alpha
$

$
  G_alpha (0^+) = A_+ = -i (1 + eta n_alpha), quad G_alpha (0^-) = A_- = -i eta n_alpha
$

$
  G_0 (alpha t; alpha' t') = - i delta_(alpha alpha') exp(-i (epsilon_alpha - mu) (t - t')) [theta(t - t') (1 + eta n_alpha) + theta(t' - t) eta n_alpha]
$

$
  tilde(G)_0 (alpha;alpha') (omega) &= integral_(-infinity)^infinity d t thin G_0 (alpha t;alpha' t') e^(-i omega (t-t')) \
$

Evaluate in separation:

$
  tilde(G)_0 (omega) = - i [(1+eta n_alpha) integral_0^infinity d tau e^(i omega tau) e^(-i (epsilon_alpha - mu) tau) + eta n_alpha integral^0_(-infinity) d tau e^(i omega tau) e^(-i (epsilon_alpha - mu) tau)]
$

Here we translate $d t -> d (t - t') = d tau$ where $t - t' > 0$ or $t - t' < 0$ for each part.

$
  tilde(G)_0 (omega) &= - i [(1+eta n_alpha) i/(omega - omega_alpha + i 0^+) + eta n_alpha (-i)/(omega - omega_alpha - i 0^+)] \
  &= (1 + eta n_alpha)/(omega - omega_alpha + i 0^+) - (eta n_alpha)/(omega - omega_alpha - i 0^-)
$

$
  tilde(G)_0 (alpha;alpha') (omega) = delta_(alpha alpha') e^(i omega 0^+) [(1 + eta n_alpha)/(omega - (epsilon_alpha - mu) + i 0^+) - (eta n_alpha)/(omega - (epsilon_alpha - mu) - i 0^-)]
$

We can define the dual of time and temperature: $t <-> - i tau$, $tau in [0,planck beta) = [0,planck \/ k T)$

$
  G^((n))(alpha_i tau_i, alpha'_i tau'_i) = - expval(hat(T)[product^n_(i = 1) hat(a)^((H))_alpha_i (tau_i) product^1_(i=n) hat(a)^(dagger (H))_alpha'_i (tau'_i)])
$

$
  hat(a)_alpha^((H))(tau) = e^(hat(H) tau) hat(a)_alpha e^(-hat(H) tau)
$

To elucidate the periodicity, we omit any unnecessary symbol:

$
  G(tau) = - expval(hat(T) [hat(a)(tau) hat(a)^dagger (0)])
$

$
  G(tau) = cases(- expval(hat(a)(tau) hat(a)^dagger (0)) quad tau > 0, - eta expval(hat(a)^dagger (0) hat(a)(tau)) quad tau < 0)
$

$
  G(beta^-) &= - expval(hat(a)(beta) hat(a)^dagger (0)) = - Tr[e^(-beta hat(H)) e^(beta H) hat(a) e^(- beta H) hat(a)^dagger] \
  &= - Tr[hat(a) e^(- beta hat(H)) hat(a)^dagger] = - Tr [e^(-beta hat(H)) hat(a)^dagger hat(a)] \
  &= eta thin G(0^-)
$

The $n$-point Green's functions is same as below to take $[product_i A_i]$ as $[A_j X]$ by cyclic property of trace.

Assume the system is time-translation invariant, so the Green's function depends only on the difference $tau - tau'$.

$
  G(tau) := G(alpha,alpha';tau) := G(alpha tau; alpha' 0)
$

Where $alpha,alpha'$ could be omitted in cases we don't pay attention.

$
  G(tau + planck beta) = eta thin G(tau)
$

Suggests the discrete Fourier transformation, or Fourier series.

$
  G(tau) = 1/(planck beta) sum_(-infinity)^infinity e^(- i omega_n tau) G(omega_n)
$
$
  e^(-i omega_n (tau + planck beta)) &equiv eta thin e^(-i omega_n tau) \
  e^(-i omega_n planck beta) &= eta 1 \
  omega_n &= cases((2n pi)/(planck beta) quad &eta = 1, ((2n+1)pi)/(planck beta) quad &eta = -1)
$

$
  integral_0^(planck beta) d tau thin e^(i (omega_n - omega_m) tau) := planck beta delta_(n m)
$

$
  G(omega_n) = integral_0^(planck beta) d tau thin e^(i omega_n tau) G(tau)
$

Restoring original notation:

$
  G(alpha tau; alpha' tau') = 1/(planck beta) sum_n e^(-i omega_n (tau - tau')) G(alpha;alpha') (omega_n)
$

$
  G(alpha;alpha') (omega_n) = integral_0^(planck beta) d tau thin e^(i omega_n (tau - tau')) G(alpha tau;alpha tau')
$

For non-interacting system, the answer is simple that change all $(t-t') <-> -i (tau - tau')$:

$
  G_0 (alpha tau, alpha' tau') = - delta_(alpha alpha') exp(-(epsilon_alpha - mu)(tau - tau') \/ planck) [theta(tau-tau')(1+ eta n_alpha) + eta theta(tau'-tau)n_alpha]
$

Suppose $tau - tau' <-> tau$:

$
                                       G_0 (0^-) & = G_0 (beta^-) \
                                     eta n_alpha & = eta e^(-beta(epsilon_alpha - mu)) (1 + eta n_alpha) \
  n_alpha (eta - e^(-beta (epsilon_alpha - mu))) & = eta e^(-beta(epsilon_alpha - mu)) \
                                         n_alpha & = 1/(e^(beta (epsilon_alpha - mu)) - eta)
$

$
  G_0 (alpha,alpha')(omega_n) = delta_(alpha alpha') e^(i omega 0^+) (1/(i omega_n - (epsilon_alpha - mu)\/planck))
$

==

Kinetic energy:

$
  hat(T) = integral dd(r, 3) thin hat(psi)^dagger (bold(r)) (- planck^2/(2m) nabla^2_(bold(r))) hat(psi) (bold(r)) \
$

Where $hat(psi)(bold(r))$ is the field operator satisfying the equal time relation:

$
  [hat(psi)(bold(r)),hat(psi)^dagger (bold(r)')]_(minus.plus) = delta(bold(r) - bold(r)')
$

The thermal expectation value is:

$
  expval(hat(T)) &= integral dd(r, 3) expval(hat(psi)^dagger (bold(r))(-planck^2/(2m)) nabla^2_(bold(r)) hat(psi)(bold(r))) \
  &= integral dd(r, 3) lr(expval(hat(psi)^dagger (bold(r'))(-planck^2/(2m)) nabla^2_(bold(r)) hat(psi)(bold(r)))bar)_(bold(r)' = bold(r)) \
  &= integral dd(r, 3) (-planck^2/(2m)) nabla^2_(bold(r)) lr(expval(hat(psi)^dagger (bold(r')) hat(psi)(bold(r)))bar)_(bold(r)' = bold(r))
$

Immediately, we inspect:#footnote[The $T$ is time operator now:]

$
  G(bold(r) t;bold(r') t') = - i expval(hat(T)[hat(psi)^((H))(bold(r),t) hat(psi)^(dagger (H)) (bold(r)', t')]) \
  i eta thin G(bold(r) t;bold(r') t^+) = expval(hat(psi)^((H))(bold(r),t) hat(psi)^(dagger (H)) (bold(r)', t^+))
$

So:

$
  expval(hat(T)) = integral dd(r, 3) (- planck^2/(2m)) nabla^2_(bold(r)) [i eta thin lr(G(bold(r)t;bold(r') t^+)] bar)_(bold(r') = bold(r))
$

Assume the system is translation invariant in space and time, so one can take: $bold(R) = bold(r) - bold(r')$, $tau = t - t'$

$
  G(bold(R),tau) := G(bold(r) t; bold(r') t')
$

$
  tilde(G)(bold(k),omega) = integral dd(R, 3) dd(tau) e^(- i bold(k) dot bold(R) + i omega tau) G(bold(R), tau)
$

$
  nabla^2_(bold(R)) G(0,0^-) &= integral (dd(k, 3) dd(omega))/((2pi)^4) (i bold(k))^2 e^(-i omega 0^-) lr(tilde(G)(bold(k),omega)bar)_(bold(R) = 0) = - integral (dd(k, 3) dd(omega))/((2pi)^4) k^2 e^(i omega 0^+) tilde(G)(bold(k),omega)
$

$
  expval(hat(T)) &= i eta cal(V) (- (planck^2)/(2m)) (-integral (dd(k, 3) dd(omega))/((2pi)^4) k^2 e^(i omega 0^+) tilde(G)(bold(k),omega)) \
  &= i eta cal(V) integral (dd(k, 3) dd(omega))/((2pi)^4) e^(i omega 0^+) (planck k)^2/(2 m) tilde(G)(bold(k),omega)
$

Interaction energy:

It's simpler to deduce from:

$
  hat(psi)^dagger (bold(r),t) i planck pdv(, t) hat(psi)(bold(r),t) = &hat(psi)^dagger (bold(r),t) [hat(psi)(bold(r),t),hat(T) + hat(V)] \
  hat(psi)^dagger (bold(r),t) i planck pdv(hat(psi)(bold(r),t), t) = &hat(psi)^dagger (bold(r),t) (-planck^2/(2m) nabla^2 - mu) hat(psi)(bold(r),t) \ &+ integral dd(r, 3) hat(psi)^dagger (bold(r),t) hat(psi)^dagger (bold(r'),t) v(bold(r) - bold(r)') hat(psi) (bold(r'),t) hat(psi) (bold(r),t)
$

$
  expval(hat(V)) &= (i eta)/2 integral dd(r, 3) lr([(i planck pdv(, t) + planck^2/(2m) nabla^2_(bold(r)) + mu) G(bold(r) t;bold(r)' t')]bar)_(bold(r) = bold(r'), t' = t^+) \
  &= (i eta)/2 cal(V) integral (dd(k, 3) dd(omega))/((2pi)^4) e^(i omega 0^+) (planck omega - (planck k)^2/(2 m) + mu) tilde(G)(bold(k),omega)
$

==

Linear Responses:

$
  delta hat(H) = - e integral dd(bold(r)) hat(rho) (bold(r)) phi.alt(bold(r))
$

Where $phi.alt(bold(r))$ is external electric potential and $hat(rho) (bold(r)) = hat(psi)^dagger (bold(r)) hat(psi) (bold(r))$ is the density operator.

$
  hat(j) (bold(r)) = (i e planck)/(2 m) [hat(psi)^dagger (bold(r)) (nabla hat(psi)(bold(r))) - (nabla hat(psi)^dagger (bold(r))) hat(psi) (bold(r))]
$

We only approximate in linear order, a merit is the total response is the summation of all field responses.

Consider a time-dependent infinitesimally small external field:

$
  hat(H)_phi.alt (t) = hat(H) + hat(O) phi.alt (t)
$

Where $phi.alt$ is the external field and $hat(O)$ is the observable.

$
  i planck pdv(, t) hat(U) (t,t_i) & = hat(H)_phi.alt (t) hat(U)(t,t_i) \
                    hat(U) (t,t_i) & = hat(T) [exp(-i/planck integral_(t_i)^t hat(H)_phi.alt (t) dd(t))]
$

$
  i planck pdv(, t) hat(U) (t,t_i) &= (hat(H) + hat(O) phi.alt(t)) hat(U)(t,t_i), quad hat(U)(t_i,t_i) = bold(1) \
  i planck pdv(, t) delta hat(U) (t,t_i) &= hat(H) delta hat(U)(t,t_i) + hat(O) phi.alt(t) U_0 (t,t_i) + O(delta^2 U) \
  hat(U)_0 (t_i, t) i planck pdv(, t) delta hat(U) (t,t_i) + i planck pdv(, t) (U_0 (t_i,t)) delta hat(U) (t,t_i) &= U_0 (t_i,t) hat(O) phi.alt(t) U_0 (t,t_i) + O(delta^2 U) \
  i planck pdv(, t) (U_0 (t_i,t) delta hat(U)(t,t_i)) &= U_0 (t_i,t) hat(O) phi.alt(t) U_0 (t,t_i) + O(delta^2 U) \
  delta hat(U) (t,t_i) &= - i/planck hat(U)_0 (t,t_i) integral_(t_i)^t dd(t_1) hat(U)_0 (t_i,t_1) hat(O) phi.alt(t_1) hat(U)_0 (t_1,t_i) \
  delta hat(U) (t,t_i) &= - i/planck integral_(t_i)^t dd(t_1) hat(U)_0 (t,t_1) hat(O) phi.alt(t_1) hat(U)_0 (t_1,t_i) \
$

Suppose $hat(U) approx hat(U)_0 + delta hat(U)$
where $hat(U)_0$ is unperturbed evolution operator without $hat(O) phi.alt(t)$, and *ignores* the second order.

$
  delta ket(psi(t)) &= delta hat(U)(t,t_i) ket(psi(t_i)) = integral_(t_i)^t dd(t_1) dv(hat(U)(t,t_i), phi.alt(t_1), d: delta) phi.alt(t_1) ket(psi(t_i)) \
$

$
  lr(dv(hat(U)(t,t_i), phi.alt(t_1), d: delta)bar)_(phi.alt -> 0) &= - i/planck hat(U)_0 (t,t_1) hat(O) hat(U)_0 (t_1,t_i), quad t_i < t_1 < t \
  &= -i/planck e^(-i hat(H) (t-t_i) \/ planck) (e^(i hat(H) (t_1 - t_i) \/ planck) hat(O) e^(-i hat(H) (t_1 - t_i) \/ planck)) \
  &= -i/planck e^(-i hat(H) (t - t_i)) hat(O)^((H)) (t_1) \
  &= -i/planck U_0 (t,t_i) hat(O)^((H)) (t_1)
$

$
  "LHS" = - i/planck integral_(t_i)^t dd(t_1)U_0 (t,t_i) hat(O)^((H)) (t_1) phi.alt(t_1) ket(psi(t_i))
$

The expectation value of an observable $hat(R)$ other than $hat(O)$:

$
  delta hat(R)(t) &= delta sum_n rho_n braket(psi_n (t), hat(R), psi_(n) (t)) \
  &= sum_n rho_n (braket(delta psi_n (t), hat(R), psi_(n) (t)) + braket(psi_n (t), hat(R), delta psi_(n) (t))) \
$

Evaluate the first term:

$
  braket(delta psi_n (t), hat(R), psi_(n) (t)) &= i/planck integral_(t_i)^t dd(t_1) phi.alt(t_1) braket(psi_n (t_i), hat(O)^((H)) (t_1)U_0 (t_i,t) hat(R), psi_n (t)) \
  &= i/planck integral_(t_i)^t dd(t_1) phi.alt(t_1) braket(psi_n (t_i), hat(O)^((H))(t_1) U_0 (t_i,t) hat(R) U_0(t,t_i), psi_n (t_i)) \
  &= i/planck integral_(t_i)^t dd(t_1) phi.alt(t_1) braket(psi_n (t_i), hat(O)^((H))(t_1) hat(R)^((H)) (t), psi_n (t_i))
$

Therefore, suppose $t_i -> -infinity$ where we can compute the evolution by initial distribution:

$
  "LHS" = -i/planck integral_(-infinity)^(infinity) dd(t_1) theta(t-t_1) expval([hat(R)^((H))(t),hat(O)^((H))(t_1)]) phi.alt(t_1)
$

$
  D^r (hat(R);hat(O))(t;t') = dv(hat(R)(t), phi.alt(t')) = - i/planck theta(t-t') expval([hat(R)^((H))(t),hat(O)^((H))(t')])
$

Scattering experiments:

$
  i planck pdv(, t) ket(psi(t)) = (hat(H)_0 + hat(V)) ket(psi(t)) \
$

We define interaction picture state as:

$
  ket(psi_I (t)) := e^(i hat(H)_0 t \/ planck) ket(psi (t)) \
$

$
  i planck pdv(, t) ket(psi_I (t)) &= (-hat(H)_0 e^(i hat(H)_0 t \/ planck) + e^(i hat(H)_0 t \/ planck) (hat(H)_0 + hat(V))) ket(psi(t)) \
  i planck pdv(, t) ket(psi_I (t)) &= e^(i hat(H)_0 t \/ planck) hat(V) e^(- i hat(H)_0 t \/ planck) ket(psi_I (t)) \
  i planck pdv(, t) ket(psi_I (t)) &= hat(V)_I (t) ket(psi_I (t))
$

Start at $t = 0$ with $ket(psi(0)) = ket(psi_i)$. For a weak perturbation, we iterate to first order (Born approximation):

$
  ket(psi_I (t)) approx ket(psi_i) - i/planck integral_0^t dd(t') hat(V)_I (t') ket(psi_i)
$

The amplitude of finding the system in a different state $psi_f$ at time $t$ is:

$
  c^((1))_(f i) (t) &= braket(psi_f, psi_i (t)) = - i/planck integral_0^t dd(t') braket(psi_f, hat(V)_I (t'), psi_i) \
  &= - i/planck integral_0^t dd(t') braket(psi_f, e^(i hat(H)_0 t \/ planck) hat(V) e^(- i hat(H)_0 t \/ planck), psi_i) \
  &= - i/planck integral_0^t dd(t') e^(i (E_f - E_i) \/ planck) braket(psi_f, hat(V), psi_i)
$

We determine the transition matrix from probed system $ket(alpha)$ to $ket(beta)$ and wave vector from $bold(k)$ to $bold(k)+bold(q)$. Consider an external particle apply such effect on a many body system by scattering.

We prepare the initial state where:

- The many body system with eigenstate $ket(alpha)$ of $hat(H)_("sys")$.
- The external particle is in a plane wave state $ket(bold(k))$ with wave vector $bold(k)$.

The initial state is:

$
  ket(psi_i) = ket(bold(k)) times.o ket(alpha) equiv ket(bold(k) \, alpha)
$

The final state is:

$
  ket(psi_f) = ket(bold(k) + bold(q)) times.o ket(beta) equiv ket(bold(k) + bold(q) \, beta)
$

$
  hat(V) &= integral dd(r, 3) thin hat(psi)^dagger (bold(r))_("ext") hat(V)_("ext") hat(psi)_"ext" (bold(r)) = integral dd(r, 3) thin hat(psi)^dagger (bold(r))_("ext") v(r-r_i) hat(psi)_"ext" (bold(r)) \
$

$
  braket(psi_f, hat(V), psi_i) = bra(bold(k) + bold(q) \, beta) integral dd(r, 3) thin hat(psi)^dagger (bold(r))_("ext") v(r-r_i) hat(psi)_"ext" (bold(r)) ket(bold(k) \, alpha) \
$

Because:

$
  hat(psi)_"ext" (bold(r)) ket(bold(k)) = hat(psi)_"ext" (bold(r)) ket(bold(r)) braket(bold(r), bold(k)) 1/(V^(1/2)) e^(i bold(k) dot bold(r)) ket(0)_("ext")
$

$
  braket(psi_f, hat(V), psi_i) = T_(alpha beta) (bold(q)) = integral dd(r, 3) bra(beta) (e^(-i (bold(k) + bold(q)) dot bold(r)) sum_i v(bold(r) - bold(r)_i) e^(i bold(k) dot bold(r))) ket(alpha)
$

$
  integral dd(r, 3) e^(-i bold(q) dot bold(r)) v(bold(r) - bold(r)_i) = e^(-i bold(q) dot bold(r)_i) integral dd(R, 3) thin v(bold(R)) = e^(-i bold(q) dot bold(r)_i) tilde(v)(bold(q))
$

$
  T_(alpha beta) (bold(q)) = tilde(v)(bold(q)) braket(beta, sum_i e^(-i bold(q) dot bold(r)_i), alpha) = tilde(v)(bold(q)) braket(beta, hat(rho)(bold(q)), alpha)
$

Where density matrix is $hat(rho)(bold(q)) = sum_i e^(-i bold(q) dot hat(bold(r))_i)$.

$
  c^((1))_(alpha beta) (t) &= - i/planck T_(alpha beta) (bold(q)) integral_0^t dd(t') e^(i omega_(alpha beta)), quad omega_(alpha beta) = -(E_alpha - E_beta)/planck \
  &= - 1/planck T_(alpha beta) (bold(q)) (e^(i omega_(alpha beta) t) - 1)/(omega_(alpha beta))
$

$
  P_(alpha beta) (bold(q), t) = abs(c^((1))_(alpha beta) (t))^2 = abs(T_(alpha beta) (bold(q)))^2/(planck^2) (4 sin^2 (omega_(alpha beta) t \/ 2))/(omega_(alpha beta)^2)
$

We are interested in transitions to any final state $beta$ of the many-body system, with the external particle's momentum transfer fixed to $bold(q)$. The total probability for scattering with momentum transfer $q$ and energy transfer $planck omega = E_beta - E_alpha$ is obtained by summing over all $beta$. In a macroscopic system, the final states form a continuum; we introduce the density of states $rho(E_beta)$ at energy $E_beta$. Then the total probability (for a given initial state $ket(alpha)$) is:

$
  P_alpha (bold(q),t) = integral dd(E_beta) rho(E_beta) P_(alpha beta) (bold(q),t)
$

For large $t$, the function becomes sharply peaked around $E_alpha = E_beta$:

$
  (4 sin^2 (omega_(alpha beta) t \/ 2))/(omega_(alpha beta)^2) approx 2pi planck t delta (E_beta - E_alpha)
$

$
  P_alpha (bold(q),t) approx sum_beta (2pi t)/(planck) lr(rho(E_alpha) abs(T_(alpha beta)(bold(q)))^2 bar)_(E_beta -> E_alpha)
$

$
  Gamma_alpha (bold(q)) = dv(P_alpha (bold(q),t), t) = sum_beta (2pi)/(planck) lr(rho(E_alpha) abs(T_(alpha beta)(bold(q)))^2 bar)_(E_beta -> E_alpha)
$

In practise, the $E_beta$ may differ $E_alpha$ by a energy transfer $planck omega$ we are interested in.

$
              f (E_beta - E_alpha) & = planck integral d omega f(planck omega) delta (E_beta - E_alpha - planck omega) \
  dv(, omega) f (E_beta - E_alpha) & = planck f(planck omega) delta (E_beta - E_alpha - planck omega)
$

$
  sigma_alpha(bold(q), omega) = dv(, omega) Gamma_alpha (bold(q)) (omega) = 2pi sum_beta rho(E_alpha) delta(E_beta - E_alpha - planck omega) abs(T_(alpha beta) (bold(q)))^2
$

$
  delta(E_beta - E_alpha - planck omega) = 1/(2pi planck) integral_(-infinity)^infinity dd(t) e^(i (E_beta - E_alpha - planck omega) t \/ planck)
$

$
  sum_beta e^(i (E_beta - E_alpha) t \/ planck) braket(alpha, hat(rho)^dagger (bold(q)), beta) braket(beta, hat(rho) (bold(q)), alpha) &= braket(alpha, e^(i hat(H) t \/ planck) hat(rho)^dagger (bold(q)) e^(- i hat(H) t \/ planck) hat(rho) (bold(q)), alpha) \
  &= braket(alpha, hat(rho)^dagger (bold(q)) (t) hat(rho), alpha)
$

$
  sigma_alpha (bold(q), omega) prop abs(tilde(v)(bold(q)))^2 rho(E_alpha) integral dd(t) braket(alpha, hat(rho)^dagger (bold(q)) (t) hat(rho), alpha)
$

==

$
  G(r t;r' t') = - i expval(hat(T)[hat(psi)(r,t) hat(psi)^dagger (r',t')])
$

We omit irrelevant indices, coordinates and focus on Green's function:

$
  G &= - i expval(hat(T) [psi psi^dagger]) = - i [theta(t-t') expval(psi psi^dagger) + eta theta(t'-t) expval(psi^dagger psi)] \
  &= theta(t-t') (-i expval(psi psi^dagger)) + theta(t'-t) (-i eta expval(psi^dagger psi)) \
  &= theta(t-t') G^> + theta(t'-t) G^<
$

Another way to decompose is by identity:

$
  theta(t-t') + theta(t'-t) = bold(1)
$

$
  G & = - i [theta(t-t') expval(psi psi^dagger) + eta theta(t'-t) expval(psi^dagger psi)] \
    & = -i [theta(t-t') expval(psi psi^dagger) + eta (1-theta(t-t')) expval(psi^dagger psi)] \
    & = -i [theta(t-t') expval([psi, psi^dagger]) + eta expval(psi^dagger psi)] \
    & = G^r + G^<
$

$
  G & = - i [theta(t-t') expval(psi psi^dagger) + eta theta(t'-t) expval(psi^dagger psi)] \
    & = - i [(1- theta(t'-t))expval(psi psi^dagger) + eta theta(t'-t) expval(psi^dagger psi)] \
    & = -i [expval(psi psi^dagger) - theta(t'-t) expval([psi,psi^dagger])] \
    & = G^> + G^a
$

$
  G^r + G^< = G^> + G^a => G^r - G^a = G^> - G^<
$

We assume $expval(O)^* = expval(O^dagger)$, which is true for thermal state or ground states with Hermitian Hamiltonian.

$
  [A,B]^dagger = [B^dagger,A^dagger] => [psi(bold(r), t),psi^dagger (bold(r'),t')]^dagger = [psi (bold(r'),t'),psi^dagger (bold(r),t)]
$

$
  (G^r)^* (r t;r' t') & = (-i theta(t-t') expval([psi, psi^dagger]))^* = i theta(t-t') expval([psi,psi^dagger]^dagger) \
                      & = i theta(t-t') expval([psi (bold(r'),t'),psi^dagger (bold(r),t)]) \
                      & =^(t <-> t') G^a (r' t';r t)
$

Reversely:

$
  (G^a)^* (r t;r' t') = G^r (r' t'; r t)
$

Assume translation invariance in space and time that $t -> t - t'$, $r -> r - r'$:

$
  G^r (bold(k),omega) = - i integral_(-infinity)^infinity dd(r, 3) integral_(-infinity)^infinity dd(t) e^(-i bold(k) dot bold(r) + i omega t) thin G^r (bold(r) t;bold(r)' t') \
$

Then, indeed:

$
  A(bold(k),omega) &= i (G^(r) (bold(k),omega) - G^a (bold(k),omega)) = i (G^(r) (bold(k),omega) - (G^r)^*(bold(k),omega)) \
  &= i dot 2 i Im G^(r) (bold(k),omega) = - 2 Im G^r (bold(k), omega) \
$

It's same that: $A(bold(k), omega) = i (G^> - G^<)$ too.

$
  integral_(-infinity)^infinity dd(omega)/(2pi) A(bold(k),omega) &= integral_(-infinity)^infinity dd(omega)/(2pi) integral^infinity_(-infinity) dd(t) thin e^(i omega t) (dots) \
  &= integral_(-infinity)^infinity delta(t) thin G(t,bold(k)) = G(0,bold(k)) \
$

Notice that when $t <-> t - t' = 0$, where the system at initial state has the canonical commutation relation, therefore:

$
  expval([psi,psi^dagger]) = 1 => G(0,bold(k)) = 1
$

Then the spectrum identity is obvious:

$
  integral_(-infinity)^infinity dd(omega)/(2pi) A(bold(k),omega) = 1
$

The spectrum in momentum space is more clear:

$
  A(bold(k),omega) = integral_(-infinity)^infinity dd(t) e^(i omega t) expval([hat(a)_k (t), hat(a)^dagger_k])
$

We can check by non-interacting system:

$
  hat(a)_k (t) = e^(-i (epsilon - mu) t) hat(a)_k => [hat(a)_k (t), hat(a)_k^dagger] = e^(-i (epsilon_k - mu) t) \
$

$
  A(bold(k),omega) = integral_(-infinity)^infinity dd(t) e^(i omega t) e^(i (epsilon-mu) t) = 2pi delta(omega - (epsilon_k - mu))
$

==

$
  G^< (bold(k),t) = - i eta sum_(m,n) e^(-beta K_n) abs(braket(m, hat(a)_k, n))^2 e^(i (K_m - K_n) t \/ planck) \
$

$
  G^< (bold(k), omega) = integral dd(t) e^(i omega t) G^< (bold(k), t) = - i eta sum_(n,m) e^(-beta K_n) 2pi delta(omega - (K_n - K_m) \/ planck) abs(braket(m, hat(a)_k, n))^2
$

Similarly:

$
  G^> (bold(k),t) = -i sum_(n,m) e^(-beta K_n) abs(braket(m, hat(a)_k, n))^2 e^(i (K_n - K_m) t \/ planck) \
$

To build the connection between $G^>$ and $G^<$, we relabel $n <-> m$ for consistency:

$
  G^> (bold(k),omega) = -i sum_(n,m) e^(- beta K_m) 2pi delta(omega - (K_n - K_m)\/planck) abs(braket(m, hat(a)_k, n))^2
$

$
  G^< (bold(k),omega) = eta e^(-beta (K_n - K_m)) G^> (bold(k),omega) = eta e^(- beta planck omega) G^> (bold(k),omega)
$

$
  G^> (bold(k),omega) = eta e^(beta planck omega) G^< (bold(k),omega)
$

$
  A(bold(k),omega) = i [G^> (bold(k),omega) - G^< (bold(k),omega)] = i (G^> (bold(k),omega) ( eta e^(beta planck omega) - 1) \
$

$
  G^< (bold(k),omega) = - i eta A/(e^(beta planck omega) - eta) => G^< = -i eta n_eta (omega) A (bold(k), omega)
$

$
  G^> (bold(k), omega) = -i eta e^(beta planck omega) dot n_eta (omega) A(bold(k), omega) = - i (1 + eta n_eta) A(bold(k), omega)
$

$
  & G^> (bold(k),t) = -i integral dd(omega_1) e^(-i omega_1 t) [1 + eta n_eta (omega_1)] A(bold(k),omega) \
  & G^< (bold(k),t) = -i eta integral dd(omega_1) e^(-i omega_1 t) n_eta (omega_1) A(bold(k),omega)
$

The expression by $A(bold(k),omega)$ can also be applied to $G^r$ and $G^a$:

$
  & G^r (bold(k),t) = theta (t) (G^> (bold(k),t) - G^< (bold(k),t)) \
  & G^a (bold(k), t) = - theta(-t) (G^> (bold(k),t) - G^< (bold(k),t))
$

Because:

$
  A(bold(k),omega) = i [G^> (bold(k),omega) - G^< (bold(k),omega)]
$

$
  G^r (bold(k),omega) &= integral dd(t) e^(i omega t) theta(t) (-i) integral dd(omega_1)/(2pi) e^(-i omega_1 t) A = -i integral dd(omega_1)/(2pi) A(bold(k),omega_1) integral_0^infinity e^(i (omega-omega_1) t) \
  &= -i dot i integral dd(omega_1)/(2pi) A(bold(k), omega_1)/(omega - omega_1 + i 0^+) = integral dd(omega_1)/(2pi) A(bold(k), omega_1)/(omega - omega_1 + i 0^+)
$

$
  G^a (bold(k),omega) = -(-i) integral dd(omega_1)/(2pi) A(bold(k), omega_1) integral^0_(-infinity) dd(t) e^(i (omega - omega_1) t) = integral dd(omega_1)/(2pi) (A(bold(k),omega_1))/(omega - omega_1 - i 0^+)
$

$
  G (bold(k),t) &= theta(t) G^> (bold(k),t) + theta(-t) G^< (bold(k),t) = integral dd(t) e^(i omega t) [theta(t) G^> (bold(k),omega) + theta(-t) G^< (bold(k),omega)] \
  &= integral dd(omega_1)/(2pi) A [(1+eta n_eta (omega))/(omega-omega_1 + i 0^+) - (eta n_eta (omega))/(omega - omega_1 - i 0^+)]
$

A useful identity can be applied to separate real and imaginary part:

$
  1/(x plus.minus i 0^+) = cal(P)(1/x) minus.plus i pi delta(x)
$

$
  G^r (bold(k),omega) = integral dd(omega_1)/(2pi) A[cal(P)(1/(omega-omega_1) - i pi delta(omega-omega_1))] = cal(P)(integral dd(omega_1)/(2pi) (A (bold(k),omega))/(omega-omega_1)) - i/2 A(bold(k),omega)  \
$

$
  Re G^r = cal(P)(integral dd(omega_1)/(2pi) (A (bold(k),omega))/(omega-omega_1)), quad Im G^r = -1/2 A
$

$
  Re G^a = Re G^r = cal(P)(integral dd(omega_1)/(2pi) (A (bold(k),omega))/(omega-omega_1)), quad Im G^a = 1/2 A
$

$
  G &= integral dd(omega_1)/(2pi) A{1+eta n_eta [cal(P)(1/(omega - omega_1)) - i pi delta(omega-omega_1)] + ...} \
  &= cal(P)(integral dd(omega_1)/(2pi) (A (bold(k),omega))/(omega-omega_1)) - i pi integral dd(omega_1)/(2pi) A thin delta(omega-omega_1) (1 + eta n_eta + eta n_eta) \
$

$
  Im G = -1/2 (1+2 eta n_eta (omega)) A(bold(k),omega)
$

Interestingly, the particle density distribution can be further reduced: 

$
  1 + 2 eta n_eta (omega) = 1 + (2 eta)/(e^(beta planck omega) - eta) = (e^(beta planck omega) + eta)/(e^(beta planck omega) - eta) = (e^(beta planck omega \/2) + eta e^(-beta planck omega \/ 2))/(e^(beta planck omega \/2) - eta e^(-beta planck omega \/ 2)) = (tanh ((beta planck omega)/2))^(-eta)
$

$
  Im G = -1/2 tanh^(-eta) ((beta planck omega)/2) A(bold(k),omega)
$
