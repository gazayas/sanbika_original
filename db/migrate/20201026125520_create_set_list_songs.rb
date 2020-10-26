class CreateSetListSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :set_list_songs do |t|
      t.string :key
      t.references :set_list, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
