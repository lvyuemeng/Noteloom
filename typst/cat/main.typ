#import "@preview/commute:0.3.0":node, arr, commutative-diagram,
#import "@preview/theorion:0.3.3": *
#import "../conf.typ": mine

#show: mine.with(
  title: [Cat-Hom],
)

#show: show-theorion

#set heading(numbering: "1.1")
#set par(
  first-line-indent: (
    amount: 1em,
    all: true,
  ),
)

// #align(center)[#commutative-diagram(
//   node((0, 0), $X$),
//   node((0, 1), $Y$),
//   node((1, 0), $X \/ "ker"(f)$, "quot"),
//   arr($X$, $Y$, $f$),
//   arr((0,1), "quot", $tilde(f)$, label-pos: right, "dashed", "inj"),
//   arr($X$,(1,0), $pi$),
// )]

How to make a general topological basic element? We now that 1-dim would be $(x)$, 2-dim would be $(x,y)$ etc... But there aren't bounded! If we want to make a bounded element. For example, a point, we restrict $x = c$ as a constant. How about 2-dim? We could let $a x + b y = c$, oh! Still unbounded! Let $x > 0 quad y=0$, everything works. Why we don't make a point as nothing? Like $(0)$ and make a line as $(x) $ with $0 < x < 1$? Actually, that's still a reasonable definition.

#definition[
  The geometric n-dimensional *simplex* is the topological space: \
  #align(center)[$triangle^n = {(x_0,...x_n) in bb(R)^(n+1): sum_(i=0)^n x_i = 1 quad x_i >=0}$]
]

We omit coefficients because those are flexible for topology.

We denote $sigma = (e_0, ... , e_n)$ as a instance of simplex, with 

$
C_n (x) = plus.circle.big_(sigma_i in X \ dim(sigma_i)=n)ZZ sigma_i
$

Now we want to get the differential of the simplex, which is its *boundary*. Suppose we trace a simplex from point $e_1$ to $e_n$, we know that a small hyper-surface is its all but omit certain $e_n$. For example $(e_1,e_2,e_3)$, omit $e_1$, we get $(e_2,e_3)$ which is a boundary line.

Naively, we could think of that $d_n$ as a differential of n-dim simplex would be 

$
d_n: C_n -> C_(n-1), sigma_i -> sum_(k=0)^n sigma_i^(text("omit kth" e_k))
$

However, the bounded simplex has direction in boundary, same as previous example, if we omit $e_2$, $(e_1,e_3)$ isn't the correct direction. The correct direction in number-wise would be $(e_1,e_2),(e_2,e_3),(e_3,e_1)$, so if the whole number permutation in right direction, the left part points sequence will be counted as final part rather initial part. The omitted point will cause a $(-1)^k$ to give a correct answer.

Apply twice first by k then by l:

$
  d_n circle.small d_(n-1) = sum_(k=0)^(n) sum_(l=0)^(n-1) (-1)^(k+l) sigma_i^(text("omit k,lth")) = sum_(k>l)^(...) (-1)^(k+l) sigma_i^(text("omit k,lth"))+ sum_(k<l)^(...) (-1)^(k+l-1) sigma_i^(text("omit l,kth")) = 0
$

The 3rd step is because if k $<$ l, first omit kth will results lth index becomes (l-1)th. Then each sum is symmetric, we get zero in end. It's like a discrete style of total derivative, which is also zero due to symmetry of partial derivative.

However, could a topological space be decomposed by these minimal element? Actually, Partial thing is. Could the result be independent of triangulation? Yes as a lengthy theorem.



