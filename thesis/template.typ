#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/codelst:2.0.2": sourcefile

// 句読点をカンマとピリオドに変換
#show "、": "，"
#show "。": "．"

// フォント設定 ------------------
#let textNormalize = 10.5pt
#let textTiny = 0.6em
#let textSmall = 0.9em
#let textLarge = 1.2em 
#let textXLarge = 1.4em 
#let text2XLarge = 1.7em
#let textHuge = 2.0em
#let textXHuge = 2.0em
#let leading = 1.3em

// Headingフォント
#let heading_font(body) = {
  set text(font: ("Hiragino Sans"), weight: "bold")
  body
}

// メインのテンプレート関数
#let thesis(
  titleJA: "",
  titleEN: "",
  subtitleJA: "",
  subtitleEN: "",
  author: "",
  student_number: "",
  supervisor: "",
  affiliation: "",
  abstractJA: "",
  abstractEN: "",
  body
) = {
  // ページ設定 ------------------------------------------------
  set page(
    paper: "a4",
    margin: (top: 35mm, bottom: 35mm, left: 25mm, right: 30mm),
    numbering: none 
  )

  // 本文フォント
  set text(
    font: ("Hiragino Mincho ProN"),
    size: textNormalize,
    lang: "ja"
  )

  show heading: heading_font

  show heading: it => {
    set par(leading: 0em)
    block(above: 1.5em, below: 1.5em, it)
  }

  set par(
    first-line-indent: (amount: 1em, all: true),
    leading: leading,
  )
  
  let today = datetime.today()
  let year = if today.month() >= 4 { today.year() } else { today.year() - 1 }
  
  // 表紙 ------------------------------------------------
  align(center)[
    #v(20.8pt)
    #text(size: textLarge)[卒業論文]
    #v(32pt)
    #text(size: text2XLarge, weight: "bold")[#titleJA]
    #v(24pt)
    #text(size: textNormalize)[#year 年度]
    #v(32pt)
    #text[指導教員 #supervisor]
    #v(32pt)
    #text(size: textNormalize)[( #student_number )]
    #v(0pt)
    #text(size: textHuge)[#author]
    #v(0pt)
    #text[#affiliation]
    #v(32pt)
    #text(size: textNormalize)[提出日：#year 年1月31日]
  ]
  pagebreak()
  
  // 要旨 ------------------------------------------------
  // 要旨用ページ番号設定
  counter(page).update(1)
  set page(numbering: "i")
  
  // 要旨（日本語）
  align(center)[
    #text(weight: "bold", size: textXLarge)[
      #titleJA #if subtitleJA != "" [ \ --- #subtitleJA ]
    ]
  ]
  
  heading[
    #set text(size: textNormalize)
    要旨
  ]
  abstractJA
  pagebreak()
  
  // 要旨（英語）
  align(center)[
    #text(weight: "bold", size: textXLarge)[
      #titleEN #if subtitleEN != "" [ \ --- #subtitleEN ]
    ]
  ]
  heading[
    #set text(size: textNormalize)
    Summary
  ]
  abstractEN
  pagebreak()
  
  // 目次 ------------------------------------------------
  set text(size: textNormalize) 
  set outline.entry(fill: none)
  set par(
    first-line-indent: (amount: 1em, all: true),
    leading: leading,
  )
  outline()
  pagebreak()
  
  // 本文 ------------------------------------------------
  counter(page).update(1)
  set page(numbering: "1")
  set heading(numbering: "1.1")

  body
}
