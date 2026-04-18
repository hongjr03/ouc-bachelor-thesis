#import "@preview/pointless-size:0.1.2": zh

#let acknowledgments(body) = page({
  show heading: set text(font: "SimHei", size: zh("三号"), weight: "bold")
  show heading: set align(center)
  show heading: set block(spacing: 1.5em)
  heading("致谢".clusters().join(" " * 3))
  set text(font: "SimSun", size: zh("小四"))
  set par(
    leading: 24pt,
    spacing: 24pt,
    first-line-indent: (amount: 2em, all: true),
  )
  body
})
