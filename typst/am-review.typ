#import "lib.typ": *


#show: mine.with(
  title: "Review of Classical Mechanics",
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

#let inpro(l: none, r: none) = {
  let l = if l == none {
    h(0.5em)
  } else {
    l
  }

  let r = if r == none {
    h(0.5em)
  } else {
    r
  }

  $angle.l #l , #r angle.r$
}

= Coordinates

Classical mechanics is for a given coordinates $(q_1,...,q_n)$, and a single parameter $t$, given a insertion with $(q_1 (t),...,q_n (t))$ for $phi.alt: [0,1] -> M$ to describe mass points.

We introduce few usual coordinates:
$
  (x,y,z) \
  (x = r cos theta, y = r sin theta, z = z) \
  (r = r sin theta cos phi, y = r sin theta sin phi, z = r cos theta)
$

Then we can describe a unit vector field on such coordinates transformation.
$
  (partial ) / (partial r_i) = (partial x_j (r_1,...,r_n) := partial f(x_j)) / (partial r_i)(partial) / (partial x_j)
$

We take inner product in standard metric of $x,y,z$, Euclidean metric, to acquire a metric of given field. For example, in spherical coordinates:

$
  g_(i j) = inpro(l: partial_i, r: partial_j) \
  g_(i j)d x^i d x^j = d r^2 + r^2 d theta^2 + r^2 sin theta^2 d phi^2
$

Then given a distance action variation, we seek minimal:
$
  delta S = delta integral d t g_(i j) d x^i d x^j \
  dot.double(r) - r dot(theta)^2 - r sin theta^2 dot(phi)^2 = 0 \
  (d r^2 dot(theta)^2) / (d t) - r^2 sin theta cos theta dot(phi)^2 = 0 \
  (d r^2 sin theta^2 dot(phi)) / (d t) = 0
$

Take $sin theta = 1$, we give the plane motion too.

We can also understand it as a parametrization by $t$ for each direction that:
$
  v^i partial_i = (partial x_i) / (partial t) partial_i \
$

Normalize to:
$
  v^i e_i = v^r e_r + v^theta e_theta + v^phi e_phi \
  (D (v^i e_i)) / (d t) = ...
$
We differentiate by decompose it as Euclidean vector field first, and then summarize.

Natural coordinates must be given in a explicit coordinates to identify, for example, if we given a distance like $d = R theta = R t$, it can be a direct path or circle too.

Given a unit vector, decompose to field along $v$ and perpendicular, is actually a insertion of single parameter $phi.alt: [0,1] -> bb(R)^3$
$
  v^i e_i = v tau = (partial s) / (partial t) tau
$
Where $tau$ is parallel with $v$.
$
  inpro(l: tau, r: tau) = 1 \
  inpro(l: (D tau) / (d t), r: tau) + (tau <-> (D tau) / (d t)) = 0
