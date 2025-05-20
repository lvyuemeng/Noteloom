#import "@preview/theorion:0.3.3": *
#import "../lib.typ":*

#show: mine.with(title: [Differential Geometry])

#show: show-theorion

#set heading(numbering: "1.1")
#set par(
  first-line-indent: (
    amount: 1em,
    all: true,
  ),
)

#let cdot = $circle.small$
#let inpro(l:none, r:none) = {
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

= Vector Fields on manifold

== Manifold is enough

#definition[
  A *Riemannian metric* on a manifold $M$ is the assignment to each point p in $M$ of a inner product $#inpro()_p$ on a tangent space $T_p M$.
  A *Riemannian manifold* is a manifold equipped with such metric.
]

Define a Riemannian metric on a piece of $M$ is always possible due to locally assemble to $bb(R)^n$. If we want to define globally, we need to tackle overlap. For example a point $p$, overlapped by multiple $U_alpha$, will cause a multiple intersection by multiple functions such that $sum_alpha f_alpha (p) #inpro(l:"-",r:"-")$. That's indicating, we may want, first the sum is finite for convergence and smooth; second the $sum_alpha f_alpha (p) = 1$ for equal weight. Rather strictly, we don't want boundary point be devil for us, for example infinite open intersection may be accumulated in a limit point even every inner points converges, also we want the boundary be smoothly going to zero. We thus define *supp($f$)* be the closure of $f$ whih $f(p) != 0$.

Then for a collection of atlas, or open set ${S_alpha}$, is locally finite if every point has a neighborhood $U_p$ in each $S_alpha$ only intersects only finitely many of the subset $S_alpha$.

A partition of unity is subordinate to ${U_alpha}$:

#set enum(numbering: "(i)")

+ supp$rho_alpha subset U_alpha$ for all $alpha$
+ the collections ${"supp" rho_alpha}$ is locally finite.
+ $sum_alpha rho_alpha (p) = 1$

Notice that we don't define $"supp"(rho_alpha) subset.eq U_alpha$ due the boundary limit point undefined behavoir. We only define metric on open set.

Rather a theorem lengthy tells us that existence of partition is in masonry. So every manifold can have a Riemannian metric to become a Riemannian manifold.

== Arc length

We could parametrize a arc be unit of parameter.

For example a $c(t)$, define $t = t(s)$, we get $gamma(s) = c(t(s))$. Further, we define $||c'(t)|| = (d s)/(d t)$ which means $s$ is just length unit. 

$
  ||gamma'(s)|| = ||c'(t(s))|||t'(s)| = (d s)/(d t) |(d t)/(d s)| = 1 \
  "length" = integral_a^t ||gamma'(s)|| d s = t  - a 
$

Choose $a = 0$, we get unit parametrization. Which means we can always use $[0,l]$ as the parameter.

== Directional Derivatives

$cal(X)(bb(R)^n)$