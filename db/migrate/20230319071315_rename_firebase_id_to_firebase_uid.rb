class RenameFirebaseIdToFirebaseUid < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :firebase_id, :firebase_uid
  end
end
