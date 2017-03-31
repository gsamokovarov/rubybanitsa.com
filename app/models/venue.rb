class Venue < ApplicationRecord
  validates :description, presence: true
  validates :address, presence: true
  validates :latitude, :longitude, presence: true
end
