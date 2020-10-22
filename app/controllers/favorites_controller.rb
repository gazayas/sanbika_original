class FavoritesController < ApplicationController
    def create
      Favorite.create(favorite_params)
      Favorite.all
    end

    def destroy
      @favorite = Favorite.find(params[:id])

      # Song needs to be redifined since the params
      # get changed during the call to this controller
      @song = Song.find(@favorite.song_id)
      @favorite.destroy
    end

    private
    def favorite_params
      params.permit(:value, :user_id, :song_id)
    end
end
