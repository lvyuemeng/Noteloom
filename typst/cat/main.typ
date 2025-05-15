#import "@preview/commute:0.3.0": node, arr, commutative-diagram
#import "@preview/theorion:0.3.3": *
#import "../conf.typ": mine

#show: mine.with(title: [Cat-Hom])

#show: show-theorion

#set heading(numbering: "1.1")
#set par(
  first-line-indent: (
    amount: 1em,
    all: true,
  ),
)

#let bind(txt, symbol) = text(txt) + "(" + symbol + ")"
#let cdot = $circle.small$
// #align(center)[#commutative-diagram(
//   node((0, 0), $X$),
//   node((0, 1), $Y$),
//   node((1, 0), $X \/ "ker"(f)$, "quot"),
//   arr($X$, $Y$, $f$),
//   arr((0,1), "quot", $tilde(f)$, label-pos: right, "dashed", "inj"),
//   arr($X$,(1,0), $pi$),
// )]
//

= Category

For category $cal(C)_1$ and $cal(C)_2$, we define $"Fun"(cal(C_1),cal(C_2))$ as the category of functors from $cal(C_1)$ to $cal(C_2)$. The objects are functors and morphisms are natural transformations. Is that well defined? Usually, we should ensure that morphisms of this category is a set. This can be achieved if $cal(C_1)$ and $cal(C_2)$ is small, a.k.a the objects are in a set. Then for $F_1(cal(C_1)) ->^eta F_2(cal(C_1))$, we know $cal(C_2)^cal(C_1)$ defines the maximal set of possible functors between them. Then the power set of $cal(C_2)^cal(C_1)$ is a set, which is the set of all possible morphisms between them, gives a set of natural transformations. So indeed, $"Fun"(cal(C_1),cal(C_2))$ is a category.

We can also define a functor $"Env"(cal(C_1), "Fun"(cal(C_1),cal(C_2)))$, given by $"Env"(A,F) -> F(A)$ which is called *evaluation functor*.

Given a pair that $(A,F) in cal(C_1) times "Fun"(cal(C_1),"Set")$, we give a correspondence $"Hom"_cal(C_1)(A,A) -> F(A)$. Naturally, we can define generally $"Hom"_cal(C_1)(A,-) -> F(-)$. Which usually, the left term is also a object in $"Fun"(cal(C_1), "Set")$ because $"Hom"_cal(C_1)(A, -)$ is a functor from $cal(C_1)$ to Set of morphisms, which is a functor. We can see indeed, the map that $"Hom"(I_A,f)("Hom"_cal(C_1)(A,A)) -> "Hom"_cal(C_1)(A,B)$ while $F(f)(F(A)) -> F(B)$. Now suppose various $"Hom"(I_A, f)(g) -> "Hom"(I_A,f cdot g)$ corresponds to $F(g)F(f)$. And finally $"Hom"(I_A, I_A) -> F(I_A)$ which is identity. It seems that we construct a relation between these two objects in $"Fun"(cal(C_1),"Set")$.

Now a deep sight is every map of object $B,C...$ is a morphism from $A ->^f B$ or $A ->^g C$, which is just a *representation* by $f, g...$ from $"Hom"_cal(C_1)(A, -)$ mapping to $F(B) = F(f(A)), F(C) = F(g(A))...$, we define the morphism or the natural transformation as $Theta_(A,B,C...) = Theta$. For every $x,y ... in A$, we can define each different $Theta', Theta'' ...$ given by $Theta(f) -> F(f)(x)$ which repeat above process.

So for every possible natural transformations, we assign it to a unique element $x in A$ by $Theta(I_A) = F(x)$. Gives a bijection.
$
  "Hom"_("Fun"(cal(C_1),"Set"))("Hom"_cal(C_1)(A, -),F(-)) = Theta_(\(-\)) -> F(A)
$
is a bijection.

Comment: Reader may confuse about $Theta$ as many components as $Theta_A, Theta_B...$, they are the same thing. Rather, the different thing is $Theta, Theta'$ assign to different $x,y in F(A)$.

