class AddCityRefToLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :lists, :city, null: false, foreign_key: true
  end
end
