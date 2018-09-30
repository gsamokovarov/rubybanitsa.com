# frozen_string_literal: true

class Job < ApplicationRecord
  has_many_attached :photos

  belongs_to :company
  has_many :contacts, through: :company

  validates :title, presence: true
  validates :description, presence: true

  delegate :logo, :thumbnail, to: :company

  def self.current(time = Time.current)
    where("published_at < :time AND expires_at > :time", time: time).shuffle
  end

  def followup
    JobFollowup.new(self).send
  end

  def publish(options = {})
    return if published?

    options[:for] ||= 1.month
    options[:at] ||= Time.current

    update!(published_at: options[:at], expires_at: options[:for].from_now)
  end

  def published?
    published_at&.past?
  end

  def expired?
    expires_at&.past?
  end
end