A useful application or corollary is Given:
$
  "Hom"("Hom"_(cal(C_1))(A, -),"Hom"_cal(C_1)(B, -)) -> "Hom"_cal(C_1)(B,A)
$

Is a bijection. That's a indication that a object is nothing but the relation of other objects. The formally statement should be the relations of two objects are just the possible connections of their relations to other objects.



== Additive/Abelian

Additive category is a category $cal(C)$ for which that, given any pair $A$,$B$ as object, the $text("Hom")(A,B)$ inherit abelian group law.
$
  (f_1 + f_2) circle.small g = f_1 circle.small g + f_2 circle.small g \
  f circle.small (g_1 + g_2) = f circle.small g_1 + f circle.small g_2
$
It doesn't mean category contains a native abelian operation $plus$, rather, it's for each object contained in the category. That is the reason of *additive* comes from. However, the operation without abelian isn't well defined.

$
  (f_1 tilde(+) f_2) circle.small (g_1 tilde(+) g_2) &= f_1 circle.small g_1 tilde(+) f_1 circle.small g_2 tilde(+) f_2 circle.small g_1 tilde(+) f_2 circle.small g_2 \
  &!= f_1 circle.small g_1 tilde(+) f_2 circle.small g_1 tilde(+) f_1 circle.small g_2 tilde(+) f_2 circle.small g_2 \
  &= (f_1 tilde(+) f_2) g_1 tilde(+) (f_1 tilde(+) f_2) g_2
$

That's mean in such category, we has $f_1 - f_2 = 0$ if $f_1 = f_2$. The zero object of category which is the unique element(because the equivalence class of $[f_1 - f_2] ~ [0]$ deduced from the equivalence class of functions.) equipped with unique morphism to any other objects.

$(i_A, 0)$ could be the equivalence natural injection and projection between $A times B$ and $A$. So in additive category, product and sum is a equal definition.

Kernel is the description of a morphism that send $A$ to zero by $f$.

#definition[
  A *Kernel* of a morphism $f: A -> B$ is a monomorphism $k: K -> A$ such that:
  1. Composition as Zero: $f circle.small k = 0$
  2. Universal Property: For any $k': C -> A$ such that $f circle.small k' = 0$ will give us a unique morphism $u$, such that $k' = k circle.small u$.
]

The universal property doesn't ensure its existence. So we just point it out rather prove it.

Usually, it does like zorn lemma in axiom choice, we can always select a general representation for a equivalence relation between possible underneath morphisms.

Thus, Ker($f$), if exist, is the equalizer of every possible morphisms that composes $f$ as zero.

We could define in same routine for Coker($f$), which is the composition zero by $k circle.small f$. That's the representation of information in target object that doesn't recorded by $f$.

Rather, the definition of Im($f$) is second in category. We see by $c: B -> text("Coker")(f) quad f: A -> B$. We revert the annihilation that Im($f$) $=$ Ker($c$). Which means the information that recorded by $f$.

We could define in same routine for Coim($f$), which is $c: text("Ker")(f) -> A quad f: A->B$. Coim($f$) = Coker($c$).

Then we factor out a morphism by $f: f = im(f) circle.small "factor" cdot "coim"(f)$. Which means we decompose $f$ as the information from source object $A$ as coim($f$) to target $B$ as im($f$). But what about "factor"? That's the reason of definition *abelian category*, derived from the uncertainty of equivalence relation of coim($f$) and im($f$). We should ensure they are isomorphism but only in intuition.

#definition[
  abelian category is an additive category with following additional conditions:
  1. Any morphism admits a kernel and cokernel.
  2. $"Coim"(f) -> "Im"(f)$ is an isomorphism for every $f$.
]

It also indicates a restriction that bijection is isomorphism because Ker($f$) = 0 and Coker($f$) = 0 indicates:

$
  A -> "Coim"(f) -> "Im(f)" -> B
$
gives a isomorphism based on the bridge of condition (2).

We know we can factor out a object by a morphism that:

