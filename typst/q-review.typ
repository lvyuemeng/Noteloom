#import "lib.typ": *
#import "@preview/physica:0.9.5": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node


#show: mine.with(
  title: "Review of Quantum",
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

#let lie(body) = $frak(body)$
#let vf(body) = $bold(upright(body))$

=

==

$g in G$, given a action of group on a general space $M$ equipped with function on it as $F(M)$. Thus we can apply $g$ on $M$ and lift upon $F(M)$ as well, i.e. $phi(g) dot x$ for $x in M$ and $rho(g) dot f$ for $f in F(M)$ as a $G$-equivariant map.

$
  #diagram($x edge(f, ->) edge("d", phi(g), ->) & f(x) edge("d", rho(g), ->)\
  phi(g) dot x edge(f, ->) & rho(g) dot f(x) \/ f(phi(g) dot x)$)
$

Is commutative, i.e.

$
  rho(g) dot (rho(h) dot f) (x) = rho(h) dot f (phi(g) dot x) = f (phi(h) dot (phi(g) dot x)) = f( phi(h) compose phi(g) dot x)
$

Is a anti-homomorphism, i.e. Such representation should be only with $g$ element, thus a canonical choice is $g^(-1)$ where below is given as a reduced notation:

$
  g dot f(x) = f (g^(-1) dot x) \
$

---

$V = W plus.circle W' -> v = w + w'$, where the projection $q(v) = w$. Define $overline(q): v -> 1/(abs(G)) sum_(g in G) rho(g) q(rho(g^(-1))v)$ which we drop $rho$ representation notation.

$
  overline(q)(w) = 1/(abs(G)) sum_(g in G) g q(g^(-1) w) = 1/(abs(G)) sum_(g in G) g (g^(-1) w) = w \
$

