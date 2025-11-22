#import "lib.typ": *
#import "@preview/physica:0.9.5": *

#show: mine.with(
  title: "Statistical Mechanics",
)

= Priori

== Probability

Probability is a fundamental information lost measure. Suppose we know the dynamics of a process, and its initial condition, we can deduce the deterministic results.

So, probability must be a measure upon some potential state set to reflect the state in *frequency* or *understanding* to such system. We say $P: Omega -> cal(B)$ with element measure as $P(d mu)$ for $d mu in Omega$, or discrete $P(omega)$ for $omega in Omega$. Thus, we can take the summon on such element due to disjointness that $P(union_i omega_i) = P(A)$ where $omega_i in A$.

$
  P( A inter B )/(P(B)) = P(A|B)
$

Indicates that the conditional probability $A|B$ of a given presumed condition $B$. Suppose one has $P(A inter B = emptyset) = 0$, one has $P(A|B) = 0$. If $A subset.eq B -> A inter B = A$, we has a simpler expression $P(A)\/P(B)$, which is akin to a subset from whole. Another special case is $P(A|B) = P(A)$ where the condition is indifferent to $A$, where one has $P(A inter B) = P(A)P(B)$.

$
  P(A inter B) = P(A|B) dot P(B) = P(B|A) dot P(A) \
$

Then given that $Omega = union_i A_i$ for disjoint partition, we has:

$
  P(A inter Omega = A) = P(A|Omega) dot P(Omega) = sum_i P(A|B_i) P(B_i)
$

Given a projection or random variable $X: Omega -> cal(B)$ where $cal(B)$ is measurable set, which, you may want it's also a metric and separable space, however, the crucial thing is one commonly investigate the state set by such function, suppose we have $t -> f(t)$ in classical mechanics, we inspect that $f(t + T) = f(t)$, then we retroactively conclude that in such system, time is in period. The same thing happens upon the state space. We redistribute the state space through a coarse measure of it to acquire a dynamics quality. Such thing can be restated in statistical mechanics that we have many micro states of particles and a projection or macro state to *reflect* the system.

$
  integral_Omega P(d mu) = 1_(cal(B))
$

Sometimes given a already measurable state space, we will notate also:

$
  integral_Omega P(d mu) equiv integral_Omega p(mu) d mu equiv integral_Omega d P \
  (d P)/(d mu) = p
$

Thus we can extend probability from state set to random variable as indicators:

$
  P(X in cal(B)) = integral_{omega in Omega|X(omega) in cal(B)} P(d mu) \
  bb(E)(X) = angle.l X angle.r = integral_Omega X P(d mu)
$

Thus if one has no additional investigation upon such state space, each state is indifferent and thus, *equal* in respective view of evaluation. Such *priori* probability is called uniform distribution, which is the basic results comes from indifference of elements of a set. How? A uneven distribution would reflect the underneath state dynamics by given intersections or *section* in local view. Then for even case, each $P(inter^(infinity)_i A_i) -> P(omega)$ must be equal for any set convergence, resulting the same local view.

$
  P(union_I omega_i) = sum_i P(omega_i)\/ integral_Omega P(d omega in Omega) = 1_cal(B) \
  P(omega_i) = 1/abs(Omega) #[or] P(omega) = delta(mu = omega)
$
I avoid $delta(mu - omega)$ to adapt set without any natural number system. Thus, it's a uniform distribution throughout whole isolated basic states.

A strong suggestion of such *priori* equal probability is information, which is the most unknown condition for observer. If you read few axioms about information and entropy origin, you will find that it's a delicate suitable restriction to deduce the results form. For example, strong additivity:

$
  & H(X,Y)_p = H(X)_p + H(Y|X)_p \
  & H(X,Y)_p = H(X)_p + H(Y)_p quad "if" X,Y "independent" -> H(Y|X) = H(Y)
$

For a given probability distribution. Given above maximal condition upon uniform distribution, we has below:

$
  H(X)_p = - integral_X d mu p(mu) log p(mu) = - integral_X log ((d P)/(d mu)) d P \
  H(X)_(1/N) = sum_i 1/N log N = log N \
$

Often, we call $-log p(mu)$ information $I(X)_p$. It is suitable for any restriction based on human imaginary, for example, you should acquire more information if the probability is low because you need to update your knowledge based on Bayesian!

$
  H(X, Y)_p & = - integral_(X,Y) d mu p(x,y) log p(x,y) \
            & = - integral_(X,Y) d mu p(x,y) log p(x) p(y|x) \
            & = - integral_(X) d mu p(x) log p(x) - integral_(X,Y) p(x,y) log p(y|x)
$

$
  H(Y|X) & = integral_X d mu p(x) H(Y|X = x) \
         & = - integral_(X,Y) d mu p(x) p(y|x) log p(y|x) \
$

Where $H(X) = bb(E)(I(X))$, thus fix a element $x$, one has $H(Y|X=x) = bb(E)(I(Y|X=x))$. Then we integrate or sum on the state subset $X$.
$
  S(p_i, lambda_a) = - sum_i p_i log p_i + sum_a lambda_a (sum_i X^a_i p_i - X^a) \
$
With $lambda_a$ the Lagrange multiplier, $sum_i X^a_i = X^a$ the summation constraint. We has such extreme point:

$
  (partial S)/(partial p_i) = - log p_i - 1 + sum_a lambda_a X^a_i = 0 \
  (partial S)/(partial lambda_a) = sum_i X^a_i p_i - X^a = 0 \
$

Thus we have the distribution:

$
  p_i = exp(sum_a lambda_a X^a_i - 1) = 1/Z exp(sum_a lambda_a X^a_i)
$

We can extend such in continuous case by the generalized Lebesgue integral, therefore a example can be shown that:

$
  integral d mu(x) P(x) = 1 quad integral d mu(x) x P(x) = angle.l x angle.r quad integral d mu(x) P(x) x^2 = angle.l x^2 angle.r \
$

$
  P(x) & = C e^(lambda_1 x + lambda_2 x^2) \
       & = C exp(lambda_1^2/(4 lambda_2)) exp(-lambda_2 (x + lambda_1/(2 lambda_2))^2) \
       & = A exp(...)
$

Now we try to deduce coefficients $lambda_1$ and $lambda_2$ by the constraint:

$
  x -> x + lambda_1/(2 lambda_2) = y \
  integral^infinity_(-infinity) P(x) d x = A sqrt(pi/lambda_2) = 1 \
  A integral^infinity_(-infinity) (y - lambda_1/(2lambda_2)) e^(-lambda_2 y^2) d y = - A lambda_1/(2 lambda_2) sqrt(pi/lambda_2) = angle.l x angle.r \
  A integral^infinity_(-infinity) (y - lambda_1/(2 lambda_2))^2 e^(-lambda_2 y^2) d y = 1/(2lambda_2) + lambda_1^2/(4 lambda_2^2) = angle.l x^2 angle.r \
$

$
  lambda_1/lambda_2 = - 2 angle.l x angle.r \
  1/(2 lambda_2) = angle.l x^2 angle.r - angle.l x angle.r^2 \
$
$
  angle.l x angle.r = alpha quad angle.l x^2 angle.r - angle.l x angle.r^2 = beta^2 \
  P(x) = A exp((x- alpha)^2/(2 beta^2)) \
$

Is the final answer, which is a Gaussian distribution with mean $alpha$ and variance $beta^2$.


You can deduce the maximal entropy by Lagrange multiplier with restriction $sum_i p_i = 1$, which is coincide to the uniform distribution. However, you can't deduce reversely by such condition, because there are a huge set of functional suitable for uniform convergence, for example $H^? = sum_i p_i^2$.

