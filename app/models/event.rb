class Event < ApplicationRecord
  has_one :location, dependent: :destroy
  has_one :venue, through: :location
  has_many :talks

  validates :time, presence: true
  validates :description, presence: true

  # Introduces venue_id{=,} for an administrate form hookup.
  delegate :id, :id=, to: :venue, prefix: true, allow_nil: true

  scope :recent, -> { includes(location: :venue).order(time: :desc) }

  def self.create_with_venue(attributes)
    transaction do
      venue_id = attributes.delete(:venue_id)

      create!(attributes) do |event|
        Location.create!(event: event, venue_id: venue_id)
      end
    end
  end
end
