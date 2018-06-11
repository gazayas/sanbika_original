class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :song, foreign_key: true
      t.integer :stars
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
