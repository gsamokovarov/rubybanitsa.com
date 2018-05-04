class Event < ApplicationRecord
  cattr_accessor :publisher, default: Publisher.new(MeetupPublisher)
  alias_attribute :published?, :published_at

  has_one :location, dependent: :destroy
  has_one :venue, through: :location
  has_many :talks

  validates :time, presence: true
  validates :description, presence: true

  # Introduces venue_id{=,} for an administrate form hookup.
  delegate :id, :id=, to: :venue, prefix: true, allow_nil: true

  class << self
    def past
      includes(location: :venue).order(time: :desc).where('time < ?', Time.current)
    end

    def upcoming
      includes(location: :venue).order(time: :desc).where('time >= ?', Time.current).first
    end

    def create_with_venue(attributes)
      transaction do
        venue_id = attributes.delete(:venue_id)

        create!(attributes) do |event|
          Location.create!(event: event, venue_id: venue_id)
        end
      end
    end
  end

  def upcoming?
    time.future?
  end

  def publish(time = Time.current)
    with_lock do
      return if published?

      publisher.publish(self)
      update!(published_at: time)
    end
  end
end
