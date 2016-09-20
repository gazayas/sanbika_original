class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @song = @user.songs.build # 合ってるかな
    @songs = @user.songs.all
  end

end
