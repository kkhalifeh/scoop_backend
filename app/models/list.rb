class List < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :list_items, dependent: :destroy
  has_many :venues, through: :list_items
  has_many :pins, dependent: :destroy

  validates :city, presence: true

  # Method to get number of pins for the list
  def pins_count
    list_items.count
  end
end
