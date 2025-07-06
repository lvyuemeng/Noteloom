#import "lib.typ": *

#show: mine.with(
  title: "Math Physics",
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

#let hyperreal = $attach(bb(R),tl:*)$
#let tlstar(content) = $attach(content,tl:*)$

= Number System

The evolution of cognition of mathematics stem from *natural number*. What's the natural number? It describe a infinite process starts from a base. The base is *empty*. The negation of everything denoted as $nothing$. From a primitive view, the higher process includes the lower process which suggests that $? -> S(?)$ is a inclusion morphism. Such view is *ordinal* view. A child will imagine things in ordinal view, 3 apples is 1 apples more on 2 apples, etc. That's, inclusion process, a ordered structure. Such inclusion indicates that $?$ as a ordinal is a subset of its successor.

We can safely process $emptyset$ in mind, as a subset of a larger set. $S(emptyset) = {emptyset}$. The successor must be a larger set contains both empty and successor of empty, a well-inclusion process suggests ${emptyset, {emptyset}} = S({emptyset})$. Arabs number system spread as our todays number system. However we immediately found that such inclusion process itself is a number system. $S(*) -> S(S(*))$, it said, object is nothing but its relation, and base isn't such important, because select any number as base is reasonable. Such process generally and widely used in mathematics.

$S(b) = b + 1$ is not a equation but a interpretation which we translate function notation to Arabs number notation. But that's much more than this. First, we have no $+$, second, $1$ is a instance, but we haven't expanded such structure that $1$ is special to any others as such notation.

From $0$ to $1$, We has such equivalence that $(+ 1) -> S(*)$. Because a larger set of a set is a inclusion of elements of the set and the set itself, and the empty set as *nothing*, we acquire 1 as a instance. However, from morphism view, we see $0 = emptyset ~ id_(0\/emptyset)$, and $1 ~ S(id_0(*)) = S dot id_0 = S(*)$. Emphasis again, the instance is nothing but its relations, natural number as instance is actually the intepretation of infinite process.

That's, $(+1) ~ S(*)$. Arabians already knows addition which is multiple inclusion process. That's $S -> S dot S -> S dot S dot S(*) -> ...$ We thus immediately acquire addition as infinite process of such inclusion process itself.

So $(+n) ~ overbrace(S dot S..., n "times")$ gives us the operation. The commutativity is trivial because we apply the same induction process as $S$, there's no permutation at all. It's useful to use our infinite process again, it giving us multiplication as multiple inclusion of $(+n) -> (+n)(+n)(*) -> ...$. Usually, Arabians use $a n$ to denote $a$ times addtition of $n$. But it implicate a vagueness in addition and multiplication process priority. So in such number system, we should use bracket or restrict a multiplication priority:

$
	n x + b != n(x + b)
$

Where we fix $x$ as applied element. The distribution property is a corollary of commutativity of $+$.

$
	n (a + b) &= overbrace((a+b)+(a+b)+...,n "times") = overbrace(a+b+a+b+...,n "times") \
	&= overbrace(a+a+...,n "times") + overbrace(b+b+...,n "times") = n a + n b
$

We remove bracket is because there's no operation priority for $+$ as a repeated operation, we can place $+$ to anywhere with a element beside of it.

Now, we have a simpler way to deduce commutativity.

$
	n a (*) = n (overbrace(1 + 1 + ..., a "times")) (*) = overbrace(n+n+..., a "times") (*) = a n (*)
$

Finally, the relation of multiplication and successor:

$
	S(n)(*) = (n+1)(*) = n(*) + (*)
$

We apply induction process again to deduce power, $(* n) -> (* n)(* n) -> ... ~ n^(x)$ for $x$ times induction. We has the distribution, commutativity, and relation to addition(lower second order) in power too, with its multiplication as element:

$
	(a b)^x = overbrace((a b)(a b)..., x "times") = a^x b^x \
	(n^x)^y = (overbrace(n..., x "times"))^y = overbrace(n^y..., x "times") = (n^y)^x \
	(n)^(x + y) = overbrace(n..., x + y "times") = overbrace(n..., x "times")  overbrace(n..., y "times") = n^x n^y
$

You see that the operation commutativity and distribution is based on the lower order but not all order. You can apply it to addition too.

