#import "@preview/touying:0.6.1": *
#import themes.university: *

#set text(
  font: (
    (name: "Microsoft Sans Serif", covers: "latin-in-cjk"),
    "Microsoft YaHei",
  ),
)

#show: university-theme.with(
  aspect-ratio: "16-9",
  footer-a: self => self.info.subtitle,
  config-common(handout: true),
  config-info(
    title: [Embassy模块化],
    subtitle: [#align(right)[--- --- 基于ArceOS]],
    author: [吕粤蒙],
    date: datetime.today(),
    institution: [OpenCamp 春夏开源内核训练营],
    logo: emoji.leaf,
  ),
  config-page(margin: (top: 2.4em)),
)

#title-slide()

// Outline
// #align(horizon, components.adaptive-columns(outline(title: none, indent: 1em, depth: 1)))

= 介绍

#slide(composer: (1fr,auto))[
  Hard to read!
][
  #set align(center + horizon)
  #image("../charts/preempt-atomic-sum/atomic-volume-2.png",width: 12em)
  #image("../charts/preempt-atomic-sum/atomic-volume.png",width:12em)
]


