# frozen_string_literal: true

class Event < ApplicationRecord
  alias_attribute :published?, :published_at

  has_one :location, dependent: :destroy
  has_one :venue, through: :location
  has_many :talks

  validates :time, presence: true
  validates :description, presence: true

  # Introduces venue_id{=,} for an administrate form hookup.
  delegate :id, :id=, to: :venue, prefix: true, allow_nil: true

  class << self
    def current
      includes(location: :venue).where("published_at <= ?", Time.current).order(time: :desc)
    end

    def upcoming
      current.find_by("published_at <= :now AND time >= :now", now: Time.current)
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
    return if published?

    yield if block_given?

    update!(published_at: time)
  end
end
