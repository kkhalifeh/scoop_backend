class RemoveAuthorIdFromLists < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :author_id, :integer
  end
end
