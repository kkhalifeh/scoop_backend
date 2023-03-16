class RemoveCityFromLists < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :city, :string
  end
end
