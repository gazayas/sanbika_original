class RemoveOrderFromSetListSongs < ActiveRecord::Migration[6.0]
  def change
    remove_column :set_list_songs, :order, :integer
  end
end