$
  0 -> "Ker"(f) ->^"ker"(f) A ->^"im"(f) "Im"(f) -> 0 \
  0 -> A -> B -> C -> 0
$

For which ker($f$) is monomorphism and im($f$) is epimorphism. Observe that $"im"(f) circle.small "ker"(f) = 0$. Which means we fully factor out a object! We call this sequence of morphism is *exact*. We can define in same routine for left exact and right exact, which corresponds to partial factor by left monomorphism or right epimorphism.

If a functor apply to the sequence s.t.:

$
  0 -> "Hom"(X,A) ->^(u_*) "Hom"(X,B) ->^(v_*) "Hom"(X,C)
$

This functor maps every object in $cal(C)$ to $"Hom"(X,cal(C)) quad X in cal(C)$. Each object is a morphism set and each morphism is a consecutive concatenation by $u_*(f) ~ u circle.small f quad u in "Hom"(A,B)$ in above map.

What property could be preserved? We see in original exact sequence that $u$ is monomorphism s.t. $u_*(f) = u circle.small f$ implies that if $u circle.small f = u circle.small 0$, then $f = 0$. Which still preserves the property(Same operation could be reversed to prove original category left exactness). We can do the same to prove $"Ker"(v_*) = "Im"(u_*)$. However, we can see directly that left operation can't ensure right property which is epimorphism, resulting only left exactness.

Finally, there are also *half exact* functor which only preserves $"Ker"(F(v)) = "Im"(F(v))$. Everything can also be reversed as in $cal(C)^op$ as a reversed factor(epi to mono, mono to epi, then reverse the arrow).

== Generators and Cogenerators

These elements aren't the smallest elements, but rather abundant elements capturing enough information.

#definition[
  There exist a family of objects $(U_i)_(i in I)$ is a family of generators that for any object $A$ and its suboject $B$, there always exist $u_i: U_i -> A$ such that the image isn't contained within $B$.
]

The above proposition can be also explained as $u_i$ can't be factored as a smaller morphism through $B$. However, it also indicating that we can always determines $B$ by morphisms from other possible set of $U_i$, or we can always have enough informations to determine a larger subobject through out any object.

We can reversely defining cogenerators by declaring that every $A -> U_i$ must goes through subobject $B$.

Above definition is already in abelian category, so actually projection and inclusion would be same, gives a isomorphism between generator and cogenerator.

In abelian category, we say that $pi: plus.circle.big U_i = U -> A$ as a quotient of possible index set of $U_i$.

== Injective and Projective Objects

Injective/Projective objects is the special objects that having enough spaces to contains or gives out information.

As a symmetry, we choose injective:
#definition[
  An object $M$ is injective if any morphism into M from subobject $B subset.eq A$ can be extended to morphism from larger object A
]

We can reverse the definition that projective object would extended to smaller object.

However, it gives a deeper relation to exact sequence by Hom(-,$M$) contravariant functor.

$
  0 -> B ->^u A ->^v A \/ B -> 0
$

Where Coker($u$) is $B$. Apply functor that:
$
  0 -> "Hom"(A\/B,M) ->^(v_*) "Hom"(A,M) ->^(u_*) "Hom"(B,M) -> 0?
$

We don't know wether the final arrow is possible to construct. If $M$ is injective, then $u^*(h) = h circle.small u "for" h: A -> M$, would always possible to extended to larger object by the monomorphism $u$ from $B$ s.t. $u^*(h) = h circle.small u = g "for" g: B -> M$. Where we recover the definition of injective object.

We can reverse the definition that projective object applied as Hom($P$, -) preserving right exactness by $v_*(k) = v circle.small k = g "for" forall k: P -> A "with" g: P -> A\/B$.

The useful technique could be derived from generators. Suppose $i_u:V_i -> U_i$ as a inclusion in subobject of $U_i$ generator, $i_b:B -> B'$ as subojects inclusion of $A$, given a relation of $U_i ->^j B$.

$
  V ->^phi.alt' U times B ->^phi.alt B' -> 0
