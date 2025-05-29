#import "lib.typ": *


#show: mine.with(
  title: "am-hamilton",
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

$
  delta S = integral d t (delta p_i dot(q)_i + p_i delta dot(q)_i - (partial H) / (partial p_i) delta p_i - (partial H) / (partial q_i) delta q_i) \
$
Read that:
$
  dot(q_i) = (partial H) / (partial p_i) quad dot(p_i) = -(partial H) / (partial q_i)
$

Then we evaluate actions:
$
  D q = delta q + dot(q) delta t \
$
$
  (d W)/(d t) = Q &= (partial L) / (partial q_i) delta q_i + L delta t \
  &= (partial L) / (partial q_i)D q + (L - (partial L) / (partial q_i) dot(q)_i) delta t \
$

Thus we get that:
$
	(d W)/(d t) = (partial L)/(partial q_i) dot(q)_i - H = L \
	(partial W)/(partial t) = -H
$
Insert into Hamiltonian:
$
	cal(H) = (partial W)/(partial t) - H(q, (partial W)/(partial q_i), t) = 0 \
  (partial cal(H))/(partial Q) = dot(P) = 0 \
  (partial cal(H))/(partial P) = -dot(Q) = 0\
$
The last two equation is due to that $cal(H) = 0$.

#let ptl = $partial$
So:
$
  {q_i,p_i}_(Q_i,P_i) := (partial q_i)/(partial Q_i)(partial p_i)/(partial P_i) - (partial q_i)/(partial P_i)(partial p_i)/(partial Q_i) := 1
$
The last is due to independence of coordinates.

Thus we choose $W(q_i (Q,P),t;P_i,Q_i)$ with constant $P_i$ and $Q_i$.
$
  &(partial q_i)/(partial Q_i)((partial^2 W)/(partial P_i  partial q_i) + (partial^2 W)/(partial q^2)(partial q)/(partial P_i)) - (partial q_i)/(partial P_i)((partial^2 W)/(partial q_i partial Q_i) + (partial^2 W)/(partial q^2)(partial q)/(partial Q_i)) \ &= (partial q_i)/(partial Q_i)(partial)/(partial q_i)(partial W)/(partial P_i) - (partial q_i)/(partial P_i)(partial)/(partial q_i)(partial W)/(partial Q_i) := 1
$

A selection tells us that $(ptl W)/(ptl P_i) = 1/2Q_i$ and $(ptl W)/(ptl Q_i) = -1/2 P_i$. Much like $cal(H)$ with factor $1/2$. However, It's fuzzy for solving original equation because they are all constants. But how do we know which is the new constant momentum or position? Actually, we select constant in separation.

Suppose constant energy $E = H = -(ptl W)/(partial t)$. 
$
  (partial W)/(partial E) = 1/2 Q_i \
  (partial W)/(partial Q_i) = -1/2 E \ 
$
Thus we immediately know that $Q_i = 2t$.

However, it would be tiring to select $P_i$ or $Q_i$. Rather we only know one each constants by separation in solving. For example, we know a group constant $alpha$, in a bunch of functions $W_i (q,P?,Q?) = f(q,alpha)$. We can simply use the first or second based on what we know without bothering the other, which are symmetric.

Thus we can simply choose $(ptl W)/(ptl P_i) = Q_i$ or $(ptl W)/(ptl Q_i) = -P_i$. While discarding dependency on the other.

This gives us that $(partial W)/(partial P_i) = Q_i$.

Suppose we can separate for $q_i$:
$
  W(q_i,t;P_i) = sum_i W_i (q_i;P) + W_t (t;P) \
$

If there's energy conservation:
$
  (ptl W)/(ptl t) = (ptl W_t)/(ptl t) = -E \
$
We simply set $W_t = -E t$ because extra constants can be omitted.
$
  W(q_i,t;P_i) = sum_i W_i (q_i;P) - E t \
  E = H(q, (ptl W)/(ptl q_i),t)
$
Is the separation. We exploit that separation is to choose $W_i (q_i;P)$ with solely $q_i$.

Take a further step, if there's only explicit $p_i$ in $H$, we know that separation can factor solely constant related to $p_i = P_i = (ptl W)/(ptl q_i)$. Thus take $W_i (q_i;P_i) = P_i q_i = p_i q_i$ is constant.