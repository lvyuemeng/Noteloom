#import "../lib.typ": *

// utils functions
#let cdot = $circle.small$
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

// Mine infos
#let abstract_ = {
  "awdawaw"
}

#show: mine.with(
  lang: "zh",
  title: "刚体",
  authors: ((name: "吕粤蒙", addtion: "202326002086   物理学(2)班"),),
  abstract: abstract_,
  keywords: (),
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

// Paragraph indent
#set par(
  first-line-indent: (
    amount: 1em,
    all: true,
  ),
)

= Vector Fields on manifold
我们已经了解Euler-Lagrange等式的形式等价于对于Lagrange作用量泛函的静态变分,即对于如下结构,由Hamilton原理给出$delta S = 0$:
$
  S[q] := integral L(q(t),dot(q)(t)) d t
$
实际上,由于变分的任意性,我们了解到运动轨迹的变化随任意坐标的变化而变化却不影响最终的动力学结果。这也意味着, 对于任意作用量的变分是不随坐标的变换而改变的,即Hamilton原理包含了*坐标不变性*。直觉告诉我们,Lagrange作用量是比坐标的表示形式更为基础的代数对象。

既定初始的演化参数$q_i (0), dot(q)_i (0)$,动力学的演化告诉我们坐标的变化不是任意,而是依照特定的约束而变化,因而$bb(R)^3$空间下,即使我们没有流形的知识,直觉告诉我们,其约束的空间则是一个在其空间下的平面,质点的运动轨迹是一个可以用平面坐标下描述的曲线.

基础的坐标变换知识告诉我们,任意的曲线轨迹所在的邻域下所在的空间存在的函数$f(x_1,...,x_n)$具有其各个方向的变化,等价于:
$
  x^i &= p^i + t a^i \
$
$
  D f &= lim_(t->0)(f(p+t a) - f(p)) / t \
      &= d / (d t)|_(t=0)f(p+t a) \
      &= sum (partial f)/(partial x^i)|_p (d x^i)/(d t)|_(t=0) = sum (partial f)/(partial x^i)|_p a^i \
$

我们知道任意坐标的变化的参数是任意的,函数$f$也是任意的,但是求导的形式却是确定的.我们尝试抽象结构,邻域的所在的空间结构不会变化,只要我们既定坐标,我们都存在$(partial)/(partial x^i)$,不仅如此,它的形式仅随我们对此邻域的坐标表述变化而变化,而不随邻域的变化而变化.我们可以将其抽象为$bb(R)^n$下的线性空间.

只要邻域本身同构于$bb(R)^n$,我们永远可以建立局部的坐标系,构建线性空间. 我们称这种空间为*流形*.但比起任意的此种空间,在伽利略的年代,我们都知道我们所存在的空间具有速度变换的动力学不变性,这意味着我们的空间存在着对称性,实现各种各样的变换我们对空间的感知并不会改变.如何
$
  delta S[q] = lim_(s -> 0) (S[q+delta q]-S[q]) / s = d / (d s)|_(s=0)S[q+delta q] := inpro(l: (delta S) / (delta q), r: delta q)
$


#bibliography("refs.bib", title: "摘要")