Now, what if we deduce again? $(n)^n -> ((n)^n)^n -> (((n)^n)^n)^n -> ... ~ overbrace(n^n^n^..., x "times") = a arrow.t arrow.t b$ where we has a thing much like power. Such induction process called *Hyperoperation*.

We need to acquire a inverse operation of such system. This is, the extension of number system. Suppose addition first, $a + x = b$. If such reverse operation is always defined, we should has $x = (a+)^(-1) (b)$ to give a pleasant result. The partial order indicates a violation if $a > b$. Where there shouldn't exist a number in successor logic. But if it's defined, the new number is coming out as a extension of original number system. We test that:

$
	x = (a +)^(-1) (0) = (a +)^(-1)(id_0) = (a +)^(-1) \
	(a +)^(-1) (a +) x = x \
	(a +)^(-1) (a +) = 0 \
$

If it's applicable, and indeed so, called negative number corresponding to positive number. $bb(N) -> bb(Z)$ as the answer. But what's there order? It should be a reverse successor that, if original is greater, this should be smaller to retains the correct order. That's, $S^(-1) (a) < a$, $S^(-1)(0) < 0$. Now, there's no lower bound.

We try multiplication too, $a x = b$ is also in such corner. Define $x = (a *)^(-1) b$ reveals a huger number system. The reverse operation should has the same property as the original to maintain consistency. Test that:

$
	(a *)^(-1) (b) + (a *)^(-1)(c) = (a*)^(-1)(b + c) \
$
$
	(a *)^(-1) b + (c *)^(-1) d &= (a *)^(-1)(c *) (c *)^(-1) b + .... \
	&= (a *)^(-1)(c *)^(-1)(b c + a d)
$

Such extension is $bb(Z) -> bb(Q)$, integer to rational number. It shows that given a rational number the order is determined by $b c - a d$. Where $ 0 < (n *)^(-1) 1 < 1$ is a results.

We summarize current cardinality where $abs(bb(Q)) = abs(bb(Z) times bb(Z)^*)$ Where we remove $0$, but reasonably, there could be a ${plus.minus infinity}$ as a additional number, but it will break the order. We can check any infinity has same order. But negative infinity is lower than any number, positive infinity is higher than any number, forming a circle order. 
#footnote[It's undefined and rather prohibited as we usually learned, but limit haven't been "created" now.]

Now we proceed on power, or exponential. Because it's not commutative now. Such astonishing consequence derived from the canonical morphism that $n -> S^n$. $S^m S^n ~ S^n S^m$. But such distribution failed in exponential for $S$ that $S(n) m != S(m n)$ as we already shown in multiplication non-commutativity with successor.

Such problem immediately cause a infinite sequence which we call *polynomial*.

$
  sum_(bb(Q)) a_sigma x^sigma = 0
$
Where we use $sigma$ as a general notation of infinite iteration on all possible number of $bb(Q)$. We can, thus deduce that the new number system must be $product_abs(bb(Q)) bb(Q)$. However, $bb(Q)$ as a product, can be drawn as a grid and iterate in anyway to fill it. Which states that $f(n) -> bb(Q)$ is injective and surjective, for example $m/n <-> 2^m 3^n in bb(N)$. Thus $product_abs(bb(Q)) bb(Q) = product_abs(bb(N)) bb(Q)$. Which is a infinite sequence. How we express such system? The structure should inherit from $bb(Q)$, we can define it element-wise that each element endure the regulation of order of $bb(Q)$. But it doe not induce a native order like its base number system. That's, we need to induce a morphism into a order set or canonical number system to construct closeness.

Such infinite sequence can be expressed in many ways. galois extension states such extension as a vector space s.t. $Q[sqrt(2), sqrt(3), i, pi ...]$ #footnote[It should be clarified that the extension of all finite polynomial is called algebraic number $bb(A)$, which is a subfield of $bb(C)$. If you consider a infinite polynomial, for example $sin(x) = sum_i a_i x^i$, we can get $pi$ from $sin(x) = 0$, absolutely not in $bb(A)$.], or well known 10 digit expression s.t. $(...,0,1,2,3,...) <-> ...0.123...$ etc. The new number system is larger than we expected, as $abs(bb(N))^abs(bb(N))$, higher than $|bb(N)|$.



