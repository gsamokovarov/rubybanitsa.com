class Event < ApplicationRecord
  has_one :venue, through: :event_venues

  validates :time, presence: true
  validates :description, presence: true
end
