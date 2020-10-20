class FavoritesController < ApplicationController
    # Make these both ajax calls on the click of a button
    def new
    end

    def create
      Favorite.create(favorite_params)
      Favorite.all
    end

    def destroy
      @favorite = Favorite.where(song_id: params[:id], user_id: current_user.id).first
      @favorite.destroy
    end

    private

    # strong parameters
    def favorite_params
        params.permit(:value, :user_id, :song_id)
    end
end
