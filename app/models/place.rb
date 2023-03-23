class Place < ApplicationRecord
  has_many :list_places
  has_many :lists, through: :list_places
  has_many :place_categories
  has_many :categories, through: :place_categories
end
