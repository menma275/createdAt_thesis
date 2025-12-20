= システム構成
== ハードウェア構成
- ビジュアル生成に関する主なコンポーネント
  - Raspberry Pi
    - 場所・時間・実行者の情報をもとにビジュアルを決定
  - 電子ペーパー
    - 生成されたビジュアルの提示
- 展示にまつわる補完的なコンポーネント
    - 赤色7セグメントLED
      - 場所・時間・実行者の情報を提示
== ソフトウェア構成
- Python
- ビジュアル表現にかかる変数
  - selectHash, pixelSize, noiseScale, noiseScaleX, noiseScaleY
  - シード値のbit化およびhash化によるbinary情報を電子ペーパーの白黒2値情報に置き換えて提示
    - selectHash: 単純bit化およびhash手法の選択にまつわる変数
  - パターン表現
    - 1ピクセルに1つの値（01）が入り、それらがパターンを構成する
      - pixelSize: 拡大表現としてnピクセルの正方形ボックス単位でもパターンを提示可能
  - 有機表現
    - パターン表現を元にPerlin Noiseを作成
      - noiseScale: 全体の拡大倍率の変数
      - noiseScaleX, noiseScaleY: x, y座標を決定する変数
- ビジュアル表現にかかるシード値（これらを上記変数に割り当てる）
    - 場所情報
      - geocoder
    - 時間情報
      - UNIX Time
    - 実行者情報
        - 未確定
