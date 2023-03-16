class UpdateVenuesSchema < ActiveRecord::Migration[7.0]
  def change
    # Remove the 'api_reference_id' column
    remove_column :venues, :api_reference_id

    # Rename the 'phone' column to 'phone_number'
    rename_column :venues, :phone, :phone_number

    # Add the 'google_place_id', 'website', 'reservation_url', 'image', and 'rating' columns
    add_column :venues, :google_place_id, :string, unique: true
    add_column :venues, :website, :string
    add_column :venues, :reservation_url, :string
    add_column :venues, :image, :string
    add_column :venues, :rating, :float

    # Add a unique index for the 'google_place_id' column
    add_index :venues, :google_place_id, unique: true
  end
end
