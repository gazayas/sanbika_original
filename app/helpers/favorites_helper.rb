module FavoritesHelper

  # The song#show page provides params,
  # but the params change when a call is made
  # to the favorites controller
  def get_song_id_from_params
    case params[:controller]
    when "songs"
      params[:id]
    when "favorites"
      params[:song_id]
    end
  end
end
