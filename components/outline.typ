#import "@preview/pointless-size:0.1.2": zh

#let outline() = page({
  show heading: set text(font: "SimHei", size: zh("三号"), weight: "bold")
  show heading: set align(center)
  show std.outline.entry: it => {
    if it.level == 1 {
      set text(size: zh("四号"))
      link(
        it.element.location(),
        it.indented(it.prefix(), it.inner()),
      )
    } else {
      set text(size: zh("小四"))
      link(
        it.element.location(),
        it.indented(it.prefix(), it.inner()),
      )
    }
  }
  set text(font: "SimSun")
  std.outline(
    title: "目录".clusters().join(" " * 3),
  )
})
