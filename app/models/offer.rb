class Offer < ApplicationRecord
  belongs_to :user
  validates :name, :location, :description, :category, :availability, presence: true
end
