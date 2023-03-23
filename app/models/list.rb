class List < ApplicationRecord
  # belongs_to :location
  belongs_to :location
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :list_places
  has_many :places, through: :list_places
  has_many :pins
  has_many :users, through: :pins
  has_many :place_categories
  has_many :categories, through: :place_categories
end