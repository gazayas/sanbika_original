class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_current_user, except: [:index, :show, :print]

  def index
    @user = User.friendly.find(params[:user_id])
    @songs = @user.songs.all
    # TODO: 普通は @songs = Song.all だけど、これはどうするかな。
    # songsだけのindexページがいいかもしれない
  end

  def show
    @user = User.friendly.find(params[:user_id])

    if @song.video && !@song.video.empty?
      @video_id = @song.video.gsub(/(.*)(watch\?v=)/, "")
    end
  end

  def new
    @user = User.friendly.find(params[:user_id])
    @song = @user.songs.build
  end

  def edit
    @song = Song.find(params[:id])
    @user = User.find(@song[:user_id])
  end

  def create
    @user = User.friendly.find(params[:user_id])
    @song = @user.songs.build(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to ([@user, @song]), notice: t(:song_created) }
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
        format.html { redirect_to ([@user, @song]), notice: t(:song_updated) }
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
      format.html { redirect_to user_path(@user), notice: t(:song_deleted) }
      format.json { head :no_content }
    end
  end

  def print
    @user = User.friendly.find(params[:user_id])
    @song = Song.find(params[:id])

    # この記事を参考にしました：http://ruby-rails.hatenadiary.com/entry/20140908/1410176894
    is_pdf = false

    respond_to do |format|
      format.html
      format.pdf do
        is_pdf = true
        html = render_to_string template: "songs/print"
        pdf = PDFKit.new(html, encoding: "UTF-8")

        send_data pdf.to_pdf,
          filename: "#{@song.id}.pdf",
          type: "application/pdf",
          disposition: "inline"
      end
    end

    if !is_pdf
      render layout: 'print'
    end
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :artist, :key, :song_body, :video)
    end
end
