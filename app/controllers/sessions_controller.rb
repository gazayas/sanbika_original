class SessionsController < Devise::SessionsController

  # 詳しい情報：
  # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

end
