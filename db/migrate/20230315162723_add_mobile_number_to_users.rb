class AddMobileNumberToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mobile_number, :string

    # Adding an index to the mobile_number to ensure uniqueness
    add_index :users, :mobile_number, unique: true
  end
end
