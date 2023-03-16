class Venue < ApplicationRecord
  has_many :list_items, dependent: :destroy
  has_many :lists, through: :list_items

  validates :name, presence: true
  validates :address, presence: true
  validates :google_place_id, presence: true, uniqueness: true
  # Add validations for the new attributes if needed, for example:
  # validates :phone_number, presence: true
  # validates :website, presence: true, format: { with: URI::regexp(%w[http https]) }

  def self.search(query, location)
    # Implement the search method to fetch venues from Google Places API
  end
end
