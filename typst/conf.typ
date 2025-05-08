// Sizes used across the template.
#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 17pt

#let mine(
	title: none,
	authors: (),
	abstract: none,
	paper-size: "us-letter",
	bib: none,
	body,
) = {
	let names = authors.map(author => author.name)
	let author-string = if names.len() == 2 {
		names.join(" and ")
	} else {
		names.join(", ")
	}

	set document(title:title, author: names)

	set text(
		size:normal-size, 
		font:(
			(name: "Times New Roman", covers: "latin-in-cjk"),
			"Microsoft YaHei"
		)
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

    // The page header should show the page number and list of
    // authors, except on the first page. The page number is on
    // the left for even pages and on the right for odd pages.
		header-ascent: 14pt,
    header: context {
      let i = counter(page).get().first()
      if i == 1 { return }
      set text(size: script-size)
      grid(
        columns: (6em, 1fr, 6em),
        align: (start, center, end),
        if calc.even(i) [#i],
        upper(
          if calc.odd(i) { title } else { author-string }
        ),
        if calc.odd(i) { [#i] }
      )
    },    
		
		// On the first page, the footer should contain the page number.
    footer-descent: 12pt,
    footer: context {
      let i = counter(page).get().first()
      if i == 1 {
        align(center, text(size: script-size, [#i]))
      }
    }
	)

  // Configure headings.
  set heading(numbering: "1.")

  show heading: it => {
    let number = if it.numbering != none {
      counter(heading).display(it.numbering)
      h(8pt)
    }

    if it.level == 1 {
      set text(size: 1.2em, weight: "bold")
      set par(
        first-line-indent: 0em,
        spacing: 0.8em,
      )
      set align(left)
      v(1.0em, weak: true)
      number
      it.body
      v(0.6em, weak: true)
    } else if it.level == 2 {
      set text(size: 1.0em, weight: "bold")
      set par(
        first-line-indent: 0em,
        spacing: 0.6em,
      )
      set align(left)
      v(1.8em, weak: true)
      number
      it.body
      v(1em, weak: true)
    } else {
      set text(size: 0.8em, weight: 400)
      set par(
        first-line-indent: 0em,
        spacing: 0.4em,
      )
      set align(left)
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

	// Configure equations.
  // show math.equation: set block(below: 8pt, above: 9pt)
  // show math.equation: set text(weight: 400)
	
	// Configure citation and bibliography styles.
  set std.bibliography(style: "springer-mathphys", title: [References])
	
	set figure(gap: 17pt)
  show figure: set block(above: 12.5pt, below: 15pt)
  show figure: it => {
    show figure.caption: caption => {
      smallcaps(caption.supplement)
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
  align(center, {
    text(size: 2.2em, weight: "bold", title)
    v(25pt, weak: true)
    text(size: footnote-size, author-string)
	})
	
	// Configure paragraph properties.
  set par(spacing: 1.2em, first-line-indent: 1.2em, justify: true, leading: 0.8em)
	
  // Display the abstract
  if abstract != none {
    v(20pt, weak: true)
    set text(script-size)
    show: pad.with(x: 35pt)
    smallcaps[Abstract. ]
    abstract
  }
	
	// Display the article's contents.
  v(29pt, weak: true)
  body

	// Display bib
	if bib != none {
    show std.bibliography: set text(footnote-size)
    show std.bibliography: set block(above: 11pt)
    show std.bibliography: pad.with(x: 0.5pt)
    bibliography
	}
	
	// Display details about the authors at the end.
  v(12pt, weak: true)
  show: pad.with(x: 11.5pt)
  set par(first-line-indent: 0pt)
  set text(script-size)

  for author in authors {
    let keys = ("department", "organization", "location")

    let dept-str = keys
      .filter(key => key in author)
      .map(key => author.at(key))
      .join(", ")

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