We apply induction of finite sequence with element of $bb(Q)$, the new number system must be a infinite sequence with a *nearness* no matter how we express it. Such process we call it *limit*. $lim_(n -> infinity)$ express the higher cardinality level as $lim_(n->infinity) (...,q_n) -> r$. Or, you can express it in anyway you want, for example, notorious $0.9999... = 1$ is the same logic here, also $lim_(n->infinity) q_n = r$ for rational $q_n$. The latter is *Cauchy Sequence* common in analysis. All above follows a order in $bb(Q)$ to construct $bb(R)$.

A additional structure should be established. A usual procedure to reach a real number by infinitesimal is that, $lim_(n->infinity) (r - q_n) = 0$, where $r - q_n < epsilon$, $forall epsilon$ $exists n > N in bb(N)$. This is a standard analysis that $epsilon$ is a residual number exist in Real which can be arbitrary small. Presume for most of elements in sequence they are *same*. The two real numbers should be infinitesimally close, construct a equality. Such sequence procedure with a *nearness*, notates as $tlstar(bb(Q)) tilde.equiv bb(R)$ could be a intermediate procedure during extension. We can apply it to every that $bb(N)^abs(bb(N))$ to construct $tlstar(bb(N))$ etc, with same cardinality as $bb(R)$.
#footnote[
	Such construction is called *hyper*, which is a nonstandard extension. The tedious comes from a order field embedding and the equivalence proposition of $bb(R)$ and $hyperreal$
]

In order to create such *nearness*(or convergence), suggest a filter on infinite elements in canonical order#footnote[Indeed if we use digit expression, we should compare the higher digit first. The filter on sequence should be restricted to the canonical order to avoid prohibited expression of sequence.], against finite, the case for $tlstar(bb(R))$ as a intermediate number system could be constructed. Ultra filter said that we can select collections of subsets of $bb(N)$, where its infinite, so it contains $bb(N)$, but also a consistent selection for intersections or superset other than finite sets. Thus every sequence could be compared through a equivalence class of such filter ensured by axiom choice although the conrete form is unknown.
#footnote[
	Even sequence like $(1,2,3,1,2,3,...)$ is not a canonical number in $bb(R)$, it could be assigned a determined order in $hyperreal$. Notably, we only compare the number in $bb(R)$, that's why it's not standard.
]

Thus for positive sequence that smaller than any number of $bb(R)^(>0)$, gives a infinitesimal(hypersmall) class $[epsilon]$, for positive sequence that greater than any number of $bb(R)^(>0)$, gives a infinite(hyperlarge) class $[infinity]$. 

Now, we try to formalize continuity as a attempt. $forall delta in hyperreal, delta ~ [epsilon] tilde.equiv 0: tlstar(f)(c+delta) - f(c) tilde.equiv 0$, also the monotone boundary sequence has limit as $exists N ~ [infinity] in tlstar(bb(N))$
#footnote[Where we give the same sequence procedure on $bb(N)$, in which $[infinity] ~ [1,2,3,...]$ could be a instance of such equivalence class.]
, $forall n in N$ $s_N >= s_n$ is a element of upper bound, we also know it's a element of sequence, which suggest it's a least upper bound element, as $s_N = lim_(n->infinity) s_n$ in standard analysis.

The final problem here is that the number system can be inductively constructed higher than $bb(R)$? Currently, I don't know such operation as extension can be proceed further. But the cardinality, suggest a map from $bb(R)$ to $bb(R)$, which is $abs(bb(R))^(abs(bb(R)))$. That's where function(s) comes in.

= Function Space

In function, we can consider each real number in source as the ordinal of sequence $bb(N)$, and each element in the sequence as domain. Thus natively, we inherit the property of every operation in number like addition, multiplication, exponential etc. $(f + g)(x), f(x)g(x), f(x)^g(x) ...$. A structure has a basic additional *completion*(Or induction process completion if you want) is called *vector space*#footnote[I choose such because a mathematical structure must stem from canonical number system, multiplication could be derived as a induction of addition therefore construct a endomorphism as $v+v+v... ~ n v $, $n in bb(Z)$ and contrive a extension if we could.]. It's usual, even it's not trivial to define a ultra filter to measure how close between functions.

