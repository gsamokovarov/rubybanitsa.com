# frozen_string_literal: true

class MeetupPublisher
  class << self
    def publish(event)
      instance.publish(event)
    end

    private

    def instance
      @instance ||= new("Ruby-Banitsa")
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

    if (location = response["Location"]).present?
      event.update_column :meetup_url, location
    end
  end

  private

  attr_reader :urlname
end
