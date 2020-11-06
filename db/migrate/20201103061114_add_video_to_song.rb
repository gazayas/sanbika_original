class AddVideoToSong < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :video, :string
  end
end
