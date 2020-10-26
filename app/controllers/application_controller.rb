class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

  # TODO: This is practically the same code in the sessions controller
  # "resource" here is the user that signed in
  # This calls #sign_in_and_redirect on the returned object,
  # so all we need to do is return the path here
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options options = {}
    { locale: I18n.locale }.merge options
  end
end