But wait here, such system seems, if acquire a total order by ultra filter, losing too much as we already seen in $bb(R)$. Where function space becomes a monotone space by a specific ultra filter. But if a ultra filter restrict too much, a less strict design should be considered. First we could define limit as usual.

The introduction of Lebesgue integral is highly resemble to filter#footnote[Rather ultra filter because for example, $[0,0.5]$ is a set where itself or its complement either is measurable, which doesn't satisfy *in or not* property of ultra filter.] where we need a basic order topology which usually contains all interval of $bb(R)$ which called Borel $sigma$-algebra. Where is closed under countable unions and intersections. We can consider it as a application of filter language. The measure, is actually full of tendency to create a consistent additive morphisms into $bb(R)^(>=0)$ where built upon characteristic function.

$
  chi_E = cases(
	1 quad x in E,
	0 quad x in bb(R) \/ E
  )
$

Where $f(x)$ is a fine addition of $chi_E$. But if we consider it as a sequence that such integration is actually natural and the limit $f(x) - f_N (x)$ $N tilde.eq [infinity] in tlstar(bb(N))$ can be reached if, the filter exclude all countable set which has smaller cardinality than $bb(R)$, constructing *almost all* property.
#footnote[The basic consequence is that the integral of $xi_bb(Q)$ is $0$.]

However, it there's no order, we should has a weaker order logic. We try to induce a morphism $d(*,*) -> S$ for a order set $S$(Or any given canonical number system).

The history of topology is based on selection of set. A finer selection means a huger control on element. Given a ordered set, we can always construct a open set which has ${x in X|a<x<b}$ stem from canonical order of number system. For a finite set, which has a cardinality equal to a subset of $bb(N)$, can be equipped with a order in $bb(N)$ as a topology space, it can be finer that for every element discretely separated, define every open set also as closed set as ${x}$.

Given a morphism $d(*,*): X times X -> S$ where $S$ a order set, it must has property to reflect the order of $S$. $X$ has no necessity to deduce a *total order* where every element can be smaller or greater, that's, we will encounter a violation if $d(a,c) < 0, d(b,c) > 0$ but $d(a, b) < 0$. But we indeed has $d(x,x) = d(x,x) + d(x,x)$ as a identity element of such addition structure, $d(x,x) = 0$. The continuity given by distance $d(x,B(x,epsilon))= d(B(x,epsilon),x) -> (x,y) = d(y,x)$ for the open ball defined as ${y in X | d(x,y)\/ d(y,x) < epsilon}$. Finally, suppose we want to find a distance in minimal lower bound by a selection of element $d(x,y_m)$, with a limit, $d(y_m,y_n) > d(x,y_m) + d(x,y_n) tilde.eq [epsilon]$ cause a violation. Thus $d(y_m,y_n) <= (...)$ forms a triangle inequality.

Thus, $bb(Q)^abs(bb(N))$ can also be a vector space equipped with $d(*,*)$. But is this necessary, the answer is no. It's at least indicates a Hausdorff topology. A weaker property is acceptable but the order induced by canonical number system is indeed Hausdorff, so we will take all this as a canonical way.

The distance morphism could retains vector structure in domain. First, it should be translation invariant which $d(x,y) tilde.eq d(x+alpha, y+alpha)$ independent of reference base. Second, it must retain scalar as linearity, $f(a x) = a f(x) -> d(a x, a y) = a d(x,y)$. Thus, we has $d(x,y) = d(x-y,0) tilde.eq norm(x-y)$.

The highly non trivial property of inequality ensure the limit existence. Which is another name of convexity. Suppose a homotopy $F(lambda)$ $lambda in [0,1]$:

$
  f(lambda x + (1-lambda)y) <= lambda f(x) + (1-lambda) f(y)
$

Where we recover back to triangle inequality if $lambda = 1/2$.

Now we are already into the language of function space. The basic analysis tells that $(*)^p$ is convex if $p >= 1$. With a pointwise inequality:

$
  abs(lambda f(t) + (1- lambda)g(t))^p <= lambda abs(f(t))^p + (1-lambda) abs(g(t))^p
$

Now, we apply integral which is addition of sequence or the given limit of characteristic function.

$
 integral abs(lambda f(t)+ (1-lambda) g(t))^p d mu <= integral abs(f(t))^p
$