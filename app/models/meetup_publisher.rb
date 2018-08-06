# frozen_string_literal: true

class MeetupPublisher
  cattr_accessor :event_slug

  class << self
    def publish(event)
      instance.publish(event)
    end

    private

    def instance
      @instance ||= new(event_slug)
    end
  end

  def initialize(urlname)
    @urlname = urlname
  end

  def publish(event)
    info = EventInfo.new(event)

    response = Meetup.create_event urlname,
      name: info.human_date,
      description: MD.render_plain(info.description),
      time: info.time

    event.update_column :meetup_url, rewrite(response["Location"])
  end

  private

  attr_reader :urlname

  def rewrite(location)
    String(location).remove("api.")
  end
end
