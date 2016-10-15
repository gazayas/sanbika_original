#賛美歌

##しないといけないこと
<ul>
	<li>バリデーション（uniquenessをテストするテストもあればいいかもしれない...）</li>
	<li>エラーぺージの実装（パーフェクトror２２２ぺージを参考に）</li>

	<li>nav-collapseのリストは表示されない...</li>
	<li>before_action :authenticate, only: 何たらかんたら</li>
	<li>mailerの日本語</li>
	<li>kaminari</li>
	<li>ユーザのdestroyはdeviseのどこにあるかな...</li>
	<li>文字のバリデーションがちょっとおかしい。Deviseで６文字が書いてあるけど、実際には５文字です</li>
	<li>賛美歌の漢字が合ってるかどうか、ボタンなどを確認すること</li>
	<li>key_change.jsとshow.html.erbのコードのリファクトリング</li>
	<li>Song.rbのrequire 'nkf'は正しい場所にあるかどうか試すこと</li>

	<li>「あ」のボタンをクリックしたら、song_yomikata =~ /^あ/ の讃美歌チャートのリストを表示すること</li>
	<li>メールじゃなくてユーザ名でログインできるように（sessions_controller.rbで）</li>	
	<li>registrations_controller.rbにすべての必要なメソッドが実装してあるか確認すること（:name属性をUserモデルに追加したから）</li>
	<li>carrierwaveで画像追加ができるように</li>
	<li>今のシードデータではログインできない</li>
	<li>検索機能</li>
</ul>