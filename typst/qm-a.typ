#import "lib.typ": *
#import "@preview/physica:0.9.7": *

#show: mine.with(
  title: "Rep of Poincare",
)

#let lie(body) = $frak(body)$
#let vf(body) = $bold(upright(body))$
#let tb(body) = $tilde(bold(body))$

=

$
  x'^(nu) = tensor(Lambda, nu, -mu) x^mu + a^nu
$

$bold(x) = (x^mu, mu = 0,dots,D)$ in $d = D+1$-dimensional Minkovski space. $dd(s^2) = eta_(mu nu) dd(x^mu, x^nu)$, $eta_(mu nu) = "diag"(1,underbrace(-1\,dots\,-1, n))$. The matrix $Lambda$ define rotations of $O(D,1)$ group.

Consider Euclidean space is fine. $dd(s^2) = eta_(mu nu) dd(x^mu, x^nu)$ where $eta_(mu nu) = "diag"(1,dots,1)$.

$
  x''^(nu) = tensor(Lambda_1, nu, -mu) x'^mu + a_1^nu = tensor(Lambda_1, nu, -mu) tensor(Lambda_2, mu, -xi) x^xi + tensor(Lambda_1, nu, -mu) a_2^mu + a_1^nu
$

$
  (Lambda_1, bold(a)_1) dot (Lambda_2, bold(a)_2) = (Lambda_1 Lambda_2, bold(a_1) + Lambda_1 bold(a)_2)
$

$
  g^(-1) = (Lambda^(-1),- Lambda^(-1) a)
$

$
  I O (d,1) = T(d) times.r O(d,1)
$

The one-to-one correspondence between vector $x in bb(R)^(d,1)$ and $2 times 2$ Hermitian matrices. It's a isomorphism in lie algebra such that:

$
  & lie("so")(2,1;bb(C)) tilde.equiv lie("so")(3,bb(C)) tilde.equiv lie("sl")(2;bb(C)) tilde.equiv lie("sp")(2;bb(C)) \
  & lie("so")(3,1;bb(C)) tilde.equiv lie("so")(4;bb(C)) tilde.equiv lie("sl")(2;bb(C)) plus.o lie("sl")(2;bb(C)) \
  & lie("so")(5,1;bb(C)) tilde.equiv lie("so")(6;bb(C)) tilde.equiv lie("sl")(4;bb(C))
$

$
  bold(x) <-> X, quad X = x^mu sigma_mu
$

$
  sigma_mu sigma^nu = tensor(delta, nu, -mu) + tensor(epsilon, -mu, nu, xi) sigma_xi
$

$
  Tr(x^mu sigma_mu sigma^nu) = Tr(x^mu (tensor(delta, nu, -mu) + tensor(epsilon, -mu, nu, xi) sigma_xi)) = 2 x^mu
$

$
  x^mu = 1/2 Tr(X sigma^mu)
$

Then $X$ should follow the same obligation of $x^mu$, transforming as below:

$
  X' = U X U^dagger + A, quad sigma_nu tensor(Lambda, nu, -mu) = U sigma_mu U^(dagger), A = a^mu sigma_mu
$

We fix the arbitrariness of matrix $U$ due to surjection in constraint of $U$ indicating non-one-to-one correspondence of $Lambda$ and $U$.

$
  det U = 1
$

$
  I s p (d,1) = T(d) times.r S p i n (d,1)
$

$
  (U_1, A_1) dot (U_2, A_2) = (U_1 U_2, U_1 A_2 U_1^dagger)
$

$
  g^(-1) = (U^(-1), - U^(-1) A U^(-1)^dagger)
$

Suppose $alpha(g)$ is the action of $alpha(g): f -> f'$ and $beta(g)$ is the action of $beta(g): g_0 -> g'_0$. Such action representation would be reduced to a notation as $g dot (-)$. Where left is $g_L dot (-)$ and right is $g_R dot (-)$ for simplicity.

$
  g_L dot f(g_0) = f'(g_0) = f(g_L dot g_0)
