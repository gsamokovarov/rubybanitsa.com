# frozen_string_literal: true

class MeetupPublisher
  class << self
    def publish(event)
      instance.publush(event)
    end

    private

    def instance
      @instance ||= new('Ruby-Banitsa')
    end
  end

  def initialize(urlname)
    @urlname = urlname
  end

  def publish(event)
    info = EventInfo.new(event)

    Meetup.create_event urlname,
      name: info.human_title,
      description: MD.render_plain(info.description),
      time: info.time.to_i
  end

  private

  attr_reader :urlname
end
