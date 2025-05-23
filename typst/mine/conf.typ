#import "deps.typ": *
#import "utils.typ": *

// Sizes used across the template.
#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 17pt

#let title-size-zh = zh(3)
#let normal-size-zh = zh(-4)
#let head-size-zh = zh(4)
#let script-size-zh = zh(5)

#let mine(
  /// Set Language
  /// -> str
  lang: "en",
  /// Title
  /// -> none | str
  title: none,
  /// Authors
  /// -> none | (name: str, location: str, organization: str department: str, addtion: str, url: link)
  authors: (),
  /// Abstract
  /// -> none | str | content
  abstract: none,
  /// Keywords
  /// -> none | array(str)
  keywords: none,
  /// Paper Size
  /// -> str
  paper-size: "us-letter",
  /// Bibliography
  /// -> none | path
  bib: none,
  /// Heading numbering
  /// -> none | str | function
  heading-numbering: "1.1",
  /// Equation numbering
  /// -> none | str
  eq-numbering: none,
  /// Allowing Equation Chapter-wise numbering
  /// -> bool
  eq-chapterwise: false,
  /// Text Size
  /// -> length
  text-size: normal-size,
  /// Width of the Figure Captions
  /// -> relative
  fig-caption-width: 75%,
  body,
) = {
  let author-names = authors.map(author => author.name)
  let author-names-s = join-comma(author-names)

  let author-addtions = authors.map(author => author.addtion)
  let author-addtions = join-comma(author-addtions)

  set document(title: title, author: author-names)

  set text(
    size: text-size,
    font: (
      (name: "Times New Roman", covers: "latin-in-cjk"),
      "Microsoft YaHei",
    ),
    lang: lang,
  )

  set page(
    paper: paper-size,
    // The margins depend on the paper size.
    margin: if paper-size != "a4" {
      (
        top: (116pt / 279mm) * 100%,
        left: (126pt / 216mm) * 100%,
        right: (128pt / 216mm) * 100%,
        bottom: (94pt / 279mm) * 100%,
      )
    } else {
      (
        top: 117pt,
        left: 118pt,
        right: 119pt,
        bottom: 96pt,
      )
    },

    // Deprecated:
    // The page header should show the page number and list of
    // authors, except on the first page. The page number is on
    // the left for even pages and on the right for odd pages.
    header-ascent: 14pt,
    header: context {
      let i = counter(page).get().first()
    },

    // On the first page, the footer should contain the page number.
    footer-descent: 12pt,
    footer: context {
      let i = counter(page).get().first()
      align(center, text(size: script-size, [#i]))
    },
  )

  // Equation style.
  let chapterwise-numbering = (..num) => numbering(eq-numbering, counter(heading).get().first(), num.pos().first())

  set math.equation(numbering: eq-numbering) if not eq-chapterwise
  set math.equation(numbering: chapterwise-numbering) if eq-chapterwise
  show math.equation: set block(above: 2em, below: 2em)

  // Configure headings.
  set heading(numbering: heading-numbering)
  show heading: it => {
    let number = if it.numbering != none {
      counter(heading).display(it.numbering)
      h(8pt)
    }
    set text(weight: "bold")
    set par(first-line-indent: 0em)
    set align(left)
    if lang == "zh" {
      set text(font: "SimHei", lang: "zh", region: "cn")
    }

    if it.level == 1 {
      if lang == "zh" {
        set text(size: head-size-zh)
      } else {
        set text(size: 1.2em)
      }
      set par(spacing: 0.8em)
      v(1.0em, weak: true)
      number
      it.body
      v(1.0em, weak: true)
    } else if it.level == 2 {
      set text(size: 1em)
      set par(spacing: 0.6em)
      v(1.8em, weak: true)
      number
      it.body
      v(1.0em, weak: true)
    } else {
      set text(size: 0.8em, font: "SimHei")
      set par(spacing: 0.4em)
      v(1.2em, weak: true)
      number
      emph(it.body)
      v(0.8em, weak: true)
    }
  }

  // Configure lists and links.
  set list(indent: 24pt, body-indent: 5pt)
  set enum(indent: 24pt, body-indent: 5pt)
  show link: set text(font: "New Computer Modern Mono")

  // Configure citation and bibliography styles.
  set std.bibliography(style: "springer-mathphys", title: [References])

  set figure(gap: 17pt)
  show figure: set block(above: 12.5pt, below: 15pt)
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

  // Display the title and authors.
  v(35pt, weak: true)
  align(
    center,
    {
      if lang != "zh" {
        text(size: 2.2em, weight: "bold", title)
        v(25pt, weak: true)
        text(size: footnote-size, author-names-s)
        v(8pt)
        text(size: footnote-size, author-addtions)
      } else {
        set par(leading: 1.5em)
        text(size: title-size-zh, font: "SimHei", title)
        v(1.5em, weak: true)
        text(size: normal-size-zh, font: "KaiTi", author-names-s)
        v(1.5em, weak: true)
        text(size: normal-size-zh, font: "KaiTi", author-addtions)
      }
    },
  )

  // Configure paragraph properties.
  set par(spacing: 1.2em, first-line-indent: 1.2em, justify: true, leading: 0.8em)
  if lang == "zh" {
    set par(leading: 1.5em)
  }

  // Display the abstract
  if abstract != none {
    v(20pt, weak: true)
    show: pad.with(x: 35pt)
    let label = label-diff-lang("abstract", lang: lang)
    if lang != "zh" {
      set text(script-size)
      smallcaps(label)
      abstract
    } else {
      set text(script-size-zh)
      text(font: "SimHei", label)
      text(font: "SimSun", abstract)
    }
  }

  if keywords != none {
    v(20pt, weak: true)
    show: pad.with(x: 35pt)
    let label = label-diff-lang("keywords", lang: lang)
    let keywords = keywords.join("; ")
    if lang != "zh" {
      set text(script-size)
      smallcaps(label)
      keywords
    } else {
      set text(script-size-zh)
      text(font: "SimHei", label)
      text(font: "SimSun", keywords)
    }
  }

  // Display the article's contents.
  v(29pt, weak: true)
  if lang == "zh" {
    set text(font: "SimSun", size: normal-size-zh)
    body
  } else {
    body
  }
}

#let mine-author-detail(
  /// Authors
  /// -> none | (name: str, location: str, organization: str department: str, addtion: str, url: link)
  authors,
  /// Size
  /// -> length
  script-size: script-size,
) = {
  // Display details about the authors at the end.
  v(12pt, weak: true)
  show: pad.with(x: 11.5pt)
  set par(first-line-indent: 0pt)
  set text(script-size)

  for author in authors {
    let keys = ("department", "organization", "location")

    let dept-str = keys.filter(key => key in author).map(key => author.at(key)).join(", ")

    smallcaps(dept-str)
    linebreak()

    if "email" in author [
      _Email address:_ #link("mailto:" + author.email) \
    ]

    if "url" in author [
      _URL:_ #link(author.url)
    ]

    v(12pt, weak: true)
  }
}

#let appendix(
  /// The numbering of the Appendix
  /// -> none \ str \ function
  numbering: "A.1",
  /// Starting of the Appendix number
  /// -> int
  numbering-start: 0,
  /// The title of the Appendix
  /// -> none | str | content
  title: none,
  /// The alignment of the title
  /// -> length
  title-align: center,
  /// The size of the title
  title-size: none,
  body,
) = {
  context counter(heading).update(numbering-start)
  set heading(numbering: numbering)

  // optional title
  if title != none {
    show heading.where(level: 1, numbering: none): it => {
      if title-size != none {
        set text(size: title-size)
        it
      } else {
        it
      }
    }
    let title-text = heading(numbering: none, level: 1, title)
    align(title-text, title-align)
  }
  body
}
