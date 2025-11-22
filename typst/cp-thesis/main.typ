#import "../lib.typ": *
#import "../info.typ": *

#let abstract = [1]
#let keywords = "1"

#show: mine.with(
  template: "cp-zh",
  lang: "zh",
  title: "",
  authors: authors-cp,
  abstract: abstract,
  keywords: keywords,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
)

= 引言
我


= adwaawda

= awd

= awda

== awda


#pagebreak()

#show: appendix.with(supplement: "附录")

= 代码补充