$
  h overline(q)(v) = 1/(abs(G)) sum_(g in G) h g q(g^(-1) h^(-1) h v) = 1/(abs(G)) sum_(g' in G) g' q(g'^(-1) h v) = overline(q)(h v) \
$

If $v in "Ker"(overline(q)), h in G$ then $h overline(q)(v) = 0 = overline(q)(h v)$ that $h v in "Ker"(overline(q))$ that we decompose by a $G$-invariant morphism based on solely vector space projection $q$.

// TODO!
How can we define a $G$-invariant operation on $V$? We should *always* remember that $g$ act transitively on $G$ itself that if $g G = G$. Then if we can put all elements of $G$ on the operation, then it should be $G$-invariant. By the way, we can define the module of $G$-invariance which is $R G = sum_(g_i in G) r_i g_i quad r_i in R, g_i in G$. The way is to average the operation by group action for all elements. Thus one has:

$
  h f(v_1, ..., v_n) & = 1/(abs(G)) sum_(g in G) h g f(g^(-1) h^(-1) h v_1, ..., g^(-1) h^(-1) h v_n) \
                     & = 1/(abs(G)) sum_(g' in G) g' f(g'^(-1) h v_1, ..., g'^(-1) h v_n) = f(h v_1, ..., h v_n) \
$

$
  f(h v_1, ..., h v_n) &= 1/(abs(G)) sum_(g in G) g f(g^(-1) h v_1,..., g^(-1) h v_n) \ &= 1/(abs(G)) sum_(h^(-1) g in G) h^(-1) g f((h^(-1) g)^(-1) v_1, ...,(h^(-1) g)^(-1) v_n) = f(v_1,...,v_n)\
$



==

$
  vf(F)(q,p) = vec(F_q (q,p), F_p (q,p)) = vec(partial_q F(q,p), partial_p F (q,p))\
$

$
  d H = H_q d q + H_p d p = - dv(p, t) d q + dv(q, t) d p \
$

$
  dv(, t) = dv(q, t) partial_q + dv(p, t) partial_p = H_p partial_q - H_q partial_p := {dot,H} := X_H
$

That's, Hamiltonian defines the evolution of the system.
$
  dv(F(q,p), t) = X_H F(q,p) = {F(q,p),H} \
$

$
  X_H (p thin d q) = dot(p) d q + p d dot(q) & = dot(p) d q - dot(q) d p + d (p dot(q)) \
                                             & = - H_q d q + H_p d p + d (p dot(q)) = d (-H + p dot(q)) := d L(q, dot(q))
$

$
  {F,H} = X_H F = - X_F H \
$

Where the $X_F = pdv(F, p) partial_q - pdv(F, q) partial_p$.

Generally, one scalar function defined upon sympletic manifold can induce a vector field on it, with a general area preservation:

$
  omega = d q and d p \
  iota_(X_F) (omega) = iota_(pdv(F, q) partial_p - pdv(F, p) partial_q) (d q and d p) = pdv(F, q) d q + pdv(F, p) d p = d F \
$

$
  iota_(X_H) iota_(X_F) (omega) = iota_(X_H) (d F) = X_H F = {F,H} = dv(F, t)
$

We thus induce a symmetric bilinear form:

$
  omega(X_F, X_G) = iota_(X_F) iota_(X_G) (omega) = iota_(X_F) (d G) = X_F G = {G,F} = - {F,G} \
$

One can lift the Hamiltonian in exponential flow by dynamics of $X_H$.

$
  dv(, t) F(exp(t X_H)) bar_(t=0) = {F(p,q), H(p,q)}
$

One thus can define lie group dynamics too just like above:

$
  L in #lie[g] -> X_L \
  X_L F(p,q) = dv(, t) F(e^(t L) dot (p,q)) \
$

However, due to the representation of any group should be a anti-homomorphism, we have:

$
  L dot F(p,q) = dv(, t) F(e^(-t L) dot (p,q)) = - X_L F(p,q)\
$

Now we can try translation group $T = bb(R)^3$ first:

$
  a dot (q,p) = (q + a, p) quad a in T <-> e^(-t lambda) in T thick lambda in #lie[t]\
$
Here we *abuse* of notation because the lie algebra of translation induced by lie group is trivial.
$
  a dot F(p,q) = dv(, t) F(e^(- t lambda) dot (p,q)) bar_(t=0) = dv(, t) F(q-t a,p) bar_(t=0) = -a pdv(, q) F = - X_a F
$

$
  X_a = a pdv(, q) \
$

We know that $iota_(X_F) (omega)$ is a closed form that it corresponds to a certain function $F$ up to a constant, we can induce the scalar function of action by the lie group.

$
  X_a (omega) = a p -> mu_a (p) = mu_a (p,q)
$

We thus recover the momentum operator which configures the momentum for each translation element $a$. Such closed form check lift a function defined in the manifold which shared the same role as Hamiltonian, if $H$ is $G$-invariant, then $mu_a$ is a conserved quantity, as the Hamiltonian version of Noether's theorem.

$
  iota_(X_H) (d mu_L) = {mu_L,H} = dv(mu_L, t) = - {H,mu_L} = -iota_(X_L) (d H) = - X_L H = 0 \
$

==

$
  [phi.alt(X), phi.alt(Y)] = phi.alt([X,Y]) = phi.alt(X) phi.alt(Y) - (-1)^(sigma(X) sigma(Y)) phi.alt(Y) phi.alt(X) \
$

$
  Omega (J v_1, J v_2) = Omega(v_1, v_2) -> J in "Sp"(2n, bb(R))
$

$
  A^T A = I -> A in "O"(n, bb(R)) \
  A^T Omega A = Omega -> A in "Sp"(2n, bb(R)) \
  A^T Omega A = A^T A Omega -> A^T (Omega A - A Omega) = 0 -> Omega A = A Omega \
  Omega(A v, A w) = g(A Omega v, A w) = g(Omega A v, A w) = Omega(v, w) \
  A in "O"(n, bb(R)) inter "Sp"(2n, bb(R)) = "U"(n) \
$

$
  z_j = 1/sqrt(2) (q_j + i p_j), quad overline(z_j) = 1/sqrt(2) (q_j - i p_j) \
$

$
  L_1 = Q_2 P_3 - Q_3 P_2, quad L_2 = Q_3 P_1 - Q_1 P_3, quad L_3 = Q_1 P_2 - Q_2 P_1 \
  Gamma(L_1) = a_3^(dagger) a_2 - a_2^(dagger) a_3, quad Gamma(L_2) = a_1^(dagger) a_3 - a_3^(dagger) a_1, quad Gamma(L_3) = a_2^(dagger) a_1 - a_1^(dagger) a_2 \
$

$
  & F(theta) = c_0 + c_1 theta + c_2 theta^2 + ... + c_n theta^n = c_0 + c_1 theta \
  & pdv(F, theta) = c_1 \
  & F(theta_1,...,theta_n) = F_A + theta_j F_B quad exists F_A, F_B in and.big (bb(R)^n) \
  & pdv(F G, theta_j) = pdv(F, theta_j) G + (-1)^(sigma(F)) F pdv(G, theta_j) quad sigma(F) #[is the degree of] F \
$

Given a translation invariance property of integral:

$
  integral f(theta + eta) d theta = integral f(theta) d theta \
$

$
  integral (theta + eta) d theta = integral theta d theta + eta integral d theta = integral theta d theta -> integral d theta = 0\
$

Given with normalization convention:

$
  integral theta d theta = 1 -> integral c_0 + c_1 theta d theta = c_1 -> integral f(theta) d theta = dv(f, theta)\
$

Thus for multi-variables calculus, one should be careful on applying order of partial derivative:

$
  integral f(theta_1,...,theta_n) d theta_n ... d theta_1 = pdv(, theta_1) ... pdv(, theta_n) f\
$
Where swap of order of partial derivative will induce a minus sign.

$
  [theta_j, theta_k]_+ = plus.minus delta_(j k) \
  dv(, t) theta_j (t) = [theta_j (t),H]_+
$

Given $H$:

$
  B = mat(0, B_(12), B_(13), ..., B_(1n); -B_(12), 0, B_(23), ..., B_(2n); -B_(13), -B_(23), 0, ..., B_(3n); ...; -B_(1n), -B_(2n), -B_(3n), ..., 0) \
  H = 1/2 sum_(j,k=1)^n B_(j k) theta_j theta_k \
$

$
  dv(, t) theta_j (t) = [theta_j (t),H]_+ = -[H,theta_j (t)]_+ = sum_(k=1)^n B_(j k) theta_k (t) \
$
The minus sign of commutator is due to $B_(j k) = - B_(k j)$. Which is highly similar to the bosonic case in evolution.

$
  Omega^+(J v_1, J v_2) = Omega^+ (v_1, v_2) -> J in "SO"(2n, bb(R))
$

$
  U_A = sum_(j k) a^(dagger)_j A_(j k) a_k \
  [U_A, a_j]_(plus.minus) = plus.minus sum_k A_(j k) a_k = plus.minus A bold(a)\
  [U_A, a^(dagger)_j]_(plus.minus) = sum_k a^(dagger)_k A_(k j) = A^T bold(a)^(dagger)\
$

$
  v times.circle w = 1/2 (v times.circle w - u times.circle v) + 1/2 (v times.circle w + w times.circle v) = v and w + g(v,w)
$

Thus given a basis omit tensor notation, for example:

$
  e_i e_j = e_i and e_j quad (i != j)
$

Or physics notation:

$
  bold(v) = (v_1,...,v_n) in bb(R)^n -> gamma(bold(v)) = cancel(bold(v)) = v_1 gamma_1 + ... + v_n gamma_n \
$

$
  v' = v - 2 (g(v,w))/(g(w,w)) w = cancel(v) - (cancel(v) cancel(w) - cancel(w) cancel(v))/(g(w,w)) cancel(w) \ = - (cancel(w) cancel(v) cancel(w))/(g(w,w))
$

$
  2 A B = [A,B]_plus + [A,B]_minus \
  2 B A = [A,B]_plus - [A,B]_minus \
$

Thus we can always decompose a product term into symmetric and antisymmetric parts.

$
  A B C = 1/2 A [B,C]_plus + 1/2 A [B,C]_minus = 1/2 [A,B]_plus C - 1/2 [A,C]_plus B + 1/2 [A,B]_minus C - 1/2 [A,C]_minus B \
$

$
  [A B, C]_minus = A B C - C A B & = A (1/2 [B,C]_plus + 1/2 [B,C]_minus) - (1/2 [A,C]_plus - 1/2 [A,C]_minus) B \
                                 & = 1/2 (A [B,C]_plus - [A,C]_plus B) + 1/2 (A [B,C]_minus + [A,C]_minus B) \
$

$
  [A B, C]_plus = A B C + C A B & = A (1/2 [B,C]_plus + 1/2 [B,C]_minus) + (1/2 [A,C]_plus - 1/2 [A,C]_minus) B \
                                & = 1/2 (A [B,C]_plus - [A,C]_minus B) + 1/2 (A [B,C]_minus + [A,C]_plus B) \
$

Equal below:

$
  [A B, C]_minus = A [B,C]_minus + [A,C]_minus B = A [B,C]_plus - [A,C]_plus B \
$

$
  [A B, C]_plus = A [B,C]_plus + [A,C]_minus B = A [B,C]_minus - [A,C]_plus B \
$


$
  [A B, C D]_minus & = A [B, C D]_minus + [A, C D]_minus B \
                   & = A ( [B,C]_plus D - C[B,D]_plus) + ([A,C]_plus D - C[A,D]_plus) B \
                   & = A [B,C]_plus D - A C [B,D]_plus + [A,C]_plus D B - C [A,D]_plus B \
$

For Clifford algebra, symmetric part is given by metric, anti-symmetric part is given by wedge product.
$
  & tensor(M, -mu, -nu) = gamma_mu and gamma_nu \
  & tensor(M, -mu, -nu) = gamma_mu gamma_nu - tensor(g, -mu, -nu) \
$
$
  tensor(M, -mu, -nu) and gamma_rho = gamma_mu gamma_nu and gamma_rho = gamma_mu g_(nu rho) - gamma_nu g_(mu rho)
$
$
  tensor(M, -mu, -nu) and tensor(M, -rho, -sigma) = gamma_mu gamma_nu and gamma_rho gamma_sigma = gamma_mu gamma_sigma g_(v rho) - gamma_mu gamma_rho g_(nu sigma) + gamma_nu gamma_rho g_(mu sigma) - gamma_nu gamma_sigma g_(mu rho)
$
Is same as above, however, I didn't found this is useful : (.

==

$
  L/[L,L] #[is abelian that] forall a,b in L, [a,b] = 0
$

Thus given a central series:

$
  [L^n, L^n] = L^(n+1) -> L^n/[L^n,L^n] = L^n/L^(n+1)
$
Factor through, for all possible elements, otherwise $[L, L] = L$ is irreducible. Thus induce a maximal nilpotent ideal of $L$ which is the maximal solvable ideal of $L$, else it must be a *semi-simple* structure without additional smaller space. Where nilpotent is a structure that can be shared with a basis with commutative eigenvectors, that's $X Y v = Y X v + [X, Y]v = lambda(X) Y v + lambda ([X,Y]) v$ where $[X,Y]$ in some smaller space by deduction of nilpotent ideal.

However, it doesn't mean that *semi-simple* structure contains no ideal. We try to diagonalize as much as possible even we can't achieve for all like solvable case. That's $#lie[t] subset #lie[g]$ which all elements are commutative. We call such maximal commutative subalgebra as *Cartan subalgebra*, which can be diagonalized simultaneously. Thus if one choose a vector space it acts on, we can decompose the space into eigen-space for all:

$
  V = plus.circle.big_(lambda(#lie[t])) V_lambda quad V_lambda = {v in V | forall H in #lie[t], H v = lambda(H) v} \
$

Given a adjoin representation or homomorphism as $X_i -> D_(X_i)$, we can then apply the Cartan subalgebra to decompose the lie algebra itself:

$
  #lie[g] = plus.circle.big_(alpha(#lie[t])) #lie[g] _alpha quad #lie[g] _alpha = {X in #lie[g] | forall H in #lie[t], [H,X] = D_(H) (X) = alpha(H) X} \
$
Which is called *root space decomposition*, where $alpha in #lie[t]^*$ is the eigenvalue on $#lie[t]$.

We often see the ladder operator in physics that a state shared by all other raising and lowering operators, which is the eigenvector of Cartan subalgebra.

$
  D_t ([X,Y]) = [t, [X,Y]] = [[t,X],Y] + [X,[t,Y]] = (alpha + beta)(t) [X,Y] -> [#lie[g]_alpha,#lie[g]_beta] subset.eq #lie[g]_(alpha+beta)\
$

Plus, we know if the ladder operator act too many times, it will reach zero, that's $D_(X)$ is nilpotent for $X in #lie[g]_(alpha), alpha != 0$, or we simply call it nilpotent that $#lie[g]_(beta+ n alpha) = 0$. Another thing is, for clarity, $#lie[g]_0$ means $[#lie[t],#lie[g]_0] = 0 dot #lie[g]_0 = 0$ thus $#lie[t] subset #lie[g]_0$, however, due to maximality, we have $#lie[g]_0 = #lie[t]$.

$
  [#lie[g]_alpha,#lie[g]_(-alpha)] subset.eq #lie[g]_0 = #lie[t] \ 
$


Given a basis ${X_1,...,X_n}$ with structure constants:

$
  [X_i ,X_j] = sum_k tensor(c, -i, -j, +k) X_k \
$

Given the commutation relation, one has:
$
  tensor(c, -i, -j, +k) = - tensor(c, -j, -i, +k) \
  tensor(c, -i, -j, +k) + tensor(c, -j, -k, +i) + tensor(c, -k, -i, +j) = 0 \
$

Moreover, we can define the representation based on the structure constants:

$
  & (T_i)_(j k) = (D_(X_i))_(j k) = tensor(c, -i, -j, +k) \
  & D_(X_i): #lie[g] -> "ad"(#lie[g])
$

$
  D_(X_i) X_j = [X_i, X_j] = sum_k tensor(c, -i, -j, +k) X_k \
$

$
  [D_(X_i), D_(X_j)] = D_([X_i, X_j]) \
  [D_(X_i), D_(X_j)] X_k = D_([X_i, X_j]) X_k \
  [X_i [X_j X_k]] - [X_j [X_i X_k]] = [[X_i, X_j] X_k] \
$

Which adjoin representation with *homomorphism consistency* should restrict all lie algebras to contain Jacobi identity.

$
  [D_(X_i), D_(X_j)]_(k l) = sum_m (tensor(c, -i, -j, +m) tensor(c, -m, -k, +l) - tensor(c, -j, -i, +m) tensor(c, -m, -k, +l)) = sum_m tensor(c, -i, -j, +m) tensor(c, -m, -k, +l) \
$

===

$#lie[su(2)] = {X in #lie[gl] (2,bb(C)) | overline(X)^t + X = 0, "Tr"(X) = 0}$ and $#lie[so(3)]$ are all real lie algebras of dimension 3.

(a) The basis:

$
  xi_1 = 1/2mat(0, i; i, 0), quad xi_2 = 1/2mat(0, -1; 1, 0), quad xi_3 = 1/2mat(i, 0; 0, -i)
$

With $[xi_k, xi_l] = epsilon_(k l m) xi_m$.

$
  xi^2 = xi_1^2 + xi_2^2 + xi_3^2 \
$
$
  [xi^2, xi_k] = 0
$

We construct a commute element which the maximal diagonalized state is #ket($b,m$).

$
  xi^2 #ket($b,m$) = b #ket($b,m$) \
  xi_3 #ket($b,m$) = m #ket($b,m$) \
$

$
  xi^+ = xi_1 + i xi_2, quad xi^- = xi_1 - i xi_2 \
$
$
  [xi_3, xi^+] = xi^+, quad [xi_3, xi^-] = - xi^- \
$
$
  [xi^+, xi^-] = 2 xi_3 \
$

$
  xi_3 xi^(plus.minus) #ket($b,m$) = [xi_3, xi^(plus.minus)] #ket($b,m$) + xi^(plus.minus) xi_3 #ket($b,m$) = (m plus.minus 1) xi^(plus.minus) #ket($b,m$) \
$

Thus we conclude that $xi^(plus.minus) #ket($b,m$) = C #ket($b,m plus.minus 1$), quad C in bb(C)$, and $xi_3 #ket($b,m plus.minus 1$) = (m plus.minus 1) #ket($b,m plus.minus 1$)$.

We call such operators ladder operators or raising and lowering operators.

$
  xi^+ #ket($b,j$) = 0 quad exists j in thick?
$

$
  xi^minus xi^+ = (xi_1 - i xi_2)(xi_1 + i xi_2) = xi_1^2 + xi_2^2 + i[xi_1, xi_2] = xi^2 - xi_3^2 + xi_3 \
$

$
  0 = xi^- xi^+ #ket($b,j$) = (b - j^2 + j) #ket($b,j$) -> b = j(j+1)\
$

Same for $xi^+ xi^-$, one has $b - j'^2 + j' = 0$

$
  b = j'(j' - 1) = - j' (-j' + 1) \
  -> j' = -j \
$
We conclude that for $m$ can be $-j, -j+1, ..., j-1, j$, thus $2j in bb(N)$ is a integer for finite dimension.

$
  & j = 0, quad m = 0, quad j(j+1) = 0 \
  & j = 1/2, quad m = 1/2, -1/2, quad j(j+1) = 3/4 \
  & j = 1, quad m = 1,0,-1, quad j(j+1) = 2 \
  & ...
$

From the definition of $xi^+ = xi^-^dagger$ by its expansion, we have such normalization factor:

$
  #braket($b,m$, $xi^+^dagger xi^+$, $b,m$) & = #braket($b,m$, $xi^- xi^+$, $b,m$) \
                                            & = #braket($b,m$, $xi^2 - xi^2_3 - xi_3$, $b,m$) \
                                            & = b - m^2 -m = j(j+1) -m^2 -m = C^2 \
$

$
  C = sqrt(j(j+1) - m(m+1)) \
$

Same, one has for $xi^-$ that $tilde(C) = sqrt(j(j+1) - m(m-1))$.

==




