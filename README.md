#賛美歌

##しないといけないこと
<ul>
	<li>最低限のcss</li>
	<li>before_action :authenticate, only: 何たらかんたら</li>
	<li>バリデーション（uniquenessをテストするテストもあればいいかもしれない...）</li>
	
	<li>mailerの日本語</li>
	<li>エラーぺージの実装（パーフェクトror２２２ぺージを参考に）</li>
	
	<li>文字のバリデーションがちょっとおかしい。Deviseで６文字が書いてあるけど、実際には５文字です</li>
	<li>nav-collapseのリストは表示されない...</li>
	<li>kaminari</li>
	<li>ユーザのdestroyはdeviseのどこにあるかな...</li>
	<li>賛美歌の漢字が合ってるかどうか、ボタンなどを確認すること</li>
	<li>key_change.jsとshow.html.erbのコードのリファクトリング</li>
	<li>nihonjinってgemをのnkfのメソッドを実装したらSong.rbのメソッドを消すことができる</li>

	<li>「あ」のボタンをクリックしたら、song_yomikata =~ /^あ/ の讃美歌チャートのリストを表示すること</li>
	<li>メールじゃなくてユーザ名でログインできるように（sessions_controller.rbで）</li>	
	<li>registrations_controller.rbにすべての必要なメソッドが実装してあるか確認すること（:name属性をUserモデルに追加したから）</li>
	<li>carrierwaveで画像追加ができるように</li>
	<li>今のシードデータではログインできない</li>
	<li>検索機能</li>
</ul>