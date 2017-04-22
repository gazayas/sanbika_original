class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_current_user, except: [:index, :show, :print]

  def index
    @user = User.find(params[:user_id])
    @songs = @user.songs.all
    # TODO: 普通は @songs = Song.all だけど、これはどうするかな。
    # songsだけのindexページがいいかもしれない
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @song = @user.songs.build
  end

  def edit
    @song = Song.find(params[:id])
    @user = User.find(@song[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @song = @user.songs.build(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to ([@user, @song]), notice: '讃美歌チャートは作成されました' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(@song[:user_id])

    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to ([@user, @song]), notice: '讃美歌チャートは更新されました' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(@song[:user_id])
    @song.destroy
    respond_to do |format|
      format.html { redirect_to user_songs_path(@user), notice: '讃美歌チャートは削除されました' }
      format.json { head :no_content }
    end
  end

  def print
    @user = User.find(params[:user_id])
    @song = Song.find(params[:id])
    render layout: 'print'
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :title_yomikata, :artist, :artist_yomikata, :key, :song_body)
    end
end
