class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_current_user
    if params[:user_id]
      # その他関連付けられているモデルのコントローラの場合
      @user = User.find(params[:user_id])
    else
      # userコントローラの場合
      @user = User.find(params[:id])
    end

    # これをunless current_user == @user || current_user.admin にしたい
    unless current_user == @user || current_user.name == 'gazayas'
      redirect_to user_path(@user), notice: '他人の情報を編集できません'
    end
  end
end
