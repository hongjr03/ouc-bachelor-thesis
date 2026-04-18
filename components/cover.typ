#import "@preview/pointless-size:0.1.2": zh
#import "@preview/cuti:0.4.0": fakebold
#import "/components/logo.typ": logo

#let empty-underline(width: 100%) = box("", width: width, stroke: (bottom: 0.5pt))

#let cover-info() = {
  set text(font: ("Times New Roman", "SimSun"), size: zh("小五"))

  place(right, dx: 2em, float: false, grid(
    columns: (25em, 22.4em),
    align: top,
    table(
      columns: (3em, 1fr) * 2,
      inset: (x: 0pt),
      // gutter: ,
      row-gutter: .65em,
      stroke: none,
      align: center,
      fakebold[分类号], empty-underline(),
      fakebold[密级], empty-underline(),
      fakebold[UDC], table.cell(colspan: 3, empty-underline()),
    ),
    place(right + top, dy: -2em, logo),
  ))
}

#let cover-title(title: "你的论文标题") = {
  set text(font: ("Times New Roman", "SimSun"), size: zh("小初"))

  align(center, fakebold(
    "本科毕业论文".clusters().join(h(.5em)) + "（设计）",
  ))

  v(0.5cm)

  set text(font: "SimHei", size: zh("一号"))

  align(center, title)
}

#let underline-box(c, width, stroke: (bottom: 0.5pt)) = box(width: 1fr, move(dy: .21em, box(
  width: width,
  stroke: stroke,
  move(dy: -.21em, c),
)))

#let thesis-info(
  // 学生姓名
  author: "",
  // 学号
  student-id: "",
  // 指导教师
  advisor: "",
  // 学部、学院（中心）
  college: "",
  // 年级专业
  department: "",
  // 论文答辩日期
  defense-date: datetime.today(),
) = {
  set text(font: "SimSun", size: zh("四号"), lang: "zh", region: "cn")

  let bold(c) = {
    set text(font: "SimHei", size: zh("四号"), lang: "zh", region: "cn")
    (c)
  }

  align(
    center,
    table(
      columns: 24em,
      inset: (x: 0pt),
      // gutter: ,
      row-gutter: .95em,
      stroke: none,
      align: center,
      bold[学生姓名] + underline-box(author, 1fr) + bold[学号] + underline-box(student-id, 1fr),
      bold[指导教师] + underline-box(advisor, 1fr),
      bold[院、系、中心] + underline-box(college, 1fr),
      bold[专业年级] + underline-box(department, 1fr),
      bold[论文答辩日期]
        + underline-box("", 0.5fr, stroke: none)
        + bold[年]
        + underline-box("", 0.5fr, stroke: none)
        + bold[月]
        + underline-box("", 0.5fr, stroke: none)
        + bold[日]
    ),
  )
}

#let cover(
  title: "",
  author: "",
  student-id: "",
  advisor: "",
  college: "",
  department: "",
) = page({
  // v(-.77cm)

  cover-info()

  v(6.27cm)

  cover-title(title: title)

  v(4.65cm)

  thesis-info(
    author: author,
    student-id: student-id,
    advisor: advisor,
    college: college,
    department: department,
  )

  v(.2cm)

  align(center, text(font: "Microsoft YaHei", size: zh("小二"), weight: "bold", "中国海洋大学"
    .clusters()
    .join(h(.5em))))
})
