# frozen_string_literal: true

class EventInfo
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

  private

  def t(time_format)
    time.to_s(time_format)
  end
end
