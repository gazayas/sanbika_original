class SetListSongsController < ApplicationController
  before_action :get_user
  before_action :get_set_list

  def index
  end

  def create
    @SetListSong = @user.set_lists.build.set_list_songs.build

    # The set list song itself doesn't have a show page,
    # so it's redirected to the show action of the
    # set list it belongs to
    respond_to do |format|
      if @set_list_song.save
        format.html { redirect_to user_set_list_path(@user, @set_list), notice: 'Song added to ' + @set_list.title }
        format.json { render :show, status: :created, location: @set_list_song }
      else
        format.html { render :new }
        format.json { render json: @set_list.errors, status: :unprocessable_entity }
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
    params.require(:set_list).permit(:set_list_id, :song_id)
  end
end
