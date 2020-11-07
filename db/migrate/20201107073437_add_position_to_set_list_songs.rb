class AddPositionToSetListSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :set_list_songs, :position, :integer
  end
end
