# app/serializers/list_item_serializer.rb

class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :category, :notes, :created_at, :updated_at
  belongs_to :venue, serializer: VenueSerializer
end