$
with $phi.alt'(v) = (i_u (v), -j circle.small i_u (v))$ and $phi.alt(u, b) = i_b circle.small j (u)+ i_b (b)$.

If the sequence is exact, i.e. $phi.alt circle.small phi.alt'(v) = i_b circle.small j circle.small i_u (v) - i_b circle.small j circle.small i_u (v) = 0$, indicating that the $V$ properly included in $B$, that's the preimage, i.e $j^(-1)(U_i) = V_i$. We thus construct $B'$ as Coker($phi.alt'$), which is $(U times B) \/ V$, modulus already known information of $U$ already in $B$, gives us $B'$.

The greatest thing is if a category has generator, we can inductively apply this procedure, while due to zorn lemma, every object violating such property would be contradicted to our proposition of such building procedure, giving us a maximal element.

This proof can be stronger that: $i_b$ as inclusion can be proved rather imposed.

For every possible morphism $Z ->^m B ->^f U times B -> B' -> 0$, s.t. $i_b circle.small m = 0$, which means the image of morphism $m$ is contained in $V$, s.t. $i_b circle.small m = phi.alt' circle.small v$ for $v: Z -> V_i$. We know the inclusion $f circle.small m = (0,m) = sigma circle.small v$.

From left component: $(sigma "to left") circle.small v = 0 ~ v = 0$ because $sigma$ is inclusion as injection. Then $m=0$ from right component, therefore $i_b circle.small m = 0 ~ m=0$, gives $i_b$ is injection.

That's reasonable because $V_i$ is the information both from $B$ and $U_i$, so if the morphism $m$ image is only contained $B$ is absurd, rather, the gained information must be comes from $U_i$ as a extension.

Above observation implies that rather for object and its suboject relation, every object can be given a injection object, resulting injective property in such category.

== $delta$-Functor

Commonly, a functor isn't exact, it may be half exact, left or right exact, which means the sequence isn't fully decomposed by morphism.

Consider a functor $F$ from an abelian category to a additive category and at least half exact, apply to a short exact sequence:

$
  ? -> F(A) ->^F(u) F(M) ->^F(v) F(A') -> ?
$

$F(v)$ isn't surjective now, if we want to measure the failure of surjectivity, we can define $F(A') / "Im"(F(v))$. Rather, a general question is whether or not the definition is canonical? If M is injective, the original exact sequence exactness indicates the definition of $A'$ is always defined by $M$ itself. So $F(A') / "Im"((F(v))) -> F(A') / "Coker"(F(u))$ is well defined. Then we can seek a general definition by choose many possible $M$ as injective object, information of $A$ can always be preserved by various $M$. Indicating that $F(A') / "Coker"(F(u))$ is invariant under the choice of $M$, we denote it as $S F(A)$. If the category has enough injective objects, we can always define such object for every possible $A$, giving a canonical functor definition as $S F(alpha): S F(A) -> S F(B)$. We are close to a general definition...

We denote a system of functors $T = (T_i)$ from an abelian category to a addtive category. Where $T_i: cal(C) -> cal(C')$, together with special connecting morphsims named as boundary maps $delta\/partial: T_i (A'') -> T_(i+1) (A')$ for every short exact sequence $0 -> A' -> A -> A'' -> 0$ in each relevant degree $i$.

To maintain consistency of a functor, if T applies to sequence-$A$, it can applies to sequence-$B$, while maintaining commutative property.

The second property is special to $delta$-functor itself, which is any two morphisms composition is zero, therefore a weaker condition than exactness, at least we won't lose it.

An exact $delta$-functor contains a stronger second condition which is indeed the exactness.

We could reverse arrow to get contravariant $delta$-functor, or decrease the degree to get $delta^*$-functor, however, they are all symmetric representation.

If a category has enough injective objects, we can always construct a exact sequence by $0 -> A ->^u M -> "Coker"(u) -> 0$. Where $M$ is a injective object. Even, this could be applied to $M$ itself that $0 -> M_0 -> M_1 -> M_2 -> ...$ or simpler $0 -> M -> M -> 0$ as a self injection. This indicates that all rest of $M_i$ will be a trivial object for self injection of $M$. Take a $delta$-functor, we know $F(M_i) ->^(F(0)) F(M_(i+1))$, which means $T^i (M) = 0$ for $i>0$ as *effacable*. We call such object is *acyclic* stemming from the zero map.

