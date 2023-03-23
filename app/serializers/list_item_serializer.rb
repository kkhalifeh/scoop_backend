class ListItemSerializer
  include FastJsonapi::ObjectSerializer

  set_type :list_item

  attribute :id
  attribute :list_id
  attribute :category_id
  attribute :venue_id
  attribute :notes
  attribute :position

  belongs_to :list, record_type: :list
  belongs_to :category, record_type: :category
  belongs_to :venue, record_type: :venue, serializer: VenueSerializer
end
