class Category < ApplicationRecord
  has_many :place_categories
  has_many :places, through: :place_categories
end