class FavoritesController < ApplicationController
    # Make these both ajax calls on the click of a button
    def create
    end

    def delete
    end

    private

    # strong parameters
    def favorite_params
        params.require(:favorite).permit(:value)
    end
end
