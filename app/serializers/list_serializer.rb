class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :user_id, :pins_count
  has_many :list_items
  belongs_to :user
end
