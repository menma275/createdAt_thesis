= システム構成

ここでは、前章で述べた設計について実現した具体的なハードウェア・ソフトウェア構成を示す。

== ハードウェア構成

本システムの主要コンポーネントに小型のコンピュータであるRaspberry Pi財団のシングルボードコンピュータRaspberry Pi Zero 2 W@raspberry_pi_zero_2_w_product_page を利用する。また、提示装置にはWaveshare社の7.5inch HD e-Paper HAT (B)@waveshare_7_5inch_hd_e_paper_hat_wiki を採用する。実際に生成に関わるコンポーネントは以上の2つであるが、制作する装置には加えて、実行するためのプッシュスイッチ、時刻・位置情報を鑑賞者に提示するための7セグメントLEDを搭載する。

== ソフトウェア構成

Raspberry Pi上で実行される描画のためのスクリプトはPythonによって記述する。描画に関わる変数として取得する値は、実行される時刻、実行される場所、実行ボタンが押される時間の3種類で、以下のように値を利用する。

- 時刻: UNIX Time
  + 実行された時刻を10進数のUNIX Timeとして取得
  + ハッシュ化によって2進数化
    - Pythonライブラリhashlib@python_docs_hashlib から提供される以下の11のハッシュ化手法を利用
      - md5
      - sha1
      - sha224
      - sha256
      - sha384
      - sha512
      - sha3_224
      - sha3_256
      - sha3_384
      - sha3_512
  + 画素情報とする
    - 2進数化した値を電子ペーパーのピクセル数を満たすまで複製
- 場所: 緯度経度
  + 実行された場所の緯度経度を2つの値として取得(lat, lng)
    - Pythonライブラリgeocoder@geocoder_readthedocs を利用
  - 時刻情報を2進数化するハッシュ化関数の選定
    - `(lat+lng)%11`によって得られる11種類の値からハッシュ化関数を決定
  - 描画表現の選定
    - `(lat+lng)%2===0`によって得られる真偽値から以下の描画処理から1つを選定
      + 2進数を電子ペーパーのピクセル数を満たすまで複製した配列
      + 1を元にPerlin Noise@elias_perlin_noise_model を利用して複雑化したもの
  - Perlin Noise使用時の変数決定
    - noiseScale
      - Perlin Noise全体のスケール率
      - `0.01 + ((lat+lng) - math.floor(lat+lng)) * 0.09`
    - noiseScaleX
      - Perlin Noise X軸のスケール率
      - `0.01 + ((lat) - math.floor(lat)) * 0.09`
    - noiseScaleY
      - Perlin Noise Y軸のスケール率
      - `0.01 + ((lng) - math.floor(lng)) * 0.09`