$
  S_n = 1/n sum_i^N X_i >= x
$

For non-negative random variable space $X$:
$
  bb(E)(X) = integral_X X d P(X)>= integral_(X>=a) X d P(X) >= a integral_(X>=a) d P(X) = a P(X>=a)
$

$
  bb(E)(X) >= a P(X>=a)
$

$
  mu_n = cal(B)(1/n sum_i^N X_i) = P_(1/n sum_i^N X_i)\
$

$
  mu_n ([x,infinity)) & = P(1/n sum_i^N X_i >= x) \
                      & = P(exp(lambda sum_i^n X_i) >= exp(lambda n x)) \
                      & <= exp(-lambda n x) bb(E)(exp(lambda sum_i^N X_i)) \
                      & = exp(-n (lambda x - Lambda(lambda) )) quad Lambda = ln bb(E)(exp(lambda sum_i^N X_i))
$

$
  Lambda^*(lambda,x) = lambda x - Lambda(lambda)
$

We could explicitly evaluate on.

$
  P(S_n = s) = integral_{S_n (mu) = s} p(mu) d mu = integral_Omega delta(S_n (mu) - s) p(mu) d mu = angle.l delta(S_n (mu) - s) angle.r
$

$
  delta(s) &= 1/(2 pi) integral e^(i zeta s) d zeta = 1/(2pi i) integral_(- i infinity + a)^(i infinity + a) e^(zeta s) d zeta
$

$
  P(S_n = s) = 1/(2pi i) integral_(- i infinity + a)^(i infinity + a) d zeta integral_Omega d mu p(mu) e^(zeta S_n (mu) - s) = 1/(2pi i) integral_(- i infinity + a)^(i infinity + a) d zeta e^(- zeta s) integral_Omega d mu thin p(mu) e^(zeta S_n (mu))
$

Suppose such limit exist:

$
  zeta -> n zeta \
  Lambda(zeta) = lim_(n->infinity) 1/n ln angle.l e^(n zeta S_n) angle.r = lim_(n-> infinity) 1/n ln product_(i=1)^N angle.l e^(zeta X_i) angle.r = ln angle.l e^(k X) angle.r
$

We have such exponential decay with the greatest contribution from saddle point if $Lambda(zeta)$ is analytic:

$
  P(S_n = s) ~ integral^(zeta^* + i infinity)_(zeta^* - i infinity) d zeta e^(- n (zeta s - Lambda(zeta))) ~ e^(-n (zeta^* s - Lambda(zeta^*)))
$

Which should be the minimum of the $- n (zeta s - Lambda(zeta))$ or the maximum of $zeta s - Lambda (zeta)$.

For Gaussian sample, which is already what we expected in exponential expression, we could evaluate the $Lambda(k)$:

$
  angle.l e^(k X) angle.r &= integral_(-infinity)^(infinity) e^(k x) 1/(sqrt(2pi sigma^2)) e^(- (x-mu)^2/(2 sigma^2)) d x \
$
$
  -1/(2 sigma^2) (x^2 - 2(mu + k sigma^2) x + mu^2) = -1/(2 sigma^2) [(x - (mu + k sigma^2))^2 - (mu + k sigma^2) + mu^2] \
  -1/(2 sigma^2) ((mu + k sigma^2)^2 - mu^2) = k mu + 1/2 k^2 sigma^2
$
Thus, the quadratic part is also a Gaussian distribution and then we only have the constant part which reduce to:

$
  Lambda(k) = k mu + 1/2 k^2 sigma^2 \
  I(s) = sup_k (k s - Lambda(k)) = sup_k (k (s - mu) - 1/2 k sigma^2) = (s-mu)^2/(2 sigma^2)\
$

Which is indeed same as original Gaussian sample.

Few property is worth to be noticed:

$
  Lambda'(0) = lim_(n -> infinity) (angle.l S_n e^(n k S_n) angle.r)/(angle.l S_n e^(n k S_n) angle.r)|_(k=0) = lim_(n->infinity) angle.l S_n angle.r
$

$
  Lambda''(0) = lim_(n->infinity) n (angle.l S_n^2 angle.r - angle.l S_n angle.r^2) = lim_(n -> infinity) n "Var"(S_n)
$

With Holder inequality:
$
  integral d mu f g <= (integral d mu f^(1/p))^p (integral d mu g^(1/q))^q quad (1/p + 1/q = 1)
$
$
  f -> bb(E) X = bb(E) e^(p k_1 X), g -> bb(E) Y = e^(q k_2 X) \
  ln (bb(E) (X Y)) <= ln ((bb(E) X^(1/p))^p (bb(E) Y^(1/p))^p) \
  Lambda (1/p k_1 + 1/q k_2) = 1/p Lambda (k_1) + 1/q Lambda (k_2)
$
We prove convexity of $Lambda$.

Finally, we have a rather lucky news:

$
  lambda(0) = - I (s=0)|_(k=0) =^(s "is constant") sup_s (- I (s)) = - inf_s I(s) = 0
$

Rather, we also has the convexity of $I$:

$
  I'(s) = k quad Lambda'(k) = s \
  I''(s) = (d k)/(d s) quad Lambda''(k) = (d s)/(d k) \
  I''(s) = 1/(Lambda''(k)) > 0
$

However, such won't exist if we have no analyticity of function, like mix of discrete and continuous variable. For example extend a mixed Gaussian, use our knowledge on Gaussian sample mean:
$
  & P(Y=-1) = P(Y=1) = 1/2 \
  & S_n = 1/n sum_(i=1)^n X_i + Y \
  & P(S_n in d s|Y= plus.minus 1) ~ e^(-n I_(plus.minus)(s)) d s \
  & I_(plus.minus) = (s plus.minus 1)^2/2 \
$

$
  P(S_n in d s) ~ 1/2 e^(-n I_plus (s)) + 1/2 e^(-n I_minus (s)) d s \
  I(s) = min(I_(minus)(s), I_(plus) (s)) = cases(
    I_(minus) (s) quad s > 0,
    I_(plus) (s) quad s < 0
  )
$
Which is a mirror function has both $-1,1$ as its minimum.

If $I(s)$ has a unique global minimum that $I'(s^*) = k = 0$, then: $s^* = Lambda'(0) = lim_(n->infinity) angle.l S_n angle.r$. It indicates such such value won't vanish in the exponential decay and others will concentrate upon, called typical value. Thus we can expand it in quadratic terms: $I(s) approx 1/2 I''(s^*)(s - s^*)^2$:

$
  P(S_n in d s) approx e^(- n/2 I''(s^*)(s-s^*)^2) d s quad (I''(s^*) = 1/(Lambda''(0)) = 1/sigma^2)
$

Called _Central Limit Theorem_. Which is a Gaussian sample form in limit.

Now we apply the routine to Binary sample:

$
  P(X_i = -1) = P(X_i = 1) = 1/2 \
  angle.l e^(k X) angle.r = cosh k \
  Lambda(k) = ln cosh k
$

$
  I(s) = sup_k (k s - Lambda(k)) \
$

$
  (d (k s - ln cosh k))/(d k) = s - tanh k = 0 \
  s = (e^k - e^(-k))/(e^k + e^(-k)) -> k = 1/2 ln((1+s)/(1-s))\
  1 - tanh^2 k = 1/(cosh^2 k) -> cosh k = 1/(sqrt(1- tanh^2 k)) \
  I(s) = s 1/2 ln((1+s)/(1-s)) - ln (1/(sqrt(1- s^2))) = 1/2((1+s)ln(1+s) + (1-s)ln(1-s)) quad s in [-1,1]
$

