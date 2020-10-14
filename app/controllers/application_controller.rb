class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def authenticate_current_user
    if params[:user_id]
      # その他関連付けられているモデルのコントローラの場合
      @user = User.friendly.find(params[:user_id])
    else
      # userコントローラの場合
      @user = User.friendly.find(params[:id])
    end

    unless current_user == @user || current_user.admin
      redirect_to user_path(@user), notice: t(:cant_change_info)
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # def default_url_options options = {}
  #    { locale: I18n.locale }.merge options
  # end
end
