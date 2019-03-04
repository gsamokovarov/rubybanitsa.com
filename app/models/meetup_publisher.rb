# frozen_string_literal: true

class MeetupPublisher
  cattr_accessor :event_slug

  class << self
    delegate :published?, :publish, to: :instance

    private def instance
      @instance ||= new(event_slug)
    end
  end

  def initialize(urlname)
    @urlname = urlname
  end

  def published?(event)
    event.meetup_url.presence || event.meetup_published_at
  end

  def publish(event)
    return if published?(event)

    info = EventInfo.new(event)

    response = Meetup.create_event urlname,
      name: "Ruby Banitsa - #{info.human_date}",
      description: MD.render_plain(info.description),
      time: info.time

    event.update_columns \
      meetup_url: rewrite(response["Location"]),
      meetup_published_at: Time.current
  end

  private

  attr_reader :urlname

  def rewrite(location)
    String(location).remove("api.")
  end
end
