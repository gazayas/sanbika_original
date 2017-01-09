#賛美歌

以下はIssuesに入るべきなのですが、色々解決しながら、issuesに投稿したりreadmeから消したりするつもりです

###最重要
<ul>
	<li>before_action :authenticate, only: 何たらかんたら（大丈夫だと思うけど）</li>
	<li>バリデーションを再度確認</li>
	<li>carrierwaveをgemfileに入れて画像が投稿できるようにすること</li>
  <li>これ以上進む前に、コードとテストをキレイにすること</li>
</ul>

###重要
<ul>
  <li>has_many, dependent: :destroy がUser.rbで抜いてたんで別のモデルも適切な定義があるかどうか確認すること<\li>
  <li>user/#/songs/index.html.erbを変えること。表示が気になる。ボタンでなくていい</li>
  <li>tinymceのイタリックのボタンを「♪」に変えられたらそうしたい
  <a href="https://www.tinymce.com/docs/demo/custom-toolbar-button/">（リンク）</a></li>
  <li>nav-collapseのリストは表示されない...</li>
  <li>エラーぺージの実装（パーフェクトror２２２ぺージを参考に。publicダイレクトリを見ればいい）</li>
  <li>ApplicationHelperの#adminを変えて、モデルの方にadmin属性を追加すること（真偽にすること）</li>

  <italic>deviseに関する課題</italic>
  <li>アカウント登録で「名前」じゃなくて「ユーザー名」を実装すること</li>
  <li>メールじゃなくてユーザ名でログインできるように（sessions_controller.rbで）</li>
	<li>devise_create_users.rbのマイグレーションで39行目（confirmation_token）はコメントアウトされてる。それって大丈夫？</li>
	<li>文字のバリデーションがちょっとおかしい。Deviseで６文字が書いてあるけど、実際には５文字です</li>
	<li>ユーザのdestroyはdeviseのどこにあるかな...</li>
</ul>

###後でやっていい
<ul>
	<li>key_change.jsとshow.html.erbのコードのリファクトリング</li>
	<li>「あ」のボタンをクリックしたら、song_yomikata =~ /^あ/ の讃美歌チャートのリストを表示すること</li>
	<li>show.html.erbで作者の名前をhoverすると読み方が表示されること（今のところは、読み方が見える機能はない）</li>
	<li>registrations_controller.rbにすべての必要なメソッドが実装してあるか確認すること（:name属性をUserモデルに追加したから）</li>
  	<li>jsのテストを作る？capybaraがあるらしいけどもういいかな。パーフェクトrorの7章を参照に</li>
	<li>今のシードデータではログインできない</li>
	<li>検索機能</li>
</ul>
