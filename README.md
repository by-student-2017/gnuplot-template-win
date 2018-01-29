■ 使い方
1) xとyのデータが入ったファイルを用意します。
　ファイルの名前はどれでも良いですが、拡張子だけ".dat1"などとしてください。
　（dat1からdat6までのxとyの組を表示できるようにしています）
2) .dat1から.dat6と.batを同じファイルに入れます
3) .batのボタンを左クリック2回で図が作成されます。
4) 表示された画面を大きくしてpngなどで出力すれば完成です
（Screenshotはテスト画像です）

※xとyの2列だけのデータが入ったファイルをご用意されている場合は、.batの中でset y=2としてください。

※データはTabで区切られている方が、Excelにもコピー＆ペーストしやすくてお勧めです。
**************************************************************************
■ ファイルの説明

　国内の学会や投稿論文用のテンプレートを作成しました。

・Arialは学会用

・TNR（Times New Roman）は投稿論文用となります。

　JIMと付いたものは日本金属学会で用いた形式にしたものです。
Arial形式のものは他の学会（例えば、日本熱電学会、日本物理学会、日本応用物理学会、
放射光学会、PF討論会、日本原子力学会、準結晶研究会）などでも利用できます。

　投稿論文用のTNRは日本金属学会で用いた形式に作りましたが、
.batの中身を書き換えて利用すれば他の論文にも使えます。

　XRDに関するものについては、機能を盛り込みすぎたので、積極的に書き換えてください。
（ペイントやInkscape、パワーポイントを用いて凡例などを書き換えるほうが簡単です）
**************************************************************************
■ .batの書き換え方

a)  .batファイルを右クリックして編集を選択すれば書き換えられます。サクラダエディタ（無償）を用いるのもお勧めです。

b) rem を冒頭に書き入れるとコメントの行になります。[del env.txt]を[rem del env.txt]に書き換えると、env.txtが消されずに残り、gnuplot用の入力に対応します。.batをクリックすれば env.txtの内容を読み込んで図を描いてくれます。

c) #graph setting 以下の部分が図の縦軸横軸などに関するものです。gnuplotの形式になっていますので、webなどで調べて書き換えてください。特に、set xrange[*:*]やyrange[*:*]の*お具体的な数値にするなどだと思います。

d) その他1： 

　.dat1などで、x, y1, y2, ..., y6と複数のデータが記述されている場合は、.batのset x=1, set y=2の数値を書き換えると指定した列のデータを描画します。

e) その他2： 

　shirleyでは、.dat1のデータファイルで、x（束縛エネルギー）, y1（強度）, y2（Shirly法でのバックグラウンド）としてデータを入れてください。

f) その他3： 

　JIMと付いたものは縦軸と横軸の形式を揃えていますが、他のものは形式が異なっています。
　必要なら発表や投稿する学会の形式に統一してください。
　学会用にはArial以外にもHelveticaがよく使われます。どちらでも良いですが、
　形式は統一しておく必要があります。RIETANで有名な泉富士夫先生はArialを使うそうです。

g) その他4： 

・スペクトルを見せる場合：生データが重要なので、生データのまま出力します（スプライン関数などで滑らかにしない）。
　ピーク位置を知るために二回微分するときには、ザビツキーゴーレイ法などで滑らかにします。

・電気抵抗や比熱などデータ点が目で見て明確に分かれている場合：スプライン関数などで滑らかにしますので、そうなるようにしています。
　パワーポインタなどでデータの点を結んで滑らかにしても良いでしょう。
**************************************************************************
■ ライセンス
　MITライセンスですのでご自由にお使いください。
　多くの研究者のためにより便利なものを作成して頂けましたら幸いです。


