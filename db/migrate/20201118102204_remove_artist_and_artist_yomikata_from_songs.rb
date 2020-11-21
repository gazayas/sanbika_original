class RemoveArtistAndArtistYomikataFromSongs < ActiveRecord::Migration[6.0]
  def change
  	remove_column :songs, :artist, :string
  	remove_column :songs, :artist_yomikata, :string
  end
end
