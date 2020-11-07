class SetListSongsController < ApplicationController
  before_action :get_user
  before_action :set_set_list_song, only: [:edit, :update]
  before_action :get_set_list, only: [:create, :edit, :update]

  def index
  end

  def new
      @set_list_song = current_user.set_lists.build.set_list_songs.build
  end

  def edit
  end

  def create
    @set_list_song = @set_list.set_list_songs.build(set_list_song_params)
    # The set list song itself doesn't have a show page,
    # so it's redirected to the show action of the
    # set list it belongs to
    respond_to do |format|
      if @set_list_song.save
        format.html { redirect_to user_set_list_path(current_user, @set_list), notice: 'Song added to ' + @set_list.title }
        format.json { render :show, status: :created, location: @set_list_song }
      else
        # TODO: i18n
        error_str = locale == :en ? "This song already exists in this set list" : "この歌はもう既にこのセットリストに存在しています。"
        format.html { redirect_to user_set_list_path(current_user, @set_list), flash: { alert: error_str } }
        format.json { render json: @set_list_song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @set_list_song.update(set_list_song_params)
        format.html { redirect_to user_set_list_path(@user, @set_list), notice: 'Set list song was successfully updated.' }
        format.json { render :show, status: :ok, location: @set_list }
      else
        format.html { render :edit }
        format.json { render json: @set_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO: Delete through the edit page with an ajax call or some other method
  def destroy
    @set_list_song.destroy
  end

  private

  def set_set_list_song
    @set_list_song = SetListSong.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def get_set_list
    @set_list = SetList.find(params[:set_list_id])
  end

  def set_list_song_params
    params.require(:set_list_song).permit(:set_list_id, :song_id, :key, :order)
  end
end
