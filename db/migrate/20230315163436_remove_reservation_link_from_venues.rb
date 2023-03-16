class RemoveReservationLinkFromVenues < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :reservation_link, :string
  end
  
end
