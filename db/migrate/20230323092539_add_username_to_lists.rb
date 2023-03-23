class AddUsernameToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :username, :string
  end
end
