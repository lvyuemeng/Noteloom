#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 17pt

#let core-styles = (
  // text
  lang: "en",
  font-main: "Libertinus Serif",
  font-cjk: "SimHei",
  text-size: normal-size,
  script-size: script-size,
  // page
  paper: "a4",
  // heading
  font-head: "Libertinus Serif",
  head-numbering: "1",
  head1-size: 1.4em,
  head2-size: 1.2em,
  head-size: 1.2em,
  head1-spacing: 0.8em,
  head2-spacing: 0.6em,
  head-spacing: 0.4em,
  // math
  eq-chapterwise: true,
  eq-numbering: "(1.1)",
  // fig
  fig-gap: 17pt,
)

// overwritten style
#let resolve-config = (tmpl-base, cfg) => {
  let base = core-styles + tmpl-base
  base + cfg
}

#let compose(cfg,content,..modifiers) = {
  for modifier in modifiers.pos() {
    content = modifier(cfg,content)
  }
  content
}

#let with-text-style(cfg,content) =  {
  set text(
    font: (
      (name: cfg.font-main, covers: "latin-in-cjk"),
      cfg.font-cjk,
    ),
    size: cfg.text-size,
    lang: cfg.lang,
  )
  content
}

#let with-page-style(cfg,content) = {
  set page(
    paper: cfg.paper,
    // margin: if cfg.paper != "a4" {
    //   (
    //     top: (116pt / 279mm) * 100%,
    //     left: (126pt / 216mm) * 100%,
    //     right: (128pt / 216mm) * 100%,
    //     bottom: (94pt / 279mm) * 100%,
    //   )
    // } else {
    //   (
    //     top: 117pt,
    //     left: 118pt,
    //     right: 119pt,
    //     bottom: 96pt,
    //   )
    // },

    header-ascent: 14pt,
    header: context {
      let i = counter(page).get().first()
    },

    footer-descent: 14pt,
    footer: context {
      let i = counter(page).get().first()
      align(center, text(size: cfg.script-size, [#i]))
    },
  )
  content
}

#let with-heading-style(cfg,content) = {
  set heading(numbering: cfg.head-numbering)
  show heading: it => {
    let number = if it.numbering != none {
      counter(heading).display(it.numbering)
      h(7pt, weak: true)
    }

    set align(left)
    set text(font: cfg.font-head, lang: cfg.lang, weight: "bold")
    set par(first-line-indent: 0em)

    let size = if it.level == 1 { cfg.head1-size } else if it.level == 2 { cfg.head2-size } else { cfg.head-size }
    let spacing = if it.level == 1 { cfg.head1-spacing } else if it.level == 2 { cfg.head2-spacing } else {
      cfg.head-spacing
    }
    let vtop = if it.level == 1 { 1.8em } else if it.level == 2 { 1.8em } else { 1.2em }
    let vbottom = if it.level == 1 { 1.0em } else if it.level == 2 { 1.0em } else { 0.8em }

    set text(size: size)
    set par(spacing: spacing)
    v(vtop, weak: true) // Top spacing
    number
    it.body
    v(vbottom, weak: true) // Bottom spacing
  }
  content
}

#let with-math-style(cfg,content) = {
  let chapterwise-numbering = (..num) => numbering(cfg.eq-numbering, counter(heading).get().first(), num.pos().first())

  set math.equation(numbering: eq-numbering) if not cfg.eq-chapterwise
  set math.equation(numbering: chapterwise-numbering) if cfg.eq-chapterwise
  show math.equation: set block(above: 2em, below: 2em)

  set list(indent: 24pt, body-indent: 5pt)
  set enum(indent: 24pt, body-indent: 5pt)

  set std.bibliography(style: "springer-mathphys", title: [References])
  content
}

#let with-figure-style(cfg,content) = {
  set figure(
    gap: cfg.fig-gap,
  )
  show figure: it => {
    show figure.caption: caption => {
      set par(justify: true)
      caption.supplement
      if caption.numbering != none {
        [ ]
        numbering(caption.numbering, ..caption.counter.at(it.location()))
      }
      [. ]
      caption.body
    }

    // Around space
    show selector.or(table, image): pad.with(x: 23pt)

    it
  }
  content
}
