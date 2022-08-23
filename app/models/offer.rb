class Offer < ApplicationRecord
  CATEGORIES = ["babysitting", "cooking", "baking", "knitting", "boardgames", "walk"]
  WEEKDAYS = ["Monday😫", "Tuesday😒", "Wednesday🐸", "Thursday🤠", "Friday🥳", "Saturday🐗", "Sunday⛪"]
  belongs_to :user
  validates :name, :location, :description, :category, :availability, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :availability, inclusion: { in: WEEKDAYS}
end
