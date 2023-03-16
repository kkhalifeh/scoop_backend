class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.references :list, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.text :notes
      t.integer :position

      t.timestamps
    end
  end
end