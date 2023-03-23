class RemoveUidIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, [:uid, :provider]
    add_index :users, :uid, unique: true
  end
end
