class SetListSongsController < ApplicationController
  before_action :get_user

  def index
  end

  def new
      @set_list_song = current_user.set_lists.build.set_list_songs.build
  end

  def create
    @SetListSong = current_user.set_lists.build.set_list_songs.build

    # The set list song itself doesn't have a show page,
    # so it's redirected to the show action of the
    # set list it belongs to
    respond_to do |format|
      if @set_list_song.save
        format.html { redirect_to user_set_list_path(current_user, @set_list), notice: 'Song added to ' + @set_list.title }
        format.json { render :show, status: :created, location: @set_list_song }
      else
        format.html { render :new }
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

  def set_list_song_params
    params.require(:set_list).permit(:set_list_id, :song_id)
  end
end
