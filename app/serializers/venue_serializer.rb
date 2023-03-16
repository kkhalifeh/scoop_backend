class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :google_place_id, :phone_number, :website, :reservation_url, :image, :rating, :created_at, :updated_at
end
