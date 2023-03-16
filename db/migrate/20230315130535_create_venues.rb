class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.text :opening_times
      t.string :reservation_link
      t.string :api_reference_id

      t.timestamps
    end
  end
end
