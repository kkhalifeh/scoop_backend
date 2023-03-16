class Category < ApplicationRecord
  has_many :list_items, dependent: :destroy
  has_many :lists, through: :list_items

  validates :name, presence: true, uniqueness: true
end
