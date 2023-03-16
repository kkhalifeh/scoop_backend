class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
