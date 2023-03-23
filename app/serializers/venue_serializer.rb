class VenueSerializer
  include FastJsonapi::ObjectSerializer

  set_type :venue

  attributes :id, :name, :address, :phone_number, :opening_times, :created_at, :updated_at, :google_place_id, :website, :reservation_url, :image, :rating
end
