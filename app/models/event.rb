# frozen_string_literal: true

class Event < ApplicationRecord
  alias_attribute :published?, :published_at

  has_one :location, dependent: :destroy
  has_one :venue, through: :location
  has_many :talks
  has_many :sponsorships
  has_many :companies, through: :sponsorships

  validates :time, presence: true
  validates :description, presence: true

  # Introduces venue_id{=,} for an administrate form hookup.
  delegate :id, :id=, to: :venue, prefix: true, allow_nil: true

  class << self
    def during(time)
      includes(location: :venue).where(published_at: time.all_year)
    end

    def this_year
      during(Time.current)
    end

    def upcoming
      this_year
        .where("published_at IS NOT NULL AND time >= :today", today: Date.today)
        .order(time: :asc)
        .first
    end

    def current
      this_year.find_by(time: Date.today.all_day)
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

  def online?
    online_url.present?
  end

  def publish(time = Time.current)
    return if published?

    yield if block_given?

    update!(published_at: time)
  end
end
