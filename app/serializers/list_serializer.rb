class ListSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location_id, :pinned
  attribute :city do |list|
    list.location.city
  end
end
