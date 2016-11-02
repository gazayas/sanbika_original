class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @song = @user.songs.build # 合ってるかな
    @songs = @user.songs.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'ユーザは削除されました' }
      format.json { head :no_content }
    end
  end

end
