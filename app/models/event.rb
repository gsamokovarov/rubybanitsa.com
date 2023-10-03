# frozen_string_literal: true

class Event < ApplicationRecord
  alias_attribute :published?, :published_at

  belongs_to :venue
  has_many :talks
  has_many :speakers, through: :talks
  has_many :sponsorships
  has_many :companies, through: :sponsorships

  has_one_attached :ogp_image

  validates :time, presence: true
  validates :description, presence: true

  class << self
    def during(date)
      includes(:venue, talks: :speakers).where(published_at: date.to_time.all_year)
    end

    def upcoming
      during(Time.current)
        .where("published_at IS NOT NULL AND time >= :today", today: Date.current)
        .order(time: :asc)
        .first
    end

    def current
      during(Time.current).find_by(time: Date.today.all_day)
    end

    def recent(limit)
      includes(:venue, talks: :speakers)
        .where("time < ?", Date.current.beginning_of_day)
        .order(time: :desc)
        .limit(limit)
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
