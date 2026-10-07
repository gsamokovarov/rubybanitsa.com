# frozen_string_literal: true

class Job < ApplicationRecord
  has_many_attached :photos
  has_one_attached :ogp_image

  belongs_to :company
  has_many :contacts, through: :company

  validates :title, presence: true
  validates :description, presence: true

  delegate :logo, :thumbnail, to: :company

  def self.current(time = Time.current)
    where("publish_at < :time AND expires_at > :time", time:).order(publish_at: :desc)
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

  def ogp_image_url
    if ogp_image.attached?
      Link.rails_storage_proxy_url(ogp_image)
    elsif logo.attached?
      Link.rails_storage_proxy_url(logo)
    end
  end
end
