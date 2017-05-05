class Venue < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, :longitude, presence: true
end
