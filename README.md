#賛美歌

###最重要
<ul>
	<li>before_action :authenticate, only: 何たらかんたら</li>
	<li>バリデーション（uniquenessをテストするテストもあればいいかもしれない...）</li>
	<li>印刷用のテンプレートを作ること</li>
</ul>

###重要
<ul>
        <li>has_many, dependent: :destroy がUser.rbで抜いてたんで別のモデルも適切な定義があるかどうか確認すること<\li>
	<li>songs/show.html.erbやprintのテンプレートの文字の大きさが気になる</li>
	<li>エラーぺージの実装（パーフェクトror２２２ぺージを参考に）</li>
	<li>user/#/songs/index.html.erbを変えること。表示が気になる。ボタンでなくていい</li>
	<li>文字のバリデーションがちょっとおかしい。Deviseで６文字が書いてあるけど、実際には５文字です</li>
	<li>nav-collapseのリストは表示されない...</li>
	<li>kaminari</li>
	<li>ユーザのdestroyはdeviseのどこにあるかな...</li>
	<li>賛美歌の漢字が合ってるかどうか、ボタンなどを確認すること</li>
	<li>nihonjinってgemをのnkfのメソッドを実装したらSong.rbのメソッドを消すことができる</li>
	<li>tinymceのイタリックのボタンを「♪」に変えられたらそうしたい
	<a href="https://www.tinymce.com/docs/demo/custom-toolbar-button/">（リンク）</a></li>
</ul>

###後でやっていい
<ul>
	<li>key_change.jsとshow.html.erbのコードのリファクトリング</li>
	<li>「あ」のボタンをクリックしたら、song_yomikata =~ /^あ/ の讃美歌チャートのリストを表示すること</li>
	<li>show.html.erbで作者の名前をhoverすると読み方が表示されること（今のところは、読み方が見える機能はない）</li>
	<li>メールじゃなくてユーザ名でログインできるように（sessions_controller.rbで）</li>
	<li>registrations_controller.rbにすべての必要なメソッドが実装してあるか確認すること（:name属性をUserモデルに追加したから）</li>
  <li>jsのテストを作る？capybaraがあるらしいけどもういいかな。パーフェクトrorの7章を参照に</li>
	<li>carrierwaveで画像追加ができるように</li>
	<li>今のシードデータではログインできない</li>
	<li>検索機能</li>
</ul>
