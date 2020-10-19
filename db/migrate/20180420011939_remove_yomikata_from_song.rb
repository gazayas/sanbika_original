class RemoveYomikataFromSong < ActiveRecord::Migration[5.0]
  def change
  	remove_column :songs, :title_yomikata, :string
  	remove_column :songs, :artist_yomikata, :string
  end
end