$

$
  g_R dot f(g_0) = f'(g_0) = f(g_R dot g_0)
$

Clearly:

$
  g_1 dot (g_2 dot f(g_0)) = g_2 dot f(g_1 dot g_0) = f(g_2 dot (g_1 dot g_0))
$

Is contravariant.

So the action should be canonically:

$
  beta(g_2) compose beta(g_1) = beta(g_1 g_2), quad beta(e) = "Id"
$

a anti-homomorphism. We left with two choices:

$
  beta(g)_L dot g_0 = g^(-1) g_0, quad beta(g)_R dot g_0 = g_0 g
$

$
  g_L dot f(g_0) = f(g^(-1) g_0), quad g_R dot f(g_0) = f(g_0 g)
$

Suppose $G = tilde(L)(3,1)$:

$
  g_0 <=> (bold(x),bold(z),tb(z)) := (bold(x),vf(z)) <=> (X,Z) , quad X = x^mu sigma_mu, Z in S L (2; bb(C))
$

$
  g <=> (bold(a), Lambda) <=> (A,U), quad g^(-1) <=> (-Lambda^(-1) bold(a), Lambda^(-1)) <=> (- U^(-1) A U^(-1)^dagger, U^(-1))
$

Where $Z$ is spin coordinates:

$
  Z = (bold(z), tilde(bold(z))) = mat(z_1, tilde(z)_1; z_2, tilde(z)_2) \
  z'_alpha = tensor(U, -alpha, beta) z_beta, quad tilde(z)_alpha = tensor(U, -alpha, beta) tilde(z)_beta, quad z_1 tilde(z)_2 - tilde(z)_1 z_2 = 1
$

$
  det Z' = det U det Z = det Z
$

We fix the determinant as $det Z = 1$ as $Z in S L (2; bb(C))$

$
  g'_0 = g g_0 &tilde.eq (X',Z') = (A, U) dot (X,Z) = (U X U^dagger + A, U Z) \
  &tilde.eq (bold(x)', bold(z)', tb(z)') = (bold(a),Lambda) dot (bold(x),bold(z),tb(z)) =(Lambda bold(x) + bold(a), U bold(z)', U tb(z)') quad Lambda <-> U\
$

$
  g'_0 = g_0 g^(-1) &tilde.eq (X,Z) dot (-U^(-1) A U^(-1)^dagger, U^(-1)) = (Z (-U^(-1) A U^(-1)^dagger) Z^dagger + X, Z U^(-1)) \
  &= (X - (Z U^(-1)) A (Z U^(-1))^dagger, Z U^(-1)) \
$

One can plugin $(-)dot (A,U)$ for simplicity:

$
  (X,Z) dot (A,U) = (X + Z A Z^dagger, Z U)
$

However, because $Lambda -> U$ is many to one. There's no canonical right action by representation of coordinates. So we can define a correspondence by certain choice #footnote[The choice is arbitrary for exactness only if possible. Or we say we define a *filter* for choice.].

Define a map $L (Lambda) = U$ for such choices.

$
  g'_0 = g_0 g^(-1) &tilde.eq (bold(x),bold(z),tb(z)) dot (bold(a),Lambda) = (bold(x) + Z bold(a) , L(Lambda) bold(z), L(Lambda) tb(z)) quad Lambda <-> L(Lambda) = U
$

==

$
           T(a): & bold(x) -> bold(x) + bold(a) \
  Lambda(omega): & bold(x) -> Lambda bold(x) \
$

$
  hat(X) = lr(dv(g(t), t) bar)_(t=0), quad g(0) = e
$

$
  tensor(Lambda, mu, -rho) tensor(eta, -mu, -nu) tensor(Lambda, nu, -sigma) = tensor(eta, -rho, -sigma)
$

$
  tensor(Lambda, mu, -nu) = tensor(delta, mu, -nu) + tensor(omega, mu, -nu) => tensor(eta, -mu, -nu) tensor(omega, mu, -rho) + tensor(eta, -mu, -nu) tensor(omega, nu, -sigma) = 0 => tensor(omega, -nu, -rho) + tensor(omega, -mu, -sigma) = 0
