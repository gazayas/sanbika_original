class FavoritesController < ApplicationController
    before_action :set_song, only: [:create, :destroy]

    def create
      Favorite.create(favorite_params)
      Favorite.all
    end

    def destroy
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
    end

    private

    # The params change depending on the callback,
    # So this code preps the song accordingly.
    def set_song
      if params[:action] == "destroy"
        song_id = Favorite.find(params[:id]).song_id
      else
        song_id = params[:song_id]
      end

      @song = Song.find(song_id)
    end

    def favorite_params
      params.permit(:value, :user_id, :song_id)
    end
end
