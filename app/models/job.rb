# frozen_string_literal: true

class Job < ApplicationRecord
  has_many_attached :photos

  belongs_to :company
  has_many :contacts, through: :company

  validates :title, presence: true
  validates :description, presence: true

  delegate :logo, :thumbnail, to: :company

  def self.current(time = Time.current)
    where("publish_at < :time AND expires_at > :time", time:).shuffle
  end

  def followup
    JobFollowup.new(self).send
  end

  def remind
    JobReminder.new(self).send
  end

  def publish(options = {})
    return if published?

    options[:for] ||= 1.month
    options[:at] ||= Time.current

    update!(publish_at: options[:at], expires_at: options[:for].from_now)
  end

  def published?
    publish_at&.past?
  end

  def expired?
    expires_at&.past?
  end
end
