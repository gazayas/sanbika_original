class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.boolean :value
      t.song :references
      t.string :references
      t.string :user

      t.timestamps
    end
  end
end
