class CreateSetLists < ActiveRecord::Migration[6.0]
  def change
    create_table :set_lists do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
