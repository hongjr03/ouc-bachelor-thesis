#import "@preview/pointless-size:0.1.2": zh

#let abstract(
  title: (
    zh: "基于唱跳说唱篮球的舞蹈练习",
    en: "The Practice of Dance Based on Singing, Dancing, Rapping and Basketball",
  ),
  abstract: (
    zh: [
      出道之后，蔡徐坤大部分精力都投身于新歌的创作和专辑的打造。彼时，他需要随着 NINE PERCENT 在三个月内完成 17 场大型巡回见面会，因此写歌的时间必须挤出来用。洗澡时、做造型时、飞机上、两个行程间或吃饭的空隙，只要有手机和旋律，任何地方都是他的创作场所；偶尔待在录音室里，甚至成为他的喘息时间。去年，新京报记者见到他时正值午饭，化妆室里传来哼鸣声，采访完的休息时间，我都可以写一段词。我还年轻，我觉得这都 OK。他曾表示。而《1》的发表同样违背偶像市场的规律。蔡徐坤本可以每月发一首，制造更多话题。但他认为，一首首发表并不足以让外界更全面地了解他的音乐风格，当别人都走得很快，我反而要踏踏实实一步步走。偶尔听到舆论质疑他没有作品，蔡徐坤也曾犹豫，要不要先发一部分出来？但内心却总有个声音说，你可以再多做几首不同风格的作品，让大家看到最全面、最好的你，而不是急于求成地去展现自己。],
    en: [
      After his debut, Cai devoted most of his energy to the creation of new songs and albums. At that time, he needed to complete 17 large-scale tour meetings with NINE PERCENT in three months, so the time for writing songs had to be squeezed out. While bathing, modeling, on the plane, between two itineraries or meals, as long as there was a mobile phone and melody, anywhere could be his creation place. Occasionally, staying in the studio even became his breathing time. Last year, when the reporter of The Beijing News saw him, it was lunch time, and there was humming in the dressing room. He once said, I can write a paragraph during the rest time after the interview. I am still young. I think it is OK.],
  ),
  keywords: (
    zh: ("蔡徐坤", "篮球", "舞台"),
    en: ("Cai Xukun", "Basketball", "Dance"),
  ),
) = {
  //   1.中文题目与摘要
  // 题目
  // 摘   要
  // （三号，黑体，居中，中间空三个字符）
  // 摘要正文（小四，宋体），在300字左右
  // 关键词：  XXXX；XXXX；XXXX  （3-5个主题词）（小四，黑体）

  // 2.英文题目与摘要
  // Thesis Title
  // Abstract
  // （三号，黑体，居中）
  // 英文摘要正文用Times New Roman字体四号字，英文摘要内容与中文摘要一致，并要符合英语语法，用第三人称，最好采用现在时态编写。大约为200-300个单词。
  // Key Words: 英文关键词与中文关键词一一对应。

  show heading: set text(font: "SimHei", size: zh("三号"), weight: "bold")
  show heading: set align(center)
  show heading: set block(spacing: 1.5em)
  set heading( numbering: none, bookmarked: false, outlined: false)
  page({
    heading(level: 1, title.zh)
    heading(level: 1, "摘要".clusters().join(" " * 3))
    {
      set text(font: "SimSun", size: zh("小四"))
      set par(first-line-indent: (amount: 2em, all: true))
      abstract.zh
    }
    {
      set text(font: "SimHei", size: zh("小四"), weight: "bold")
      [关键词：] + keywords.zh.join("；")
    }
  })

  page({
    heading(level: 1, title.en)
    heading(level: 1, "Abstract")
    {
      set text(font: "Times New Roman", size: zh("小四"),)
      set par(first-line-indent: (amount: 2em, all: true))
      abstract.en
    }
    {
      set text(font: "Times New Roman", size: zh("小四"), weight: "bold")
      [Key Words: ] + keywords.en.join(", ")
    }
  })
}