$
Given a unit vector $n = (D tau) / (d t) (1) / (|(D tau) / (d t)|$.

Actually, there's a parametrization difference on $s$ or $t$, indeed we can let $s$ be time itself, but currently we choose:

$
  (D tau) / (d s) (d s) / (d t) = kappa v n \
  a_n = v (kappa) v = v^2 kappa \
  kappa = 1 / rho \
$

We take cross product:
$
  v tau times (tau dot.double(v) + v^2 kappa n) = v^3 kappa b
$
So $kappa = 1 / rho = |upright(v) times upright(a)|$.

== Variable Mass

Suppose a rope or chain falling from a hole in a frictionless, smooth horizontal table, let $y$ be the lower end respect to the table top of falling chain.

Such problem can be formulated by a additional metric called inertia metric carrying along coordinates. $inpro(l: dot(q), r: dot(q))_M(q)$.

Where $dot(q)$ is unrelated to $q$.
$
  inpro(l: dot(q), r: dot(q))_M(q) =1 / 2 integral rho(q) dot(q)^2 d q \
  = 1 / 2 dot(q)^2 integral rho(q) d q \
  U(q) = integral U_rho(q) d q \
$

For rocket, we has a general force upon $Q = (d m) / (d t) u$ which is momentum flux. However, the subtle reason comes from a weird fact that we shift a dependent term to another independent term.

$
  m_1 dot(v)_1 + m_2 dot(v)_2 + dot(m_1) v_1 + dot(m_2) v_2 = F_("ext") \
  dot(m_1) + dot(m_2) = 0
$

Now, separate that $m_2 dot(v)_2 = F_("ext" 2)$ giving us the original equation. But that means a shift of momentum flux. Original case would be $m_2 dot(v)_2 + dot(m_2) v_2 = F_("ext" 2)$. So it's undetermined and we prescribe such ideal condition so.

The chain above is $M = rho y$, thus giving us $T = 1 / 2 (rho y) dot(y)^2$:

$
  L = 1 / 2 rho y dot(y)^2 - integral rho g y d y = (...) - rho g y^2 / 2 \
  rho(dot(y)^2 + y dot.double(y)) - (1 / 2 rho dot(y)^2 + rho g y) = 0 \
  y dot.double(y) + 1 / 2 dot(y)^2 - g y = 0 \
  dot.double(y) = 0 -> dot(y)^2 = 2 g y \
$
Is the equation of motion in stable case.

If it falls on ground, we has $f = rho s g + rho (d y) / (d t) (v) = rho s g + rho v^2$ where $s$ is the part already fallen on ground.

= Rotation

Suppose a variation of speed on $"SO"(3)$,resulting a additional $v' <- v + omega times r$ for coordinates $x,y,z$.

$
  (v + omega times r)^2 = v^2 + 2 v dot (omega times r) + (omega times r)^2 \
  delta S -> dot(v) + (dot(omega) times r) + (omega times v) - (- (omega times v) - omega times (omega times r)) \
  = dot(v) + (dot(omega) times r) + 2(omega times v) + omega times (omega times r) = dot(v)'
$

$
  dot(v) tilde -2 (omega times v)
$
Monsoon, due to season transformation:

In summer, continent are heated by sun and ocean warms slowly so is relatively cool, then pressure gradient is from ocean to continent, which is the trade wind, which in southern hemisphere, will be deflected by Coriolis force to the right. Forming the southwest monsoon.

In winter, everything reverse, that continent is cooler relatively and ocean is warmer. Then forming the northeast monsoon.

- The Intertropical Convergence Zone: near the equator, air heats up, creating low pressure.

- High Pressure Zone of Subtropical Belt: located near the latitude of 30 Degrees North and south, high-altitude air deposition sinking, forming a high pressure.

- Low Pressure Zone of Subpolar Belt: located near 60 degrees north and south latitude, the prevailing westerly and polar easterly encounter, air rise, forming a low pressure.

- High Pressure Zone of Polar: located near the north and south poles, the air sinks due to cold, forming high pressure.

== Rotation on Earth

Now we exploit effect of centrifugal acceleration:
$
  g_("eff") = g - omega times ( omega times r)
$

In earth surface, we has $r approx R$. We exploit that:
$
  |omega times (omega times r)| = | omega (omega dot r) - omega^2 r| = |-omega^2_(perp) r| = omega^2 r sin theta
$

$
  g^(parallel)_("eff") = g - omega^2 R sin^2 theta \
  g^(perp)_("eff") = omega^2 R sin theta cos theta \
  alpha approx tan alpha = (g^(parallel)_("eff")) / (g^(perp)_("eff")) = ...
$
Which is small that $theta = 45 degree -> alpha = 0.0088degree$.

Thus for Coriolis force:
$
  a' = g_("eff") - 2 omega times v' \
  upright(omega) = omega cos lambda upright(j') + omega sin lambda upright(k') \
  g_("eff") = - g upright(k') \
  2 upright(omega) times upright(v') = 2((omega dot(z) cos lambda - omega dot(y) sin lambda) upright(i') + (omega dot(x) sin lambda) upright(j') - (omega dot(x) cos lambda)upright(k')) \
$
Suppose the zero order of $omega$:
$
  dot.double(y) = - 2 omega dot(x) sin lambda approx 0 \
  dot.double(z) = - g + 2 omega dot(x) cos lambda approx -g \
  dot.double(x) = - 2 omega(dot(z) cos lambda - dot(y) sin lambda) approx -2 omega dot(z) cos lambda \
  x = 1 / 3 omega g t^3 cos lambda
$
Is the free fall effect($z = h, dot(z) = 0$), point to the east in right hand direction from angular velocity.

Otherwise a initial speed with $dot(z) = v_0$ giving us:
$
  x = 1 / 3 omega g t^3 cos lambda - omega v_0 t^2 cos lambda \
  v = (2 v_0) / g \
  x = (8 / 3 - 4)(...) = -4 / 3 omega v_0^3 / g^2
$
Which is negative, due to the velocity surrounding in earth can't catch velocity in its corresponding altitude. Indeed, we see if we throw a ball, fall down to ground, it has no deflection because up and down cancelled out.

Another thing is about weather system. For a fluid of gas, equation can be formulated as:
$
  rho upright(a) = - nabla P - rho(2 omega times upright(v) - omega times (omega times r)) \
$

Assuming balance of $upright(a) approx 0$:
$
  plus.minus v^2 / r = 1 / rho nabla P - 2 v omega sin lambda
$
The key is the high pressure in outward or low pressure inward.
$
  v = plus.minus ( - r omega sin lambda + sqrt((r omega sin lambda)^2 plus.minus (r / rho) nabla P) ) \
$
So if it's minus, is a high pressure system and weak pressure gradient.

Another final useful problem is, a dancer can draws her arms to change inertia and cause a different angular frequency. But what's the force cause this?

In comoving system of dancer, we have:
$
  m dot(v) = m dot(omega) r = - 2 m omega times dot(r) \
  dot(omega) = - 2 omega dot(r) / r \
  dot(p_theta) = (d) / (d t)(m r^2 dot(omega)) = m r^2 dot(dot(omega)) + 2 m r dot(r) dot(omega) \
$
Plugin in:
$
  dot(p_theta) = 0
$
That's constant indeed in rotation system. But its energy increases due to the change of inertia to against the centrifugal force:
$
  E_("rot") = (p_theta)^2 / (2 I)
$

== Problem Sheet

A common falsification is to differentiate $v$ in rotation coordinates in answer.

For a rotating wheel at peek and bottom:
$
  v = 2 v_0 hat(i) -> v_0 hat(i) + v_0 hat(i') \
  (d v) / (d t) = 2 v_0 omega hat(j) = 2 v_0^2 / r hat(j) quad (#text[Wrong!]) \
  a = omega times (omega times O P) = - omega hat(k) times (- omega hat(k) times (r cos theta hat(i) + r sin theta hat(j))) \
  ~ - (v_0^2 / r) hat(j)
$

At bottom:
$
  v = 0 -> v = v_0 hat(i) - v_0 hat(i') \
  (d v) / (d t) = ??? \
$
Which is wrong if we take derivative against already "valued" vector, you see the second term is where original deduction of acceleration comes in to derive centrifugal force, rather a "valued" zero in the results. Because we usually set $O'$ coincide with $O$ in every instant time to ease our burden.

- A cone with height $h$ and point angle $2 alpha$, no-slipping scroll on a surface, calculate the acceleration of the peak of underside.

In the base of underside, is the instant center.
$
  omega_1 h cos^(-1) alpha + omega_2 h tan alpha = 0 \
  omega_1 = - omega_2 sin alpha \
  omega_1 = omega_1 upright(k) \
  omega_2 = -omega_1 sin^(-1) alpha (cos alpha upright(i') + sin alpha upright(k)) \
  omega = omega_1 + omega_2 = - omega_1 cot alpha upright(i')
$
In the peak of underside:
$
  v &= (omega_1 + omega_2) times r_A = - omega_1 cot alpha upright(i') times (h cos alpha^(-1)(cos 2 alpha upright(i') + sin 2 alpha upright(k'))) \
  &= omega_1 sin^(-1) alpha h sin 2alpha upright(j') \
  &= omega_1 h 2 cos alpha upright(j') \
$
Now, $r_A$ is $r_A_(O'')$:
$
  a &= (d omega) / (d t) times r_A + omega times (omega times r_A) \
$
Here the handling is to separate:
$
  d(omega_1 + omega_2) / (d t) ~ d(omega_1_O + omega_2_O') / (d t) \
  = ((d) / (d t))_O (omega_2_O') + omega_1 times omega_2 = omega_1 times omega_2
$
$
  a &= (omega_1 times omega_2) times r_A + omega times (omega times r_A)
$

So the key is to separate coordinates for each:
$
  ((d) / (d t))_O omega_(O'') &= ((d) / (d t))_O' omega_(O'') + omega_1 times omega_O'' \
  &= ((d) / (d t))_(O'') omega_(O'') + omega_2 times omega_O'' + omega_1 times omega_(O'')
$
Usually we set $O = O'$ in instant time to ease burden.

- Estimating the relationship between Gyro rotation and precession.

$
  tau = r times F = (d sin phi hat(r) + d cos phi hat(k)) times (m g - hat(k)) = m g d sin phi hat(theta) \
$

For a large, and nearly constant $omega_s$ as self-spin.
$
  L_("spin") = - I_("cm")(omega_s sin phi hat(r) + omega_s cos phi hat(k)) \
  (d) / (d t) L_("spin") = - I_("cm") omega_s sin phi omega_z hat(theta) \
  (d) / (d t)(theta) = omega_z \
$

$
  m g d sin phi hat(theta) = - I_("cm") omega_s sin phi omega_z hat(theta) \
  omega_z = - (d m g) / (I_"cm" omega_s)
$
When we see that gyro nearly topple over, it process faster with greater leaning angle.


= Lagrange and Hamilton

== Hamilton Jacobi

$
  delta S = integral d t (delta p_i dot(q)_i + p_i delta dot(q)_i - (partial H) / (partial p_i) delta p_i - (partial H) / (partial q_i) delta q_i) \
$
Read that:
$
  dot(q_i) = (partial H) / (partial p_i) quad dot(p_i) = -(partial H) / (partial q_i)
$

Suppose action called $W(q,t) = S[q,dot(q),tau]|^t = integral^t d tau L(q,dot(q),tau)$

First way is to quote $delta Q$.
$
  d q = delta q + dot(q) delta t\
  delta Q = delta W = p delta q + L delta t \
  delta W = p d q + (L - p dot(q)) delta t \
$
or:
$
  integral^t delta L d tau + L delta t \
  integral^t ((partial L) / (partial q) - (d) / (d tau)(partial L) / (partial dot(q))) delta q d tau + [(partial L) / (partial dot(q))delta q]^t
$
Note we are in the actual path, thus integral term is zero.
$
  delta W = p delta q + L delta t
$
same results.

Plugin back as $delta -> d$ for variation on the variable itself for actual path giving us:
$
  (d W) / (d t) = (partial W) / (partial q_i) dot(q)_i - (partial W) / (partial t) = L \
  (partial W) / (partial t) = -H \
  (partial W) / (partial q_i) = p_i
$

Now $W(q,t) = W(q(t),t)$ after integral of upper bound. So we doesn't differentiate respect to $tau$, rather to $t$ itself at end point.

Insert into Hamiltonian:
$
  cal(H) = (partial W) / (partial t) + H(q, (partial W) / (partial q_i), t) = 0 \
  (partial cal(H)) / (partial Q) = dot(P) = 0 \
  (partial cal(H)) / (partial P) = -dot(Q) = 0\
$
The last two equation is due to that $cal(H) = 0$.

#let ptl = $partial$
So:
$
  {q_i,p_i}_(Q_i,P_i) := (partial q_i) / (partial Q_i)(partial p_i) / (partial P_i) - (partial q_i) / (partial P_i)(partial p_i) / (partial Q_i) := 1
$
The last is due to independence of coordinates.

Thus we choose $W(q_i (Q,P),t;P_i,Q_i)$ with constant $P_i$ and $Q_i$.
$
  &(partial q_i) / (partial Q_i)((partial^2 W) / (partial P_i partial q_i) + (partial^2 W) / (partial q^2)(partial q) / (partial P_i)) - (partial q_i) / (partial P_i)((partial^2 W) / (partial q_i partial Q_i) + (partial^2 W) / (partial q^2)(partial q) / (partial Q_i)) \ &= (partial q_i) / (partial Q_i)(partial) / (partial q_i)(partial W) / (partial P_i) - (partial q_i) / (partial P_i)(partial) / (partial q_i)(partial W) / (partial Q_i) := 1
$

A selection tells us that $(ptl W) / (ptl P_i) = 1 / 2Q_i$ and $(ptl W) / (ptl Q_i) = -1 / 2 P_i$. Much like $cal(H)$ with factor $1 / 2$. However, It's fuzzy for solving original equation because they are all constants. But how do we know which is the new constant momentum or position? Actually, we select constant in separation, indeed, they are must be $Q_i (q_i, p_i, t)$ etc.

Suppose constant energy $E = H = -(ptl W) / (partial t)$.
$
  (partial W) / (partial E) = 1 / 2 Q_i \
  (partial W) / (partial Q_i) = -1 / 2 E \
$
Thus we immediately know that $Q_i = 2t$.

However, it would be tiring to select $P_i$ or $Q_i$. Rather we only know one each constants by separation in solving. For example, we know a group constant $alpha$, in a bunch of functions $W_i (q,P?,Q?) = f(q,alpha)$. We can simply use the first or second based on what we know without bothering the other, which are symmetric.

Thus we can simply choose $(ptl W) / (ptl P_i) = Q_i$ or $(ptl W) / (ptl Q_i) = -P_i$. While discarding dependency on the other.

This gives us that $(partial W) / (partial P_i) = Q_i$.

Suppose we can separate for $q_i$:
$
  W(q_i,t;P_i) = sum_i W_i (q_i;P) + W_t (t;P) \
$

If there's energy conservation:
$
  (ptl W) / (ptl t) = (ptl W_t) / (ptl t) = -E \
$
We simply set $W_t = -E t$ because extra constants can be omitted.
$
  W(q_i,t;P_i) = sum_i W_i (q_i;P) - E t \
  E = H(q, (ptl W) / (ptl q_i),t)
$
Is the separation. We exploit that separation is to choose $W_i (q_i;P)$ with solely $q_i$.

Take a further step, if there's only explicit $p_i$ in $H$, we know that separation can factor solely constant related to $p_i = P_i = (ptl W) / (ptl q_i)$. Thus take $W_i (q_i;P_i) = P_i q_i = p_i q_i$ is constant.

== Problem Sheet

- A bowl with a rod leaning on the edge, with one side out of bowl, the length inside is $c$, prove its whole length.

Take $O$ as the center of bowl with a down $y$ axis.
$
  m g delta y_c = 0 \
  y_c = (2 r cos theta - l / 2) cos theta \
  2 r cos theta = c \
$

$
  delta y_c = (-2 r sin^2 theta + (2r cos theta - l / 2) cos theta) delta theta = 0 \
  l = 2(-2r sin^2 theta + 2r cos^2 theta) / (cos theta) \
  l = 4 r (c^2 / 4r^2 - (1 - c^2 / 4r^2)) / (c / 2r) = 4(c^2-2r^2) / c
$

- Two same even and smooth ball tied on the fixed point $O$ with two rope, and hold on a same weight ball on two of them, seek relation of $alpha$ as middle down axis with rope and $beta$ as the center connection of the held ball and another ball with the down axis.

$
  m g sum_i^3 delta y_i = 0 \
  y_1 = y_2 = l cos alpha, y_3 = l cos alpha - 2r cos beta \
  2 r sin beta = l sin alpha \
  2 r cos beta delta beta = l cos alpha delta alpha \
$

$
  (-3 l sin alpha delta alpha + 2 r sin beta delta beta) = 0 \
  -3 delta alpha + delta beta = 0 \
$

$
  (-3 l sin alpha + l tan beta cos alpha) delta alpha = 0 \
  tan beta = 3 tan alpha
$

Notice $-3 delta alpha + delta beta = 0 != 3 alpha = beta$. Because there relation is $delta alpha = F(alpha,beta) delta beta$ rather a single variable relation. We can only say that $F(alpha,beta) = (l cos alpha)/(2 r cos beta) = 3$ in equilibrium rather a integral for arbitrary displacement.

It's more like implicit function, for example:
$
  x^2 + y^2 = R^2 \
  d y = - x/y d x \
$
$
  #text[if we know $d y = 3 d x$] \
  - x/y = 3 \
  - x = 3 y != y = 3 x != d y = 3 d x\
$
Indeed here.