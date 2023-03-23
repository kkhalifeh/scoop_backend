class PlaceCategory < ApplicationRecord
  belongs_to :place
  belongs_to :category
  belongs_to :list
end
