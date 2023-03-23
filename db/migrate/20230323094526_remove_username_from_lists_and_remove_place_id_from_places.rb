class RemoveUsernameFromListsAndRemovePlaceIdFromPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :username, :string
    remove_column :places, :place_id, :string
  end

end
