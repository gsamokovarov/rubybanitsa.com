class Event < ApplicationRecord
  has_one :location

  validates :time, presence: true
  validates :description, presence: true
end