Use a simpler notation that $0 -> A ->^u M ->^v A' -> 0$ for a injection.

We apply exact $delta$-functor to the sequence, we know $... -> T^0(M) ->^(T^0(v)) T^0(A') ->^delta T^1(A) ->^(T^1(u)) T^1(M) -> ...$. By exactness, we know $T^i (M) = 0$, so $delta$ is surjective as $"Im"(delta) = "Ker"(0)$.

Given another $T'^i$, we could construct a sequence morphism:

#align(center)[#commutative-diagram(
    node((1, -1), $0$),
    node((0, 0), $T^0(M)$),
    node((0, 1), $T^0(A')$),
    node((0, 2), $T^1(A)$),
    node((0, 3), $T^1(M)$),
    node((1, 0), $T'^0(M)$),
    node((1, 1), $T'^0(A')$),
    node((1, 2), $T'^1(A)$),
    arr((0, 0), (0, 1), $T^0(v)$),
    arr((0, 1), (0, 2), $delta$),
    arr((0, 2), (0, 3), $0$),
    arr((0, 0), (1, 0), $f^0(M)$),
    arr((0, 1), (1, 1), $f^0(A')$),
    arr((0, 2), (1, 2), $f^1(A)$),
    arr((1, 0), (1, 1), $T'^0(v)$),
    arr((1, -1), (1, 0), $$),
    arr((1, 1), (1, 2), $delta'$),
  )]

Based on a usual design of commutative diagram, we want to exploit the benefit of $M$ for each $T^i$ and $T'^i$. If we already know $f^0(...)$ is a natural transformation, which is commutative, exploiting that $delta' cdot f^0(A') cdot T^0(v) = delta' cdot T'^0(v) cdot f^0(M) = 0 cdot f^0(M) = 0$, with $"Ker"(delta) = "Im"(T^0(v))$, we can get $"Ker"(delta' cdot f^0(A')) supset.eq "Ker"(delta)$. Thus we can factor $delta' cdot f^0(A') cdot "ker"(delta) = 0$ by Coker universal property, which means $"Im"(delta' cdot f^0(A')) subset.eq "Coker"("ker"(delta)) = "Im"(delta)$, giving $delta' cdot f^0(A') = g cdot "coker"("ker"(delta)) = g cdot im(delta)$ for a unique morphism $g$. Recall that $delta$ is surjective, a.k.a $"im"(delta) = "coker"("ker"(delta)) = delta$. Thus $g = f^1(A)$ is the unique morphism we want to find, making the diagram commutative.

The final technique we use is often common to construct a unique morphism making such diagram commutative. The dual technique is also useful, which just assert that if $"coker"(f) cdot h = 0$, a.k.a $h = "ker"("coker"(f)) cdot g -> "Coim"(h) subset.eq "Coim"(f)$, we can decompose $h = "coim"(f) cdot g = "im"(f) cdot g$ for a unique morphism $g$. If f is also a monomorphism, we get $h = f cdot g$.

Then we can also denote $f^(-1)(C)$ for suboject $C$ of $A$ and morphism $f:B -> A$ as *preimage*, That's $f^(-1)(A) = "im"(f) = "coim"(f)$ is always well defined even $f^(-1)$ itself doesn't exist. We know that $B->^f A ->^pi C$, given $f^(-1)(pi^(-1)(C)) = (pi cdot f)^(-1)(C)$ is also well defined.

A rather instructive insight comes from diagram chasing, which is called *snake lemma*. Based on our previous analysis on right square, we know $"Ker"(f^1(A))$ must also the appended Ker upon $"Ker"(delta)$. Based on epimorphism, gives a preimage as $delta^(-1)("Ker"(f^1))$, then $delta'f^0(A') (delta^(-1)("Ker"(f^1)) = 0$, by exactness of lower sequence, we know that $(T'^0(v))^(-1)(f^0(A') delta^(-1)("Ker"(f^1)))$ is the preimage. Another route would be exploit the fact that $delta^(-1)("Ker"(f^1)) subset.eq "Coker"(T^0(v))$, due to upper sequence exactness.

Due to lower sequence, we know we can map $"Ker"(f^1(A)) -> T'^0(M)$. Further, a stronger declaration can be achieved, with commutativity $T^0(v) cdot f^0(A') = T'0(v) cdot f^0(M)$. By previous preimage of $(T'^0(v))^(-1)(f^0(A') delta^(-1)("Ker"(f^1)))$ denoted as $(...)$, trace up $f^0(A') cdot T^0(v) ((f^0(M))^(-1)(..)) = 0 = T'^0(v) cdot f^0(M) ((f^0(M))^(-1)(..))$, indicating that $f^0(M)^(-1)(..) = 0$. Which means, indeed $T^0(M) ->^(f^0(M)) T'^0(M) -> "Coker"(f^0(M)) supset.eq (..)$. That's indicating a morphism, if we can construct $d: "Ker"(f^1(A)) -> "Coker"(f^0(M))$, notice the preimage $(..)$ isn't injective and surjective corresponds to $"Ker"(f^1(A))$, so we can only achieve a morphism. But it's a great progress!

Place all thing $"Ker"(T^0(M)) -> "Ker"(T^0(A')) -> "Ker"(T^1(A))$ is exact because they are just part of the above upper sequence, we can give a restriction by $pi$ on every component, which gives the same results. Second, $"Coker"(T'^0(M)) -> "Coker"(T'^0(A')) -> "Coker"(T'^1(A))$ is same.

$
  "Ker"(T^0(M)) -> "Ker"(T^0(A')) -> "Ker"(T^1(A)) ->^d "Coker"(T'^0(M)) -> "Coker"(T'^0(A')) -> "Coker"(T'^1(A))
$

Is a exact sequence, also, if $T^0(v)$ is monomorphism, then $"Ker"(T^0(M)) -> "Ker"(T^0(A'))$ is monomorphism for the same reason above. If $delta'$ is a epimorphism, yielding $"Coker"(T'^0(A')) -> "Coker"(T'^1(A))$ is epimorphism.

However, such astonishing consequence is we can link each short exact sequence to a larger sequence, why bother that? Actually we can chain each object vertically to denote each apply functor component in each degree, and horizon is each short exact sequence, then we can see indeed, we chain up them degree by degree!

Now cease the stray, we see that by the above construction, we can always form a sequence natural transformations from the given condition $T^i$ and $f_0$, continuing building the sequence of $T^i$ and $T'^i$ by $f^i$ if and only if $T^i$ is effacable and with enough injective objects. Thus we can define universal $delta$-functor, which means for any $delta$-functor $T' = (T'^i)$ and any natural transformation $f^0: T^0 -> T'^0$, there exist *unique* morphism of $delta$-functors $f = (f^i): T -> T'$ given by $f^0$. It means the whole behavoir is determined by its behavoir at degree 0!(Apply identity natural transformation to itself.)

Therefore, we define universal $delta$-functor by $F = T^0$ and right satellite functors of $F$ by $S^i F = T^i$. We can apply same routine to $delta^*$ as decreasing degree, or reverse arrow to define in contravariant $delta$-functors.

= Simplex

How to make a general topological basic element? We now that 1-dim would be $(x)$, 2-dim would be $(x,y)$ etc... But there aren't bounded! If we want to make a bounded element. For example, a point, we restrict $x = c$ as a constant. How about 2-dim? We could let $a x + b y = c$, oh! Still unbounded! Let $x > 0 quad y=0$, everything works. Why we don't make a point as nothing? Like $(0)$ and make a line as $(x)$ with $0 < x < 1$? Actually, that's still a reasonable definition.

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

However, could a topological space be decomposed by these minimal element? Actually, Partially is. Could the result be independent of triangulation? Yes with a lengthy theorem.



