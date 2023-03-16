class ListItem < ApplicationRecord
  # Set up associations between models
  belongs_to :list
  belongs_to :category
  belongs_to :venue

  # Ensure list, category, and venue are present for each list item
  validates :list, :category, :venue, presence: true

  # Ensure each venue can be added only once to a specific list
  validates :venue_id, uniqueness: { scope: :list_id }

end