$

Therefore, $T(a)$ and $Lambda(theta)$ as operator upon algebraic object of representation would be:

$
  T(a) = 1 + i a^mu hat(p)_mu + O(a^2), quad Lambda(theta) = 1 + i omega^(mu nu) hat(J)_(mu nu) + O(omega^2)
$

$
  tensor(omega, mu, nu) = - tensor(omega, nu, mu) => J_(mu nu) = - J_(mu nu) => tensor(J, mu, nu) prop tensor(gamma, mu) and tensor(gamma, nu)
$

Where second identity from the swapping and relabelling of indices. Then $J^(mu nu)$ as operator should be inducing a anti-symmetric algebra.

Indeed:

$
  delta V^rho = tensor(omega, rho, -sigma) V^sigma = tensor(eta, rho, alpha) tensor(omega, -alpha, -sigma) V^sigma &= tensor(eta, rho, alpha) 1/2 (tensor(omega, -alpha, -sigma) V^sigma - tensor(omega, -sigma, -alpha) V^sigma) \
  &= 1/2 (omega_(alpha sigma) eta^(rho alpha) V^sigma - omega_(sigma alpha) eta^(rho alpha) V^sigma)) \
  &= 1/2 omega_(alpha sigma) (eta^(rho alpha) V^sigma - eta^(rho sigma) V^alpha) quad "swap second term": sigma <-> alpha \
  &= 1/2 omega_(alpha sigma) [J^(alpha sigma), V^rho]
$

Where the last identity from the evaluation of $Lambda(theta)$ on vector should be same as the variation of transformation of vector. If we want a *quantum style*, as previous shown, we add $i$, the imaginary unit.

$
  [J^(mu nu), V^rho] = i (eta^(rho nu) V^mu - eta^(mu rho) V^nu)
$

$
  [J^(mu nu), p^rho] = i (eta^(rho nu) p^mu - eta^(mu rho) p^nu)
$

The final term can be evaluated:

$
  J^(mu nu) := gamma^mu and gamma^nu
$

By normalization of factor.

Consider the extension of anti-symmetric algebra should factor out a unique homomorphism from tensor algebra such that:
$
  gamma^mu times.o gamma^nu = 1/2 (gamma^mu times.o gamma^nu + gamma^nu times.o gamma^mu) + 1/2 (gamma^mu times.o gamma^nu - gamma^nu times.o gamma^mu) => eta^(mu nu) + gamma^mu and gamma^nu
$

Where $eta^(mu nu)$ of symmetric part is the bilinear-form endowed as Minkovski metric which can be achieved by normalization. Or better, the commutator must be closed as a linear form of $eta$, therefore it must be proportional to the metric.

Usually, we notate $gamma^mu times.o gamma^nu = gamma^mu gamma^nu$ for simplicity just like other tensor.

$
  gamma^mu gamma^nu and gamma^rho &= gamma^mu (gamma^nu and gamma^rho) + (gamma^mu and gamma^rho) gamma^nu \ &= gamma^mu gamma^nu gamma^rho - gamma^mu eta^(nu rho) + gamma^mu gamma^rho gamma^nu - gamma^(mu rho) gamma^nu \
  &= 2 gamma^mu eta^(nu rho) - gamma^mu eta^(nu rho) - eta^(mu rho) gamma^nu quad [gamma^nu gamma^rho]_+ = 2 eta^(nu rho) \
  &= gamma^mu eta^(nu rho) - gamma^(nu) eta^(mu rho)
$

If one evaluate bracket identity:

$
  [A B,C] = A [B,C]_+ - [A,C]_+ B
$

By homomorphism in tensor, we evaluate in bracket.

$
  J^(mu nu) and gamma^rho = gamma^mu gamma^nu and gamma^rho = [gamma^mu gamma^nu, gamma^rho] = gamma^mu eta^(nu rho) - gamma^nu eta^(mu rho)
