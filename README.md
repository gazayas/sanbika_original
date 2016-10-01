#賛美歌

##しないといけないこと
<ul>
	<li>バリデーション（uniquenessをテストするテストもあればいいかもしれない...）</li>
	<li>gem nihonjinを使ってtitle_yomikataにはカタカナがあればそれをひらがなにする。また空白があればそれを消す。それをモデルに入れる</li>
	<li>key_change.js</li>
	<li>before_action :authenticate, only: 何たらかんたら</li>
	<li>tinymceのブランチ（gemを使うこと）</li>
	<li>kaminari</li>
	<li>navbarの下にある空白の修正</li>
	<li>carrierwaveで画像追加ができるように</li>
	<li>エラーぺージの実装（パーフェクトror２２２ぺージを参考に）</li>
	<li>nav-collapseのリストは表示されない...</li>
	<li>registrations_controller.rbにすべての必要なメソッドが実装してあるか確認すること（:name属性をUserモデルに追加したから）</li>
	<li>メールじゃなくてユーザ名でログインできるように（sessions_controller.rbで）</li>
	<li>mailerの日本語</li>
	<li>文字のバリデーションがちょっとおかしい。Deviseで６文字が書いてあるけど、実際には５文字です</li>
	<li>ユーザのdestroyはdeviseのどこにあるかな...</li>
	<li>今のシードデータではログインできない</li>
	<li>検索機能</li>
</ul>


##考えないといけないのは
「*」を使うこと。<br/>
tinymceが使いたいけど、空白の問題があるから難しい<br/>
色々頑張ってみたけど、解決方法が見つからず諦めた。<br/>
大体は何がしたいか分かってるから、今回はStackOverflowに聞いてみたら<br/>
解決できるかもしれない。<br/><br/>

それによって、データベースのレコードが左右するから、もしそれが解決できたら、サイトを公開できる。
