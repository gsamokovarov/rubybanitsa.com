# frozen_string_literal: true

class EventInfo
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

  def address
    location&.address
  end

  def links?
    meetup_url.present? || facebook_url.present?
  end

  def upcoming_and_online?
    online_url.present? && Time.current.before?(time.end_of_day)
  end

  def joinable_today?
    time.all_day.include?(Time.current)
  end

  private

  def t(time_format)
    time.to_s(time_format)
  end
end
