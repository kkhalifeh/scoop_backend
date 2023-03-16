class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :user, :list, presence: true
  validates :list_id, uniqueness: { scope: :user_id }
end
