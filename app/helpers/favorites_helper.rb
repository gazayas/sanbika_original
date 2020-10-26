module FavoritesHelper

  # songs#show provides it's own parameters, but the parameters
  # change when the ajax call to the favorites controller is made.
  # This method helps get the correct parameters for displaying
  # and saving/deleting the Favorite star.
  def get_song_id_from_params
    case params[:controller]
    when "songs"
      params[:id]
    when "favorites"
      params[:song_id]
    end
  end
end
