#import "../deps.typ": *
#import "../core.typ": *
#import "../utils.typ": *

#let title-size = zh(3)
#let normal-size = zh(-4)
#let script-size = zh(5)

#let base-styles = (
  // text
  lang: "zh",
  font-main: "Libertinus Serif",
  font-cjk: "SimSun",
  font-head: "SimHei",
  text-size: normal-size,
  script-size: script-size,
  // page
  paper: "a4",
  // heading
  head-numbering: "1",
  head1-size: zh(4),
  // math
  eq-numbering: "1.1",
  eq-chapterwise: true,
  // fig
  fig-gap: 17pt,
)

#let expand(f) = (..args) => {
  let content = f(..args)
  content // 直接嵌入调用点
}

#let tmpl = args => {
  let cfg = resolve-config(base-styles, args)

  show: with-page-style.with(cfg)
  show: with-text-style.with(cfg)
  show: with-math-style.with(cfg)
  show: with-heading-style.with(cfg)
  show: with-figure-style.with(cfg)

  align(center, {
    set par(leading: 1.5em)
    text(size: title-size, font: "SimHei", args.title)
    v(1.5em, weak: true)
    for author in args.authors {
      if "name" in author {
        text(size: normal-size, author.name)
      }
      v(1.5em, weak: true)
      if "addition" in author {
        text(size: normal-size, author.addition)
      }
    }
  })

  set par(spacing: 1.5em, first-line-indent: (amount: 1em, all: true), justify: true, leading: 1.19em)

  if args.abstract != none {
    v(20pt, weak: true)
    show: pad.with(x: 35pt)
    text(size: script-size, font: "SimHei", "摘要: ")
    text(size: script-size, font: "SimSun", args.abstract)
  }

  if args.keywords != none {
    v(20pt, weak: true)
    show: pad.with(x: 35pt)
    text(size: script-size, font: "SimHei", "关键词： ")
    text(size: script-size, font: "SimSun", args.keywords.join("; "))
  }

  args.body
}
