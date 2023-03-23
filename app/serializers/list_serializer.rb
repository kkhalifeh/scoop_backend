class ListSerializer
  include FastJsonapi::ObjectSerializer

  set_type :list

  attributes :id, :created_at, :updated_at

  belongs_to :user
  belongs_to :city
  has_many :list_items, serializer: ListItemSerializer
  has_many :venues, through: :venues, serializer: VenueSerializer
end
