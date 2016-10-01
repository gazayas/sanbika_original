class SessionsController < Devise::SessionsController
  # ログインではメールじゃなくてユーザー名でログインしてほしいのでカスタムのコントローラを作りました
  # http://easyramble.com/cutomize-controllers-on-rails-devise.html
  def sign_in(user)
    session[:id] ||= user.id # 何たらかんたら
  end
end