We can extend the scalar random variable into the vector valued. Given a sequence $bold(omega) = (omega_1,...,omega_n)$, taking the value on state set $Omega$, called empirical vector, which is a series of experience output, evaluate as:

$
  L(bold(omega))(mu) = 1/n sum_(i=1)^n delta(omega_i - mu) quad mu in Omega \
  k dot L = integral_(Omega) k(mu) L(omega)(mu) d mu
$

$
  integral L(bold(omega))(mu) d mu = 1/n sum_(i=1)^n integral d mu thin delta(omega_i - mu) = 1_(cal(B))
$

Is a probability density on state set. We can calculate such large deviation, extend from scalar to vector dot product.

$
  Lambda(k) & = lim_(n->infinity) 1/n ln angle.l e^(n k dot L) angle.r \
            & = ln angle.l e^(k dot L_i) angle.r \
            & = ln integral_Omega d mu thin p(mu) thin e^(k dot L_i) quad (k dot L_i = k(mu)(omega_i)) \
            & = ln integral_Omega d mu thin p(mu) thin e^(k(mu)(omega_i))
$

$
  &I(s) = sup_k (k dot s - Lambda(k)) \
  &(delta Lambda^*(k))/(delta k) = s(mu) - (p(mu) e^(k(mu)))/(integral_Omega d mu p(mu) e^(k(mu)(omega_i))) = 0 \
  &k(mu) = ln (s(mu) (integral(...))/(p(mu))) = ln (s(mu)/p(mu)) + Lambda(k) \
  &I(s) = integral d mu s(mu) ln (s(mu))/(p(mu)) + integral d mu p(mu) Lambda(k) - Lambda(k) = integral d mu s(mu) ln s(mu)/(p(mu)) = -H(s||p)
$

It suggests that $P(L(bold(omega))(mu) ~ s(mu)) ~ e^(- n I(s))$, which is the cost of our observation on the underneath real probability density $p(mu)$, called *relative entropy*. After enough observation, we conclude that the observation data should converge to the real underneath probability density. If the support of $s(mu)$ is larger than $p(mu)$, the functional will explode, and indicating that the thing never gonna happen as a zero probability.

The relative entropy is our establishment on _general maximal entropy principle_, which is the typical point or equilibrium point around behavior deeply related to maximal entropy.

Previously, we deduce Binary sample in equal probability case, we now choose an arbitrary one:

