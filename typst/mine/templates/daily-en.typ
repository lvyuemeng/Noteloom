#import "../core.typ": *

#let base-styles = (
  lang: "en",
  fonts: (
    main: "Libertinus Serif",
    cjk: "Microsoft YaHei",
  ),
  title-size: 2.2em,
  head1-size: 1.4em,
  head2-size: 1.2em,
  script-size: 8pt,
  paper: "us-letter",
)

#let tmpl = args => {
  let cfg = resolve-config(base-styles, args)
  config-store.update(cfg)

  show: with-page-style.with(cfg)
  show: with-text-style.with(cfg)
  show: with-math-style.with(cfg)
  show: with-heading-style.with(cfg)
  show: with-figure-style.with(cfg)
  set std.bibliography(style: "springer-mathphys", title: [References])

  align(center, {
    text(size: 2.2em, weight: "bold", args.title)
    v(25pt, weak: true)
    for author in args.authors {
      if "name" in author {
        text(size: footnote-size, author.name)
      }
      v(8pt)
      if "addition" in author {
        text(size: footnote-size, author-addition)
      }
    }
  })

  set par(spacing: 1.2em, first-line-indent: 1.2em, justify: true, leading: 0.8em)

  if args.abstract != none {
    v(20pt, weak: true)
    show: pad.with(x: 35pt)
    align(center, text(1.2em, weight: "bold", "Abstract"))
    args.abstract
  }

  if args.keywords != none {
    v(20pt, weak: true)
    show: pad.with(x: 35pt)
    set text(script-size)
    smallcaps("Keywords")
    args.keywords.join("; ")
  }

  v(15pt, weak: true)
  args.body
}
