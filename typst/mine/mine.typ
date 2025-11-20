#import "templates/daily-en.typ": tmpl as daily-en
#import "templates/thesis-am-zh.typ": tmpl as am-zh

#let select-template = name => {
  if name == "daily-en" { daily-en } else if name == "am-zh" { am-zh } else {
    panic("Unknown template: " + name)
  }
}

#let big-text(content) = {
  // Component 1: Set text size
  set text(size: 2.0em)
  content
}

#let mine(
  template: "daily-en",
  title: none,
  authors: (),
  abstract: none,
  keywords: none,
  body,
  ..extra,
) = {
  let tmpl = select-template(template)

  // apply in dictionary
  tmpl((
    title: title,
    authors: authors,
    abstract: abstract,
    keywords: keywords,
    body: body,
    ..extra.named(),
  ))
}
