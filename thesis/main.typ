#import "template.typ": thesis

#show: thesis.with(
  titleJA: "電子ペーパーを用いた環境決定的変数による装置統合型ビジュアル生成手法の研究\n《createdAt:》制作を通して",
  titleEN: "A Study of Device-Integrated Visual Generation Using Environment-Determined Variables with Electronic Paper Display: Through the Production of \"createdAt:\"",
  subtitleJA: "",
  subtitleEN: "",
  author: "坂村 空介",
  student_number: "23244002",
  supervisor: "杉本達應",
  affiliation: [
    東京都立大学\ システムデザイン学部\ インダストリアルアート学科
  ],
  abstractJA: include "chapters/abstractJA.typ",
  abstractEN: include "chapters/abstractEN.typ"
)

#include "chapters/intro.typ"
#pagebreak()


#include "chapters/related_work.typ"
#pagebreak()

#include "chapters/concept.typ"
#pagebreak()

#include "chapters/system.typ"
#pagebreak()

#include "chapters/implementation.typ"
#pagebreak()

#include "chapters/conclusion.typ"
#pagebreak()

#bibliography("files/refs.yaml", title: "参考文献")
