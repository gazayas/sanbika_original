class SessionsController < Devise::SessionsController
  # ログインではメールじゃなくてユーザー名でログインしてほしいのでカスタムのコントローラを作りました
  # http://easyramble.com/cutomize-controllers-on-rails-devise.html
=begin
  def sign_in(user)
    user = User.find_by_name(name)
    if user.password == password
      session[:id] ||= user.id
      redirect_to user_path
    else
      redirect_to root_path
    end
  end
=end

end
