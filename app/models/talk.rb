# frozen_string_literal: true

class Talk < ApplicationRecord
  belongs_to :event
  has_and_belongs_to_many :speakers

  validates :title, presence: true

  def embedded_youtube_url
    return nil if url.blank?

    uri = URI(url)

    video_id =
      if uri.host&.include?("youtube.com")
        URI.decode_www_form(uri.query).to_h["v"]
      elsif uri.host&.include?("youtu.be")
        uri.path.remove("/")
      end

    return nil unless video_id

    "https://www.youtube.com/embed/#{video_id}"
  end
end
