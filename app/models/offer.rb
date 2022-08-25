class Offer < ApplicationRecord

  CATEGORIES = ["babysitting", "cooking", "baking", "knitting", "boardgames", "walk"]
  WEEKDAYS = ["Monday😫", "Tuesday😒", "Wednesday🐸", "Thursday🤠", "Friday🥳", "Saturday🐗", "Sunday⛪"]
  belongs_to :user
  validates :name, :address, :description, :category, :availability, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :availability, inclusion: { in: WEEKDAYS }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :availability, inclusion: { in: WEEKDAYS}

  include PgSearch::Model
  pg_search_scope :search_by_category_and_availability_and_address,
    against: [ :category, :availability, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
