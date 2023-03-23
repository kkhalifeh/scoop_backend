class User < ApplicationRecord
        # Associations
      
        has_one_attached :profile_picture
      
        # Validations
        validates :email, presence: true, uniqueness: true
        # validates :username, presence: true, uniqueness: true
        validates :first_name, presence: true
        validates :last_name, presence: true
        # validates :mobile_number, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
        has_many :pins
        has_many :lists, through: :pins
end
      