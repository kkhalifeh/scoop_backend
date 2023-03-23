class User < ApplicationRecord
        # Associations
        has_many :lists, dependent: :destroy
        has_many :pins, dependent: :destroy
        has_many :list_items, through: :lists
      
        has_one_attached :profile_picture
      
        # Validations
        validates :email, presence: true, uniqueness: true
        # validates :username, presence: true, uniqueness: true
        validates :first_name, presence: true
        validates :last_name, presence: true
        # validates :mobile_number, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
end
      