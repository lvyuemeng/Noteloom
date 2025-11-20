#let TitleBlock = (title, authors) => [
  heading(level: 1)[#title]
  text(italic(authors.join(", ")))
  v(1em)
]

#let AbstractBlock = (text) => [
  heading(level: 2)[Abstract]
  text
  v(1em)
]

#let KeywordBlock = (keywords) => [
  heading(level: 2)[Keywords]
  text(keywords.join(", "))
  v(1em)
]