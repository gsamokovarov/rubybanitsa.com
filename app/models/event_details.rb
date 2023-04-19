# frozen_string_literal: true

class EventDetails
  include SpeakerHelper

  delegate_missing_to :@event

  def initialize(event)
    @event = event
  end

  def summary
    description.lines.first
  end

  def human_date
    "#{t :weekday}, #{t :ordinal_day} of #{t :month_name}"
  end

  def human_time
    t :time_only
  end

  def human_datetime
    "#{human_date} at #{human_time} (#{time.time_zone.name})"
  end

  def title
    if name
      name
    elsif talk = talks.first
      speakers = talk.speakers.map(&:name).to_sentence(last_word_connector: " and ")
      "#{talk.title} by #{speakers}"
    else
      human_date
    end
  end

  def calendar_title
    "Ruby Banitsa - #{title}"
  end

  def calendar_description
    <<~DESCRIPTION
      #{description}

      Join: #{Link.join_url}
    DESCRIPTION
  end

  def venue
    location&.name
  end

  def venue_directions
    location&.directions
  end

  def online_only_venue?
    location&.online?
  end

  def address
    location&.address
  end

  def links?
    meetup_url.present? || facebook_url.present?
  end

  def joinable?
    online? && (1.hour.before(time) < Time.current)
  end

  def ogp_image_url
    Link.rails_blob_url(ogp_image) if ogp_image.attached?
  end

  private

  def t(time_format)
    time.to_fs(time_format)
  end
end
