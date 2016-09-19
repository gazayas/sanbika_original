class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :title_yomikata
      t.string :artist
      t.string :artist_yomikata
      t.string :key
      t.text :song_body
      t.integer :user_id

      t.timestamps
    end
  end
end
