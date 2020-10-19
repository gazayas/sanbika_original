class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_from :facebook
  end

  def twitter
    callback_from :twitter
  end

  def google_oauth2
    callback_from :google_oauth2
  end

  def callback_from provider
    if provider == :twitter
      @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    else
      @user = User.from_omniauth(request.env["omniauth.auth"])
    end

    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end