$

$
  [J^(mu nu), J^(rho sigma)] &= gamma^mu gamma^nu and gamma^rho gamma^sigma quad "due to" eta^(mu nu) and gamma^rho = 0 \
  &= (gamma^mu gamma^nu and gamma^rho) gamma^sigma + gamma^rho (gamma^mu gamma^nu and gamma^sigma) \
  &= gamma^mu gamma^sigma eta^(nu rho) - gamma^nu gamma^sigma eta^(mu rho) + gamma^rho gamma^mu eta^(nu sigma) - gamma^rho gamma^nu eta^(mu sigma) \
  &= J^(mu sigma) eta^(nu rho) - J^(v sigma) eta^(mu rho) + J^(rho mu) eta^(nu sigma) - J^(rho nu) eta^(mu sigma) "expanding" gamma^mu gamma^nu "then" eta^(mu nu) eta^(sigma rho) "cancelled"
$

// One can also compute in matrix contraction such that $tensor((J^(mu nu)),-alpha,-beta) = tensor(delta,mu,-alpha) tensor(delta,nu,-beta) - tensor(delta,mu,-beta) tensor(delta, nu,-alpha)$ for matrix $(alpha,beta)$, Therefore $J^(mu nu) J^(rho sigma) = J^(mu sigma) eta^(nu eta) - J^(nu sigma) eta^(mu rho)$.
//
In order to deduce the generator in representation:

$
  hat(xi) dot f(g_0) = lr(dv(, t) f (e^(- t hat(xi)) dot g_0)|)_(t=0)
$

Where $e^(- t xi)$ is the lift to certain $g in G$ by parametrization of $t$.

$
  T(a)_L (t) dot g_0 = T(a)^(-1)(t) (bold(x),vf(z)) = (bold(x) - bold(t) bold(a), vf(z))
$

$
  lr(dv(, t) f (T(a)_L (t) dot g_0)|)_(t=0) = lr(dv(, t) f(bold(x) - bold(t) bold(a),vf(z))bar)_(t=0) = - a^mu pdv(f, x^mu) = a^mu hat(p)_mu (f(bold(x),vf(z)))
$

$
  hat(p)_L_mu = - i pdv(, x^mu)
$

In quantum style.

Rotation is already evaluated by $delta V^rho = tensor(omega, rho, -mu) V^mu$.

$
  dv(, t) f(Lambda(omega)_L (theta) dot g_0) &= lr(dv(, t) (f (x^rho - theta thin omega^(mu nu) (tensor(eta, rho, -nu) x_mu - tensor(eta, rho, -mu) x_nu ), vf(z)))bar)_(theta = 0) \
  &= - omega^(mu nu) (tensor(eta, rho, -nu) x_mu - tensor(eta, rho, -mu) x_nu) pdv(f, x^rho) \
  &= - omega^(mu nu) (pdv(f, x^nu) x_mu - pdv(f, x^mu) x_nu)
$

$
  L_L_(mu nu) = i(pdv(, x^mu) x_nu - pdv(, x^nu) x_mu)
$

Generally, it's easier to calculate by:

$
  delta f = delta x^mu pdv(f, x^mu)
$

For any coordinates.

The generator for spin basis follows the same routine:

$
  U(omega) = exp (-i/2 omega^(mu nu) Sigma_(mu nu)) in S L (2;bb(C))
$

Where $Sigma_(mu nu) <-> J_(mu nu)$ is the matrix representation of generator that generates element $U$. It's instructive to mention that $mu,nu$ is not matrix element but indices of *generators*.

$
  Sigma_(mu nu) := tensor((Sigma_(mu nu)), alpha, -beta)
$

$
  z_alpha -> z_alpha - 1/2 omega^(mu nu) tensor((Sigma_(mu nu)), alpha, -beta) z_alpha pdv(f, z^alpha)
$

$
  S_L_(mu nu) = 1/2 tensor((Sigma_(mu nu)), alpha, -beta) z_alpha pdv(, z^alpha)
