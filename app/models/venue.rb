class Venue < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :place_id, presence: true
end
