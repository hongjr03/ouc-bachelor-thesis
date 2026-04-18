#import "@preview/pointless-size:0.1.2": zh

#let bibliography(
  bib-file,
) = {
  show std.bibliography: it => {
    show heading: set text(font: "SimHei", size: zh("小三"))
    show heading: set align(center)
    show heading: set block(spacing: 1.5em)
    it
  }
//   相关事项说明：
// 1、不同类型文献的标识不同，上文斤列举“专著、期刊、网页”，其他类型的参考文献具体可参照GB/T 7714—2015，常用规则附后；
// 2、参考文献中的标点符号均为英文半角（,.），在“.”之后紧跟一个空格。
// 3、所有参考文献必须都在正文中有引用，按在正文中出现的先后次序列于此处，标号用数字加方括号表示，同一文献出现多次，只用同一标号。
// 4、参考文献内容的字体为小四号宋体（字母、数字、标点用Times New Roman字体）、固定行间距24。
  set text(font: ("Times New Roman", "SimSun"), size: zh("小四"))
  // set par(spacing: 24pt, leading: 24pt)
  std.bibliography("/" + bib-file, style: "gb-7714-2015-numeric")
}