$

Where $S_(mu nu)$ is the group action on $f$ induced by matrix representation $Sigma_(mu nu)$ action on $z_alpha$. It's tough to evaluate the concrete form of $Sigma_(mu nu)$.

#quote(
  attribution: [FIELDS ON THE POINCARE ́ GROUP: Arbitrary Spin Description and Relativistic Wave Equations],
  block: true,
)[
  In the framework of theory of the scalar functions on the Poincar ́e group a standard spin description in terms of multicomponent functions arises under the separation of space and spin variables.

  Since $vf(z)$ is invariant under translations, one may decomposed $dots$
]

$
  f(bold(x),vf(z)) = phi^i (vf(z)) psi_i (bold(x))
$

Where $phi^i (vf(z))$ forms a *basis* in the representation space of Lorentz group. The basis can be transformed as:

$
  phi^i (vf(z)') = phi^j (vf(z)') dot tensor(U, -j, i)
$

By apply group action in matrix multiplication.

To reduce notation, It's simpler to omit indices in summation.

$
  f'(bold(x)',vf(z)') = phi(vf(z)') psi'(bold(x)') = (phi(vf(z)) dot U) psi'(bold(x)') = phi(vf(z)) psi'(bold(x)')
$

$
  psi'(bold(x)') = U^(-1) dot psi(bold(x)) = U^(-1) psi(g_L dot bold(x)')
$

It suggests that:

$
  g_L dot psi(bold(x)) = U^(-1) dot psi(g_L dot bold(x)) = U^(-1) dot psi(Lambda^(-1) (bold(x) - bold(a)))
$

// $
// 	[sigma_mu, sigma_nu]_+ = 2 delta_(mu nu) \
// 	(sigma_mu)^T = - sigma_mu
// $

// $
// 	sigma_mu = - sigma_nu^(-1) sigma_mu sigma_nu = - sigma_nu sigma_mu sigma_nu quad mu != nu \
// $
//
$
  & overline(sigma)_mu = (sigma_0, -sigma_i) \
  & overline(x)_mu = (x_0, - x_mu) \
  & overline(X) = x^mu overline(sigma)_mu
$

Is the space reflection or parity transformation $P$. Reversely, $-overline((dot))$ indicates time reversal.

$
  & (X, Z) ->^P (overline(X), (Z^dagger)^(-1)) \
  & (X, Z) ->^T (-overline(X), (Z^dagger)^(-1)) \
  & (X, Z) ->^(P T) (- X, Z) \
  & (X, Z) ->^C (X^*, Z^*) \
$

$
  f(bold(x),vf(z)) ->^P f(overline(bold(x)),(vf(z)^dagger)^(-1))
$

$
  f(bold(x),vf(z)) ->^T f(- overline(bold(x)),(vf(z)^dagger)^(-1))
$

$
  f(bold(x),vf(z)) ->^C f^* (bold(x),vf(z))
$

Is charge conjugation by $i -> -i$.

==

Relativistic wave equations are nothing but eigenvalue problems for invariant operators acting on functions on the Poincaré group, and the successes and failures of all known higher-spin equations follow rigidly from the structure of Lorentz and Poincaré representations.

=== Dimensions 1+1

$
  I s o (d=1,1) = T(2) times.r S O (1,1)
$

$
  f(bold(x),vf(z)) = f((x_1,x_2),theta)
$

$
  & hat(p)^2 = - partial_mu partial^mu \
  & hat(S) = - i partial_theta
$

$
  & hat(p)^2 f(x,theta) = m^2 f(x,theta) \
  & hat(S) f(x,theta) = lambda f(x,theta) \
$

$
  f(x,theta) = psi(x) e^(plus.minus i lambda theta)
$

In rest frame, it's easy to write down:

$
  f_"rest" (x,theta) = e^(plus.minus i m x^0) (e^(i lambda theta) plus.minus e^(- i lambda theta))
$

But the general problem is still unsolved that how to construct a invariant under improper Poincaré group#footnote[where the representation space must be invariant under $P: cal(H) -> cal(H)$.] with definite solution.

$
  hat(p)_mu hat(Gamma)^mu f(x, theta) = kappa f(x,theta)
$

$
  hat(Gamma)^mu := hat(Gamma)^mu (theta, pdv(, theta))
$

The group can be extended from $S O(1,1)$ to $S O (2,1) ~ S U (1,1)$ where $s = abs(lambda)$ is invariant under parity offering a potential solution. It's worth to note that any element $g in S O (1,1)$ is a rotation of *time-space* plane. To formalize the correspondence, one may fix the *space* plane rotation element as $hat(Gamma)^0$, consequently, $hat(S) in S O(1,1) subset S O (2,1)$ is identified as $hat(Gamma)^(1\/2)$.

$
  [hat(Gamma)^i, hat(Gamma)^j] = epsilon^(i j k) hat(Gamma)_k , quad hat(Gamma)^i hat(Gamma)_i = s(s+1), quad eta = "diag"(1,-1,-1)
$

We still apply quantum style where the commutator generate $i$ the imaginary unit.

$
  [hat(Gamma)^i, hat(Gamma)^j] = i epsilon^(i j k)hat(Gamma)_k
$

$
  hat(Gamma)^i = A^i (theta) + B^i (theta) partial_theta \
$

$
  [hat(S), f(theta)] = - i f'(theta), quad [hat(S),partial_theta] = 0
$

$
  [hat(S) = hat(Gamma)^2, hat(Gamma)^i] = - i (A'^i (theta) + B'^i (theta) partial_theta) = i epsilon^(i j) hat(Gamma)_j, quad i,j in {0,1}
$

$
   A'_i & = - tensor(epsilon)^j_i A_j \
  A''_i & = epsilon_i^j epsilon^i_j A_i = A_i quad i <-> j \
    A_i & = C_(1 i) cosh theta + C_(2 i) sinh theta \
    B_i & = D_(1 i) cosh theta + D_(2 i) sinh theta \
$

$
  [f(theta), g(theta) partial_theta] = - f'(theta) g(theta) \
  [f(theta) partial_theta, g(theta) partial_theta] = (f(theta) g'(theta) - g f'(theta)) partial_theta
$

$
  [hat(Gamma)^0, hat(Gamma)^1] & = i hat(Gamma)^2 = i hat(S) = partial_theta \
                               & = [A^0 + B^0 partial_theta, A^1 + B^1 partial_theta] \
                               & = (B^0 A'^1 - B^1 A'^0) + (B^0 B'^1 - B^1 B'^0) partial_theta \
                               & = partial_theta
$

$
  B^0 A'^1 - B^1 A'^0 & = 0 \
              B^0/B^1 & = A'^0/A'^1 \
$

$
  B^0 B'^1 - B^1 B'^0 = 1 \
$

It's clear that one can fix $B_0 = - sinh theta$, then $B_1 = -cosh theta$. Therefore $A_0 = cosh theta$, $B_0 = sinh theta$ invariant up to constant.

$
  hat(Gamma)^0 = C cosh theta - sinh theta pdv(, theta), quad hat(Gamma)^1 = C sinh theta - cosh theta pdv(, theta)
$

$
  hat(Gamma)^mu hat(Gamma)_mu = C^2 (cosh^2 theta - sinh^2 theta) + C (- sinh^2 theta + cosh theta^2) = C^2 + C = s(s+1) => C = s
$

In rest frame: $f(x,theta) = phi(theta) psi(x)$, $hat(p) psi(x) = plus.minus m$.

$
  hat(Gamma)^0 phi(theta) = (s cosh theta - sinh theta pdv(, theta)) phi(theta) &= plus.minus kappa/m phi(theta)\
  sinh theta pdv(, theta) phi(theta) &= (- (plus.minus kappa/m) + s cosh theta) phi(theta) \
  ln phi(theta) &= integral (- (plus.minus kappa/m)/(sinh theta) + s coth theta) d theta \
  ln phi(theta) &= - (plus.minus kappa/m) ln (tanh theta/2) + s ln (sinh theta) \
  phi(theta) &= C (sinh theta)^s (tanh theta/2)^(minus.plus kappa\/m)
$

Indeed, $kappa = plus.minus m s$.

$
  f_"rest" (x,theta) = C_1 e^(i m x_0) (cosh theta/2)^(2s) + C_2 e^(-i m x_0) (sinh theta/2)^(2s)
$

For a *fixed* axial spin system.

$
  (cosh theta/2)^(2 s) = sum_(lambda = -s)^s a_lambda e^(lambda theta) \
  (sinh theta/2)^(2 s) = sum_(lambda = -s)^s b_lambda e^(lambda theta)
$

Forming a spin basis containing $2s+1$ components. So one can expand in basis to yield a matrix action on space part:

$
  hat(p)^mu hat(Gamma)_mu (psi^i (x) phi_i (theta)) &= hat(p)^mu psi^i (x) hat(Gamma)_mu phi_i (theta) \ 
  &= hat(p)^mu psi^i (x) tensor((hat(Gamma)_mu),-i,j) phi_j (theta) = m psi^i (x) s phi_i (theta) \
  &= (1/s hat(p)^mu tensor((hat(Gamma)_mu),-i,j) -m) psi^i (x) = 0 
$

For $s = 1\/2$, the function $f(x,theta) = sum_(lambda=-1/2)^(1/2) psi_(1/2,lambda) e^(lambda theta)$ as vector $Psi(x) = (psi_(1/2,1/2) (x), psi_(1/2,-1/2)(x))$.

$
  &hat(Gamma)^0 e^(theta/2) = 1/2 (cosh theta - sinh theta) e^(theta/2) = 1/2 e^(-theta) e^(theta/2) = 1/2 e^(-theta/2) \
  &hat(Gamma)^0 e^(-theta/2) = 1/2 (cosh theta + sinh theta) e^(-theta/2) = 1/2 e^(theta) e^(-theta/2) = 1/2 e^(theta/2)
$

$
  hat(Gamma)^0 vec(e^(theta/2), e^(-theta/2)) = vec(1/2 e^(-theta/2), 1/2 e^(theta/2)) \
  (hat(Gamma)^0) = mat(0,1/2;1/2,0), quad 1/s (hat(Gamma)^0) = 2(hat(Gamma)^0) = sigma_1\
$

$
  &hat(Gamma)^1 e^(theta/2) = 1/2 (sinh theta - cosh theta) e^(theta/2) = - 1/2 e^(-theta/2) \
  &hat(Gamma)^1 e^(-theta/2) = 1/2 (sinh theta + cosh theta) e^(-theta/2) = 1/2 e^(theta/2)
$

$
  hat(Gamma)^1 vec(e^(theta/2), e^(-theta/2)) = vec(-1/2 e^(-theta/2), 1/2 e^(theta/2)) \
  (hat(Gamma)^1) = mat(0,-1/2;1/2,0), quad 1/s (hat(Gamma)^1) =  2(hat(Gamma)^1) = -i sigma_2 \
$

$
  &hat(Gamma)^2 e^(theta/2) = - i/2 e^(theta/2) \
  &hat(Gamma)^1 e^(-theta/2) = i/2 e^(-theta/2) \
$

$
  hat(Gamma)^2 vec(e^(theta/2), e^(-theta/2)) = vec(-i/2 e^(theta/2), i/2 e^(-theta/2)) \
  (hat(Gamma)^2) = mat(-i/2,0;0,i/2), quad 1/s (hat(Gamma)^2) = 2 (hat(Gamma)^2) = i sigma_3
$

For $s=1$, the function $f(x,theta) = sum_(lambda=-1)^1 psi_(1,lambda) e^(lambda theta)$ as vector $Psi(x) = (psi_(1,1) (x),psi_(1,0) (x),psi_(1,-1) (x))$.

$
  
$