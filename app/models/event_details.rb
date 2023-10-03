# frozen_string_literal: true

class EventDetails
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

  def human_datetime(format = :medium)
    if format == :short
      "#{time.strftime('%e %B')} at #{human_time}"
    elsif format == :long
      "#{human_date} at #{human_time} (#{time.time_zone.name})"
    else
      "#{human_date} at #{human_time}"
    end
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

  def links?
    meetup_url.present? || facebook_url.present?
  end

  def joinable?
    online? && Time.current.between?(1.hour.before(time), time.end_of_day)
  end

  def ogp_image_url
    Link.rails_blob_url(ogp_image) if ogp_image.attached?
  end

  private

  def t(time_format)
    time.to_fs(time_format)
  end
end
