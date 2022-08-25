class Offer < ApplicationRecord
  CATEGORIES = ["babysitting", "cooking", "baking", "knitting", "boardgames", "walk"]
  WEEKDAYS = ["Monday😫", "Tuesday😒", "Wednesday🐸", "Thursday🤠", "Friday🥳", "Saturday🐗", "Sunday⛪"]
  belongs_to :user
  validates :name, :location, :description, :category, :availability, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :availability, inclusion: { in: WEEKDAYS}

  include PgSearch::Model
  pg_search_scope :search_by_category_and_availability_and_location,
    against: [ :category, :availability, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
