class Event < ApplicationRecord
  has_one :location

  validates :time, presence: true
  validates :description, presence: true

  def self.recent
    includes(location: :venue).order(time: :desc)
  end
end
