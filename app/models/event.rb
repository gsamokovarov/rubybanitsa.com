# frozen_string_literal: true

class Event < ApplicationRecord
  alias_attribute :published?, :published_at

  belongs_to :venue
  has_many :talks
  has_many :sponsorships
  has_many :companies, through: :sponsorships

  has_one_attached :ogp_image

  validates :time, presence: true
  validates :description, presence: true

  class << self
    def during(date)
      includes(:venue).where(published_at: date.to_time.all_year)
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