$
  P(X = 1) = p, P(X=-1) = q \
  s(X = 1) = p', s(X=-1) = q' "where" s "is Binary with" q' >= q \
  H(s||p) = q' ln q'/q + p' ln p'/p = q' ln q'/q + (1-q') ln (1-q')/(1-q)
$

Now suppose we shift from distribution $s$ into expectation value $s$ which is a abuse of notation, but I will clarify that:

$
  X s(X) & = s' \
   1-2q' & = s' \
      q' & = (1-s')/2
$

$
  I(s') = H(s||p)(s') & = (1-s')/2 ln (1-s')/2q + (1+s')/2 ln (1+s')/(2(1-q)) \
                      & = 1/2 ((1+s)ln (1+s)/(2p) + (1-s)ln (1+s)/(2(1-q)))
$

Which is same as previous example if we choose $p = 1/2$.

// It should be clarified that $x$ is a fixed number and irrelevant to $X$ as above.
// $
//   Y := X - x \
//   Lambda_Y (lambda,x) = ln bb(E)(e^(lambda Y)) = - lambda x + Lambda(lambda)
// $

// $
//   Lambda^*_Y (lambda,y) = lambda y - Lambda_Y (lambda,x) = lambda z + lambda x - Lambda (lambda) = Lambda^* (lambda, z+ x)
// $

Reside, we give another proof of large deviation.

$
  bb(E)_(P_(lambda^*))(X) & = integral X d P_(lambda^*)(X) \
                          & = integral X e^(lambda^* (X - Lambda(lambda^*, x))) d P(X) \
                          & = (M'(lambda^*))/(M(lambda^*)) quad (M(lambda^*) = bb(E)(exp(lambda^* X)) ) \
                          & = Lambda' (lambda^*) = s quad ("choose an aribitrary one" lambda^* "to achieve it")
$

$
  P(S_n subset.eq B(s,delta)) &= integral_(B(x,delta)) d P\
  &= integral_(B(x,delta)) (d P)/(d P_(lambda^*)) d P_(lambda^*) \
  &= integral_(B(x,delta)) e^(- n lambda^*(S_n + Lambda(lambda^*, x))) d P_(lambda^*) \
  &= e^(-n (lambda^*x - Lambda(lambda^*))) integral_(B(x,delta)) e^(- n lambda^*(S_n -x)) d P_(lambda^*) \
  &= e^(-n (lambda^*x - Lambda(lambda^*))) P_(lambda^*)(S_n subset.eq B(s,delta)) \
$

If such point $s$ is the concentration point of $P_(lambda^*)$, the probability around such point converge to unit in limit.

$
  "LHS" ~ lim_(n->infinity) e^(-n (lambda^* x - Lambda(lambda^*)))
$

Thus such rate function $I(x) = lambda x - Lambda(lambda)$ should exist at least in a boundary condition. Even though the actual function may not exist. Then such minimum if exist, must be $sup{Lambda^*(x)}|_lambda$ with a specified lambda, if we are lucky, it should be the convergence too. We can directly put such as the definition:

$
  lim_(n -> infinity) 1/n ln P(S_n in X) ~ I_X
$

Generally, one could apply to for various function $f(s)$, which is the general Laplacian transformation on function $f(s)$ as $Lambda(f)$.

$
  Lambda(f) = lim_(n->infinity) 1/(a_n) bb(E)(e^(a_n f(S_n))) = sup_s (f(s) - I(s))
$

= Hamiltonian

Given a phase space with coordinates $mu = (bold(q),bold(p))$ where $bold(q) = (q^1,...,q^(N))$ and $bold(p) = (p^1,...,p^(N))$. Given a volume in such phase space, denotes the initial condition as $cal(R)(0) = { mu(0) | mu(0) in cal(R)_0 } ->^("time evolution") cal(R)(t) = { mu(t) | mu(0) in cal(R) }$. For a instance time $t -> t + epsilon$, we has:

$
  d mu_(t+ epsilon) &= det((partial mu_(t+epsilon))/(partial mu_(t))) d mu_t \
  &= det(delta_(i j) + epsilon (partial dot(mu)_(t i))/(partial mu_(t j)) + O(t^2)) d mu_t \
  &= (1 + epsilon "Tr"((partial dot(mu)_(t))/(partial mu_(t)))_i + O(t^2)) d mu_t quad (log det M = "Tr" log M) \
$

We haven't introduce the dynamic equation yet, if it satisfy the canonical form:

$
  "Tr"(...) = ((partial dot(q)_(t i))/(partial q_(t i)) + ( q -> p)) = ((partial)/(partial q_(t i)) (partial H)/(partial p_(t i)) - (partial)/(partial p_(t i)) (partial H)/(partial q_(t i))) = 0
$

Which is just a reframe of the basic Hamiltonian equation, because we just integrate phase point solely.

That's, given a distribution $rho(mu, t)$:
$
  rho (mu, t) = rho (bold(p), bold(q), t) \
  (d rho)/(d t) = (partial rho)/(partial t) + {rho, H} = 0 \
$

Above called _Liouville's equation_.

A famous theorem is _Poincaré recurrence theorem_, which states that for a system with finite energy, the system will return to a state arbitrarily close to the initial state after a sufficiently long time. This is a consequence of the conservation of phase space volume and the deterministic nature of Hamiltonian dynamics.

Given a distribution $delta (E - H(bold(q),bold(p)))$, one has the possible phase space volume as the total volume $Tau$ the initial condition can transverse, for example $p^2/(2m) + 1/2 m omega^2 x^2 = H(x,p) = E$. Then we can apply a continuous transformation to the phase space volume, due to *finite energy/volume*, the union space. We clarify such transformation as $g_tau$ with given $tau$ as time parameter or any parameter you want, then we has:

$
  Tau = union.big_(k=0)^(infinity) g_tau^k cal(R)_0 quad cal(R)_0 "is initial condition phase volume" \
$

Thus we must have intersection of possible transverse like $k$ to $k + l$ finitely, otherwise $Tau$ would be infinite due to infinite disjoint sets.

$
  g^k_tau cal(R)_0 inter g^(k +l)_tau cal(R)_0 != emptyset ->^(g "is reversible") cal(R)_0 inter g^l_tau cal(R)_0 != emptyset \
$
Which prove the theorem. It said that for a non-dissipative or closed(*invertible + volume preservation*), *finite* system, the system will emerge recurrence. However, this theorem is not collide with macro equilibrium.

== Kac Ring Model


#figure(
  image("static/sm-flipper.png", width: 80%),
  caption: [Left: A configuration of the Kac ring with $N = 16$ sites and $F = 4$ flippers. The flippers, which live on the links, are represented by blue dots. Right: The ring system after one time step. Evolution proceeds by clockwise rotation. Spins passing through flippers are flipped."],
)

Above picture shows a simple model, $N$ sites is a instance with spin up and down, then we also have $F$ flippers on the link between sites, which can flip spin instance. The evolution is just rotate the ring clockwise one step and the spin instance would be flipped if it pass through the flipper. Thus, it's deterministic and invertible with finite state. It must has *recurrence*. #footnote[You may wonder why we can apply recurrence to a system without canonical Hamiltonian equation. The reason is that the theorem is not about Hamiltonian system, but about the finite state system with invertible and state volume preservation.]

Now suppose $s(0) = (s_i (0))$ is the initial state, we has a general probability relation:

$
  s_i (+) = 1, s_i (-) = -1 \
  sum_i s_i (+) (n+1) = (N - F)/N sum_i s_i (+) (n) + F/N sum_i s_i (-) (n)\
$

$
  N^+ + N^- = N \
  p^+ (n+1) = (1 - eta) p^+ (n) + eta (1 - p^+ (n)) quad eta = F/N \
  p^+ (n+1) = (1-2 eta) p^+ (n) + eta \
$

Thus one should have:

$
  p^+(n) = a + b (1-2eta)^n \
  p^+(0) = a + b \
  p^+(infinity) = 1/2 = a \
  p^+(n) = 1/2 + (p^+(0) - 1/2) (1-2eta)^n \
$

#figure(
  image("static/sm-kac-test.png", width: 80%),
  caption: [Three simulations of the Kac ring model with $N = 2500$ sites and three different concentrations of flippers. The red line shows the magnetization as a function of time, starting from an initial configuration in which 100% of the spins are up. The blue line shows the prediction of the Stosszahlansatz, which yields an exponentially decaying magnetization with time constant $tau$.],
)


It's astonishing that given a priori uniform distribution, one can acquire a probability evolution, without any confliction with deterministic evolution, which we cast off information for a specific ring and presume a potential microstates in priori uniform distribution.

Now we construct the microscopic state:
$
  bold(X)(t) = (s_1(t), s_2(t), ... ,s_N (t)| m_1(t), m_2(t),... m_F (t)) quad (s_(i+1)(t) = m_i s_i (t))
$

For each micro state, one can generate by permutation choices of flippers, which is $vec(N, F)$, however we know many of them is same for unknown observer, such process called *coarse-graining* or *projection*, which is often the averaging over irrelevant degrees of freedom, losing micro information increasing macro entropy.

Now the macro state is evident that:
$
  Delta (t) = sum_i s_i (t) quad (s_i (+) = 1, s_i(-) = -1) \
$

With such projection:

$
  Delta(t) = sum_bold(m) P(bold(m)) Delta(t|bold(m))
$
For each general ensemble of flipper distribution, which is priori uniform distribution, one can decompose as:

$
  Delta(t) & = sum_(bold(m)) 1/vec(N, F) Delta(t|bold(m)) \
           & = sum_(bold(m)) 1/vec(N, F) sum_i s_i^+ (t|bold(m))
$

$
  sum_i s_i^+(t|bold(m)) = sum_i (product_(k=0)^(t-1) m_(i - k) s_i (0)) = product_(k=0)^(t-1) m_(i - k) Delta(0)
$
The key is the uniform distribution that:

$
  angle.l product_(k=0)^(t-1) m_(i-k) angle.r = product_(k=0)^(t-1) angle.l m_(i-k) angle.r = product_(k=0)^(t-1) (-P(m_i = -1) + P(m_i = +1)) = product_(k=0)^(t-1) (1-2 eta) = (1-2 eta)^t
$

Thus, the distribution of $bold(m)$ is actually unimportant, which is cancel out.

$
  Delta(t) = (1-2 eta)^t Delta(0)
$

$
  & Delta^(+) (t) + Delta^(-) (t) = Delta (t) \
  & Delta^(+) (t) - Delta^(-) (t) = N
$

$
  & Delta^+(t) = 1/2(N + Delta(t)) = 1/2 sum_i (1 + s_i (t)) \
  & Delta^+(t) = 1/2 (N + (1-2 eta)^t Delta(0))
$

Which is indeed the original solution. That's more rigorous process demonstrate how we establish the distribution in blurring information, in which we lose initial condition and presume flippers counts only. Following from the probability investigation, we can therefore recover the *true* probability distribution based on the test, because there's no guarantee a uniform distribution for potential flippers distribution.

If we consider the all micro state entropy, it should be fixed that transverse all *priori* uniform distribution. rather, if we consider an *ensemble* of rings in macro state, one has:

$
  H_("micro")("up/down") = ln Omega = ln 2^N = N ln 2 quad "fixed"
$

$
  H("flippers") & = ln (vec(N, M)) = ln ((N!)/(M!(N-M)!)) \
                & ~ N ln N - N - M ln M + M - (N-M) ln (N-M) + (N-M) \
                & ~ - N (M/N ln M/N - (1-M/N) ln (N-M)/N ) \
                & ~ - N (eta ln eta + (1-eta) ln (1-eta)) quad "fixed"
$

$
  H_("macro")("up/down")(t) = - N (p ln p + (1-p)ln(1-p)) quad p(t) = (Delta^+(t))/N
$

It has the maximum in $p = 1/2$ as the convergence results, showing the entropy increasing dynamics based on macro state, reaching the micro state entropy.

Now we can summarize to answer the problem of _Hamilton Dynamics_, why micro determinism will emerge macro uncertainty? It's plausible to say information is a key, first, it's objective but relative, like speed, it's a coarse-graining process to shed underneath initial condition, we have no idea about the concrete position and momentum but a *priori* potential distribution of them, from which, the observation tells us, in a enough time, one should approach the real distribution.

= Ergodicity

A stronger statement is _ergodicity_, it means given all possible phase volume $Tau$, the distribution of phase point in a longer enough time would transverse all possible phase point in $Tau$, in $t -> infinity$:

$
  angle.l rho(mu) angle.r_t & = lim_(T -> infinity) (1/T) integral_0^(T) d mu rho (mu t) \
                            & = integral d mu rho(mu) delta(E - H(mu)) \/ integral d mu delta(E - H(mu)) \
                            & = angle.l rho(mu) angle.r_E
$

Usually, denoted as the hyper-surface as:

$
  D(E) = integral d mu delta(E - H(mu)) = integral_(S_E) d Sigma_E
$

The integral inspection doesn't ensure the stability of the distribution, clearly, we can have a distribution with oscillation in time and with a suitable boundary condition, which make cause equality, but the oscillation property of the distribution won't disappear in time.

$
  f(q,p) = sum_(m,n) hat(f)_(m,n) e^(i m q + i n p) \
  angle.l f(q,p) angle.r_t = hat(f)_(0,0) = angle.l f(q,p) angle.r_E \
$

= Fundamental

For particle $n$ in system with particles $N$ in fixed energy bound that $H in d U$ as a macro state in a possible range or $H = U_0$ if you want, which can be translated to $h_n in d u$, but the latter should be preferred in *thermodynamic limit*, also called *large-number limit*.

$
  P(h_n in d u) = integral_({h_n (omega) in d u|omega in Omega_n}) P(d omega) \
$

$
  Omega (h_n) = integral_({h_n (omega) in d u|omega in Omega_n}) d omega
$

For uniform prior measure: $P(d omega) = (d omega)/(abs(Omega_n)^N)$ \

$
  & I (u) = lim_(n->infinity) -1/n ln P(h_n in d u) = ln abs(Omega_n) - I'(u) \
  & I'(u) = lim_(n->infinity) 1/n ln Omega_n (h_n in d u)
$

That's, given the energy bound as $delta(E-H(mu))$, one has a energy shell that contains the possible states. In a uniform prior measure we can reduce the constant and use the latter $I'(u)$, which called $s(u)$ in classical expression.

$
  &lambda(beta) = lim_(n->infinity) 1/n ln angle.l e^(n beta h_n) angle.r = -lambda'(-beta) - ln abs(Omega_n) \
  &lambda'(beta) = lim_(n->infinity) -1/n ln integral_(Omega_n) e^(-n beta h_n (omega)) d omega = lim_(n->infinity) - 1/n integral_(Omega_n) e^(- beta H (omega)) d omega
$

Where the latter function is the partition function associated with $H(omega)$, is the canonical free energy function, denoted as $lambda'(beta) = phi(beta)$ too with a intended constant reduction and variable transformation.

We have above _Legendre-Fenchel Transformation_ which is the saddle point transformation of _Laplace Transformation_.

$
  & phi(beta) = inf_u (beta u - s(u)) \
  & s(u) = inf_beta (beta u - phi(beta)) \
$

Due to the common notation about negative sign, from $sup -> inf$ is evident. If the whole is differentiable, it should be convex and contains global minimum, else, it contains multiple, or *phase transformation* in such non-differentiable configuration.

Suppose now, given a macro state, the constrained probability measure is given by:

$
  P^M (M_n in d m) = P^M (M_n in d m|h_n in d u) = P(h_n in d u, M_n in d m)/P(h_n in d u)
$

With the constraint entropy based on the macro state, and the energy represented by the macro state:

$
  P^M (M_n in d m) ~ e^(-n I^M (u)) d u \
  I^M (u) = s (u) - s^M (u) quad "if" h(M_n (omega)) = u
$

Where $s^M (u)$ is the entropy of joint probability. Denoting the typical values or equilibrium values(states):

$
  cal(E)^M = {m: I^M (m) = 0} = {m: m "globally maximize" s^M (m)}
$

Which the stable point is $s(u) = sup_m s^M (u,m) "or" sup_{m|h^M(m) = u} s^M (m)$, that can be used to calculate the micro canonical entropy from the knowledge of a macro state entropy #footnote[You already have seen this in Kac Ring model.] as the *fundamental of equilibrium statistical mechanics*.

Macrostate:
$
  L_n (epsilon) = 1/n sum_(i=1)^n delta(epsilon_i - epsilon) \
$
From Sanov's theorem, the large deviation of $L_n$ are ruled by the relative entropy $I^M (mu)$ given the prior uniform measure.

Energy representation and normalization as constraint:
$
  & 1= integral p(epsilon) d epsilon \
  & h^epsilon (p) = integral p(epsilon) epsilon d epsilon
  // &h^epsilon (L_n) = integral d epsilon thin epsilon L_n (epsilon) = 1/n sum_(i=1)^n integral d epsilon delta(epsilon_i - epsilon) =
$

Macrostate entropy:
$
  s^M (p^M) = integral d epsilon thin p^M (epsilon) ln p^M (epsilon)
$

We maximize by Lagrange multiplier:
$
  S{p^M,h^M} = s^M (p^M) + lambda_1 (h^M (p^M) - u) + lambda_2 (integral p^M (epsilon) d epsilon - 1)\
$

$
  p^M (epsilon) = e^(-beta epsilon)/Z(beta) \
  Z(beta) = integral d epsilon thin e^(-beta epsilon) quad (lambda_1 = -beta)
$

Therefore, one has the maximized macro entropy as micro entropy:

$
  s(p) = s^M (p) - ln abs(Omega) = beta epsilon - phi(beta)
$

Where $phi(beta)$ is the free energy.

Reversely, we can control the parameter in the other side of Legendre-Fenchel transformation, which is $beta$. Given the free energy configuration defined previously:

$
  & I^(*M)(m) = s(u) - s^M (u) ~ phi^M (beta) - phi(beta) \
  & cal(E)^(*M) = {m|I^(*M)(m) = 0} = {m|m "is global minimum of" I^(*M)(m)} \
$

Thus you may want to minimize the free energy which is $beta h^M (m) - s^M (m)$. That's:

$
  S^*{p^M, h^M} = beta h^M - s^M - lambda (integral d epsilon p(epsilon) - 1)
$

$
  p^M (epsilon) = e^(- beta epsilon)/(Z(beta)) p(epsilon) \
  I^M (epsilon) = beta u - phi(beta) - s(u) = s^M (u) - s(u) = s^M (u) - ln abs(Omega)
$

#quote(attribution: [The large deviation approach to statistical mechanics -- Hugo Touchette], block: true)[
  ... The class of macrostates for which large deviation principles can be derived in the canonical ensemble is exactly the
  same as in the microcanonical ensemble, since the rate functions of these two ensembles are built from the same energy. representation function and macrostate entropies.
]

The second way is more preferred, which the partition functional is easier to calculated and suitable for deduction of many typical parameters.

$
  Z(beta) = integral d omega thin e^(-beta H(omega)) = integral d omega thin e^(lambda E) delta(H(omega) - E) = integral d omega thin e^(lambda E) D(E) = cal(L)(D(E))
$

$
  P(mu) = 1/Z exp(sum_a lambda_a X^a (mu)) \
  (partial ln Z)/(partial lambda_a) = angle.l X^a (mu) angle.r \
$

$
  S[P(mu)]|_("extreme") & = integral d mu P(mu) log P(mu)|_("extreme") \
                        & = integral d mu P(mu) (lambda H(mu) - log Z) \
                        & = lambda E - log Z \
$
$
  lambda^(-1) log Z = E - lambda^(-1) S[P(mu)]|_("extreme")
  ~> F = lambda^(-1) log Z = E - T S
$

Given a exchange ensemble with particle number $N$ and volume $V$, we has:

$
  P(mu, N) = 1/Z exp(lambda_1 H(mu) + lambda_2 N(mu)) \
  (partial ln Z)/(partial lambda_1) = E \
  (partial ln Z)/(partial lambda_2) = angle.l N(mu) angle.r = N \
$

$
  lambda_1 = lambda_1' "in equalibrium" \
  lambda_2 = lambda_2' "in equalibrium"\
  ~>
  lambda_1/lambda_2 = lambda_1'/lambda_2' \
$

$
  S[P(mu)]|_("extreme") = lambda_1 E + lambda_2 N - log Z \
  lambda_1^(-1)log Z = E + lambda_2 lambda_1^(-1) N - lambda^(-1) S[P(mu)]|_("extreme") ~> G = E - u N - T S
$

$
  (partial lambda_1^(-1) ln Z)/(partial lambda_2\/lambda_1) = N
$

= Selected Example

== Ideal Gas

Given general parameters, we have general exchange system or grand canonical system:
$
  lambda_1^(-1) d log Z = overline(X_a) d (lambda_a lambda_1^(-1)) \
  d log Z^* = overline(X_a) d lambda_a^*
$

$
  H(mu) = 1/(2m) sum_i^(3 N = d N) p_i^2
  = sum_i^(3 N = d N) u_i^2 quad u_i = sqrt(2 m E) p_i
$

$
  D(E, V, N) &= integral 1/(N! (2pi planck.reduce)^d) d^(N d) q d^(N d) p delta(1/(2m) sum_i^(d N) p^2_i - E) \
  &= V^N/N! (sqrt(2 m E)/planck)^(N d) 1/E integral d^M u delta(sum_i^M u_i^2 - 1) quad (M = N d)\/(delta(E x) = E^(-1) delta(x)) \
$

Where we integral on a solid ball with unit radius, thus the radial part integral must be unit. Also, the delta function will be reduced to $delta(sum_i u_i^2 - 1) = delta(bold(u)^2-1) = 1/2 (delta(bold(u) + 1) + delta(bold(u)-1))$ with ball integral $d^M u = bold(u)^(M-1) d bold(u) d italic(Omega)_M$.

$
  D(E,V,N) = V^N/(N!) (sqrt(2m)/planck)^(N d) E^(1/2 N d - 1) 1/2 italic(Omega)_(N d)
$
$
  italic(Omega)_M = (2pi^(M/2))/(Gamma(M/2))
$
$
  Z(T,V,N) & = integral 1/(N! 2 pi planck.reduce^d) d^(N d) q d^(N d) p e^(- beta bold(p_i)^2\/(2m)) \
  & = V^N/N! (integral_(- infinity)^(infinity) (d p)/(2 pi planck.reduce) e^(- beta p^2\/(2m)))^(N d) \
  & = (V^N)/N! (1/planck sqrt((2pi m)/beta))^(N d) ~ (sqrt((m)/(2 pi planck.reduce beta)))^(N d) = (V^N)/(N!) (1/lambda_T)^(N d)
$

$
  italic(Xi)(T, V, mu) = sum_(N=0)^(infinity) e^(beta mu N) Z(T, V, N) = sum_(N=1)^(infinity) 1/N! ((V e^(beta mu))/(lambda_T^d))^N = exp((V e^(beta mu))/lambda_T^d)
$

Now we calculate basic quantity:

$
  log Z^* = overline(X)_a d lambda_a^* \
  beta^(-1) log Z(T,V,N) = beta^(-1) (N log V - N d log lambda_T - log N!)
$

$
  P_c = - (partial log Z^*)/(partial V) = (N beta^(-1))/V = (N k_b T)/V
$

$
  E = - (partial log Z)/(partial beta) = (N d)/2 beta^(-1) = (N d)/2 k_b T
$

The notorious _Maxwell Velocity Distriution_ can also be established by given empirical vector of momentum.

$
  L (bold(p)) = lim_(n->infinity) 1/n sum_(i=1)^n delta(p_i - p) \
$

$
  angle.l L(bold(p)) angle.r = (integral d^d p_1 delta(p_1 - p) e^(- beta p_1^2\/2m))/(integral d^d p_1 e^(- beta p_1^2\/2m))
$

The key here is the probability distribution for each particle is already coded as the thermodynamics limit of them, which are same in limit, that $1/n dot n integral (...) = integral(...)$, second, else factors are same thus are cancelled out. Finally we leaving:

$
  "LHS" = (beta/(2 pi m))^(d/2) e^(- beta p^2\/2m)
$

Sometimes, one will transform the variables to $d^3 p -> p^2 d p d italic(Omega) = 4 pi p^2 d p$ from $bold(p) -> abs(p)$ relation.

== Spins and External Magnetic Field

Use hat to denote the Hamiltonian else is the magnetic field tensity.

$
  sigma("up") = 1, sigma("down") = -1 \
  hat(H) = - mu_0 H sum_(i=1)^N sigma_i \
$

We should transverse all states of $sigma$ for each $i$:

$
  Z = sum_(sigma_1) ... sum_(sigma_N) e^(- beta hat(H)) = sum_(sigma_1) e^(beta mu_0 H sigma_1) ... sum_(sigma_N) e^(beta mu_0 H sigma_N) = product_i^N sum_sigma_i (...) = 2 cosh^N (beta mu_0 H)
$

$
  F(T,H,N) = - beta^(-1) log Z = - N beta^(-1) log (2 cosh (beta mu_0 H)) \
$

$
  M = - (partial F)/(partial H) = N mu_0 tanh beta mu_0 H \
  E = (partial (beta F))/(partial beta) = - N mu_0 H tanh (beta mu_0 H) \
  E = - M H ~ hat(H) = - mu_0 H sum_(i=1)^N sigma_i
$

= Classical

$
  d U = d Q + d W \
$

$
  eta(Q_i,Q_f) = W/Q_i = (Q_i - Q_f)/Q_i = 1 - Q_f/Q_i
$

$
  W(T_i,Q_i;T_f,Q_f) -> W(T_i,Q_i;T_f,Q'_f)
$

$
  W(T_1,Q_1;T_2,Q_2) W(T_2,Q_2;T_3,Q_3) = W(T_1,Q_1;T_3,Q_3)
$

$
  W^(-1) (T_i,Q_i;T_f,Q_f) = W(T_f,Q_f;T_i,Q_i)
$

$
  W^(-1) (T_i,Q_i;T_f,Q_f) W(T_i,Q_i;T_f,Q'_f) = W(T_f, Q_f; T_f, Q'_f)
$

However, if $Q'_f < Q_f$, one create a machine that produces more work from a single source, thus it's impossible a machine could be more stronger than reversible one. Thus, it's better to say that $forall eta, eta <= eta^R$.

If the substance of system works in a certain environment temperature, which is independent of other condition due to heat $Q$ is. Thus measure heat transfer between them is indeed measure the temperature of them.

$
  Q_2/Q_1 = phi(T_1, T_2) -> Q_2/Q_1 = phi(T_3,T_2)/phi(T_3,T_1) -> Q_2/Q_1 = phi(T_2)/phi(T_1) -> Q_2/Q_1 = T_2/T_1
$

Due to arbitrary $T_3$ must be cancelled in function, which we reduce in more tense expression that $T_2\/T_1$ rather $phi(T_2)\/phi(T_1)$. The reverse machine is uniquely determined by $Q_i, T_i, T_f$, one could say $Q_2\/Q_1 = T_2\/T_1$, if not, $Q_2\/Q_1 > T_2\/T_1$. Make it a algebraic variables by denoting $Q > 0$ absorbing, $Q < 0$ exerting. $Q_2\/Q_1 > T_2 \/T_1 -> Q_2\/T_2 + Q_2\/T_1 <= 0$.

$
  integral.cont (d Q)/T <= 0
$

You may say that if $(d Q)/T = S$ for a exact differential. We can say that a reverse machine correspond to such $S$ which $d S >= (d Q)/T$ because a normal machine must with cycle or a part of integral, smaller than reversible one.

$
  &d U = pdv(U,S)_V d S + pdv(U,V)_S d V = T d S - P d V\
  &d H = pdv(H,S)_P d S + pdv(H,P)_S d P = T d S + V d P \
  &d F = pdv(F,T)_V d T + pdv(H,V)_T d V = - S d T - P d V \
  &d G = pdv(G,T)_P d T + pdv(G,P)_T d P = - S d T + V d P
$

A general characteristic function may be the Legendre transformation of arbitrary general work and position.

$
  f = L(U; X_1,...,X_n)
$

Given parameter in $(T,V)$:

$
  d U = T d S - P d V &= T (pdv(S,T)_V d T + pdv(S,V)_T d V) - P d V \
  &= T pdv(S,T)_V d T + (T pdv(S,V)_T - P) d V \
  &= T pdv(P,V)_T d T + (T pdv(P,T)_V - P) d V
$

Given parameter in $(T,P)$

$
  d H = T d S + V d P &= T (pdv(S,T)_V d T + pdv(S,P)_T d P) + V d P \
  &= T pdv(S,T)_V d T + (T pdv(S,P)_T + V) d P \
  &= T pdv(P,V)_T d T + (-T pdv(V,T)_P + V) d P
$

$
  &(d Q)_V = d (U - W)_V = (d U + P d V)_V = (d U)_V \
  &(d Q)_P = d (U - W)_P = (d U + P d V)_P = (d H)_P
$

$
  &C_V = pdv(Q,T)_V =  pdv(U,T)_V = T pdv(S,T)_V \ 
  &C_P = pdv(Q,T)_P = pdv(H,T)_P = T pdv(S,T)_P \
$

$
  C_P - C_V &= pdv(U + P V,T)_P - pdv(U,T)_V 
  quad (pdv(U,T)_P = pdv(U,T)_V + pdv(U,V)_T pdv(V,T)_P) \
  &= (P - pdv(U,V)_T) pdv(V,T)_P quad (pdv(U,V)_T = pdv(U,V)_S + pdv(U,S)_V pdv(S,V)_T) \
  &= - pdv(U,S)_V pdv(S,V)_T pdv(V,T)_P \
  &= T pdv(P,T)_V pdv(V,T)_P
$

Thus we recover everything in integral:

$
  &d U = C_V d T + (T pdv(P,T)_V - P) d V \
  &d S = C_V/T d T + pdv(P,T)_V d V \
$

$
  &d H = C_P d T + (-T pdv(V,T)_P + V) d P \
  &d S = C_P/T d T - pdv(V,T)_P d P
$

Use the expression in $T pdv(S,T)_((dot))$ would be easier.

Denote $C_P/C_V = gamma$, which is a measurement of per unit work compensated by temperature increasing in heat bath. As for ideal gas, it's same as $dv(P V,T) = n R$.

A example of $C_V > 0$ and $pdv(P,V)_T < 0$ to deduce $C_P > 0$ and $pdv(P,V)_S < 0$.
$
  C_P = T pdv(S,T)_P = T (pdv(S,T)_V + pdv(S,V)_T pdv(V,T)_P) = C_V + T pdv(P,T)_V pdv(V,T)_P = C_V - T pdv(P,V)_T pdv(T,V)^(-1)_P pdv(V,T)_P
$

Thus $C_P = C_V + "positive" -> C_P > 0$.

$
  pdv(P,V)_S &= pdv(P,V)_T + pdv(P,T)_V pdv(T,V)_S \ 
  &= pdv(P,V)_T - pdv(P,V)_T pdv(T,S)_V pdv(V,S)^(-1)_T \

  &= pdv(P,V)_T -  T/(C_V) pdv(P,V)_T pdv(P,T)_V
$

We see that $pdv(P,V)_S = pdv(P,V)_T - "positive" -> pdv(P,V)_S < 0$.

$
  C_V (gamma - 1)  = T pdv(P,T)_V pdv(V,T)_P = T (n R)/V (n R)/P = n R \
  C_V = (n R)/(gamma - 1), thick C_P = (gamma n R)/(gamma - 1)
$

$
  f(lambda x_1,...,lambda x_n) = lambda^n f(x_1,...,x_n)
$

$
  f(x_1,...,x_n) = sum_i^n x_i (partial f(x_1,...,x_n))/(partial x_i)
$

$
  U (lambda S,lambda V,lambda N) = lambda U(S,V,N) \
$

$
  U(S,V,N_i) = T S - P V + sum_i^l mu_i N_i
$

It can be generalized to arbitrary variables.

$
  H & = T S + sum_i^l mu_i N_i \
  F & = - P V + sum_i^l mu_i N_i \
  G & = sum_i^l mu_i N_i \
  Omega &= F - sum_i^l mu_i N_i = - P V \
  J & = 0 \
$

Thus:

$
  S d T - V d P + sum_i^l N_i d mu_i = 0
$

Sometimes we will rely on the extensible property of a certain variable to divide every other extension variables to acquire the intension property.

For example:

$
  d mu = - S_m d T + V_m d P
$

We know that $S (V,T) = integral C_V/T d T + pdv(P,T)_V d V$, therefore, fixed the $V$ variable, we integrate $T$ variable:

$
  &integral_(T_0)^T integral_(T_0)^(T') (C_(P,m) (T'',P_0))/T'' d T'' d T' quad (T_0 <= T'' <= T' <= T -> T' in [T'',T]) \
  &= integral_(T_0)^T (integral_(T_'')^T d T') (...) d T'' \
  &= integral_(T_0)^T (T - T'') (...) d T''
$

Which is what we need, if you want, a arbitrary constant could be added because we can never measure a *absolute* potential indeed. For ideal gas, you may expect:

$
  d mu &= -(integral_(T_0)^T C_(P,m)/T'' d T'') d T + (R T)/P d P \
  -> mu &= R T (phi + ln P) quad (R T phi = -integral S_m d T)
$

If we emphasize for multiple components, the special case in ideal gas and independence between components will induce that:

$
  P_i prop N_i -> P_i = x_i P = N_i/N P
$

$
  mu_i = R T (phi_i + ln x_i P)
$

Denote different phase for single component as $(dot)^(alpha\/beta\/gamma...)$, we can divide two phase as two system in contact, therefore share the same intensive attributes:

$
  d S^alpha = d U^alpha 1/T^alpha + d V^alpha P^alpha/T^alpha - d n^alpha mu^alpha/T^alpha
$

$
  d S = d S^alpha + d S^beta = 0 \
$

However, the whole system is closed thus $d (dot)^alpha + d (dot)^beta = 0$ for each correlated attributes. We conclude that they share the same temperature, pressure and chemical potential in reversible phase transition:

$
  T^alpha = T^beta = T, P^alpha = P^beta = P, mu^alpha = mu^beta = mu
$

// $
//   d G = d (G^alpha + G^beta) &= - S d T + V d P + mu (d n^alpha + d n^beta) \
//   &= - S d T + V d P
// $

// It should be clear that the total Gibbs energy won't be zero variation due to the if we follow the curve of phase transition, rather in the fixed temperature and pressure of two phase in contact.

Suppose the extensive Gibbs-Duhem theorem:

$
                      d mu^alpha & = d mu^beta \
  -S^alpha_m d T + V^alpha_m d P & = -S^beta_m d T + V^beta_m d P \
                     (d P)/(d T) & = (S_m^alpha - S_m^beta)/(V^alpha_m - V^beta_m) = L/(T Delta V_m)
$

Which is called Clausius-Clapeyron relation. It's also can be seen that, the total entropy will move along the curve of phase transition:

$
              d S & = lr((partial S)/(partial V_m)|)_T d V_m + lr((partial S)/(partial T)|)_(V_m) d T \
              d S & = lr((partial S)/(partial V_m)|)_T d V_m quad "Fixed temperature" \
              d S & = lr((partial P)/(partial T)|)_(V_m) d V_m quad "Maxwell relation" \
  L/(T Delta V_m) & = (d P)/(d T) quad Delta V = d V_m = V^beta_m - V^alpha_m \
$

In the case where two parameter move in phase transition curve $(P,T)$.

$
  dv(L(P,T),T) = dv(,T) (S^beta - S^alpha)T &= 1/T dv(,T)(S^beta - S^alpha) + (S^beta - S^alpha)\
  &= T (pdv(S^beta,T)_P + pdv(S^beta,P)_T dv(P,T) + (beta <-> alpha)) + L/T \
  &= C^beta_P - C^alpha_P + (pdv(V^beta,T)_P - pdv(V^alpha,T)_P) L/(Delta V)
$

$
  d G & = V d P - S d T \
      & = V d P = 0 \
$

$
  integral_i^f V d P = (P V)|^f_i - integral_i^f P d V = 0
$

$
                  d S = d (S_1 + S_2 + S_A) & = 0 \
  (4 pi r^2 (p_1 - p_2) + 8 pi r sigma) d r & = 0 \
                    p_1 - p_2 + (2 sigma)/r & = 0 \
                          p_1 + (2 sigma)/r & = p_2 -> Delta p = (2 sigma)/r
$

$
        mu_g (p_r, T) & = mu_l (p_("in"),T) \
  mu_g (p_infinity,T) & = mu_l (p_infinity,T) \
           Delta mu_g & = Delta mu_l
$

$
  mu_g (p_r, T) = integral_(p_infinity)^(p_r) V_(m,g) d p + mu_g (p_infinity,T) = integral_(p_infinity)^(p_r) (R T)/p d p + ... = R T ln (p_r/p_infinity) + mu_g (p_infinity,T) \
$

$
  Delta p = p_r - p_infinity approx p_("in") - p_(infinity)
$

$
  mu_l (p_("in"), T) = integral_(p_infinity)^(p_"in") V_(m,l) d p approx V_(m,l) Delta p
$

$
  R T ln (p_r/p_infinity) & = (2 sigma)/r V_(m,l) \
           p_r/p_infinity & = exp((2 sigma V_(m,l))/(R T r))
$

$((partial mu)/(partial p))_T = V_m > 0$, thus increase pressure will increase chemical potential, while in phase transition equilibrium needs to maintain the equality, $mu_l > mu_g$, thus $mu_l -> mu_g$ (or _saturated vapor pressure_) indicates the vaporize itself, so maintains the mechanical equilibrium will break the chemical potential equilibrium. If the temperature keeps cool down while the condensation nucleus is few thus the expected phase transition doesn't happen, we expect $mu_g arrow.b$ or $p > p_"vapor" = p_infinity$, which is the expect inequality, plus, if it's also smaller than the $p_r$, we still can't maintain mechanical equilibrium thus droplet nucleus tends to vaporize. Until the point where the enough huge liquid bubble emergent to meet such mechanical equilibrium, therefore growing and whole gas is liquefied. In real life, due to dust or polarized molecules, the $r_c$ is great enough and $p_r$ is smaller enough nearly equal to $p_infinity$, when we reach the liquefaction point, the gas is immediately liquefied.

For Vanderwaals gas, the deflection in lower volume is the key of phase transition. But such deflection only exist in lower temperature too, denoted as $T_c$ the critical temperature. So, for $T < T_c$, we can describe the phase transition of the gas, the problem is how can deflection expressing the coexistence of liquid and gas?

$
  T_l = T_g \
  P_l = P_g \
  mu_l (T,P) = mu_g (T,P)
$

Thus the specified $P$ must be special that satisfying certain condition that the phase transition occurs. 

$
  d mu = - S_m d T + V_m d P = V_m d P quad "fixed temperature" \
  d (mu_l - mu_g) = integral.cont_(V_g -> V_l) V_m d P = 0
$

The deflection of $P-V$ graph shows that for a given temperature, we can integrate along the curve while the difference must be *zero* where the start and end point have the same pressure. We transform the variable to solve reversely:

$
  integral_(V_g)^(V_l) V_m (P) d P &= lr(P V_m)|_(V_g)^(V_l) - integral_(V_g)^(V_l) P(V_m) d V_m quad (P(V_g) = P(V_l) = P_"eq")\
  &= integral_(V_g)^(V_l) (P(V_m) - P_"eq") d V_m = 0
$

Where we can deduce $P_"eq"$ by integration following the graph.

For ideal gas/liquid, one have:

$
  d mu_i (T,P) = - S_m d T + V_m d P -> mu_i (T,P) = g_i (T,P) + R T ln P_i quad (P_i = x_i P)
$

We absorb the scalar into $g_i$ as:

$
  mu_i = g_i (T,P) + R T ln x_i
$

Thus we see that if $x_i = 1$, single component will have $mu = g_i (T,P)$. One therefore reduce that the difference of $G(T,P) = n_i mu_i$:

$
  &Delta G = sum_i^n R T n_i ln x_i \
  &Delta V = sum_i pdv(Delta G, P)_(n_i,T, P) = 0 \
  &Delta S = - sum_i pdv(Delta G,T)_(n_i,P) = -sum_i^n R n_i ln x_i \
  &Delta H = Delta G + T Delta S = 0 \
  &Delta U = Delta H - P Delta V = 0
$

We see that due to thermo equilibrium and pressure equilibrium, only Gibbs energy changes. Suppose the solvent can be evaporated solely, thus in chemical potential equilibrium.

$
  g' = g + R T ln (1-x)
$

Where $x$ is the partition ratio of solute, $g'$ is the chemical potential of solvent in gas. Differentiate that:
$
  pdv(g',P)_T d P + pdv(g',T)_P d T &= pdv(g,P)_T d P + pdv(g,T)_P d T - (R T)/(1-x) d x + R ln(1-x) d T \
  V_g d P - S_g d T &= V_l d P - S_l d T - (R T)/(1-x) d x + R ln (1-x) d T \
  (V_g - V_l) d P - (S_g - S_l + R ln(1-x)) d T &= -(R T)/(1-x) d x \
$

$
  S_g - S_l + R ln (1-x) = ((g' + T S_g) - (g + T S_l))/T = (H_g - H_l)/T
$

Suppose $d T = 0$ or fixed temperature:

$
  pdv(P,x)_(T) &= (R T)/(V_g - V_l) 1/(1-x)\
  &= P/(1-x) quad (V_g >> V_l "with ideal gas model") \
  &-> p_x = p_0 (1-x) quad (x = 0 -> p_x = p_0)
$

Suppose $d P = 0$ or fixed pressure:

$
  (H_g - H_l)/T d T &= (R T)/(1-x) d x \
  pdv(T,x)_P &= (R T^2)/(L(1-x)) quad (H_g - H_l = L)\
$

If $x << 1$, or dilute solution:

$
  Delta T = (R T^2)/L x
$

However, we could achieve this by semi-permable membrane. Like sugar solution while only water can cross the membrane, we can create a pressure difference while maintaining the chemical potential equilibrium. Thus $p_x - p_0$ is the difference between sugar solution and pure water.

$
  g' = g(T,P) = g(T,P_0) + R T ln(1-x) \
  V_(l,m) (p-p_0) = R T ln (1-x) approx -R T x \
  p - p_0 = (R T)/V_(l,m) x = (R T)/V_(l,m) n_2/(n_1 + n_2) approx (R T)/V_(l,m) n_2/n_1 = (n_2 R T)/V_l
$

Notice, previous is in same pressure which can be identified as saturated vapor pressure; while this is in different pressure proportional to the amount of sugar substance.








