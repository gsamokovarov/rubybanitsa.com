# frozen_string_literal: true

class Talk < ApplicationRecord
  belongs_to :event
  has_and_belongs_to_many :speakers
  has_one_attached :presentation

  validates :title, presence: true

  def presentation_url = presentation.attached? ? Link.url_for(presentation) : url.presence
  def pdf_presentation? = presentation.attached? && presentation.blob.content_type == "application/pdf"

  def embedded_youtube_url
    return nil if url.blank?

    uri = URI(url)

    video_id =
      if uri.host&.include?("youtube.com")
        URI.decode_www_form(uri.query).to_h["v"]
      elsif uri.host&.include?("youtu.be")
        uri.path.remove("/")
      end

    "https://www.youtube.com/embed/#{video_id}" if video_id
  end
end
