class SetListSongsController < ApplicationController
  before_action :get_user
  before_action :get_set_list, only: [:create]

  def index
  end

  def new
      @set_list_song = current_user.set_lists.build.set_list_songs.build
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

  # TODO: Delete through the edit page with an ajax call or some other method
  def destroy
    @set_list_song.destroy
  end

  private

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
