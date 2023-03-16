class List < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :list_items, dependent: :destroy
  has_many :venues, through: :list_items
  has_many :pins, dependent: :destroy

  validates :city, presence: true
end
