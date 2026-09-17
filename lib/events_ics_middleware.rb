# frozen_string_literal: true

class EventsIcsMiddleware
  CALENDAR_PROD_ID = "-//RubyBanitsa//Events//EN".freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    if request.get? && request.path == "/events.ics"
      events = Event
               .where(time: Time.current..)
               .where.not(published_at: nil)
               .order(:time)

      [
        200,
        {
          "Content-Type" => "text/calendar; charset=utf-8",
          "Content-Disposition" => 'attachment; filename="events.ics"'
        },
        [render_calendar(events)]
      ]
    else
      @app.call(env)
    end
  end

  private

  def render_calendar(events)
    lines = [
      "BEGIN:VCALENDAR",
      "VERSION:2.0",
      "PRODID:#{CALENDAR_PROD_ID}",
      "CALSCALE:GREGORIAN",
      "METHOD:PUBLISH"
    ]

    events.each do |event|
      start_time = event.time.utc

      lines += [
        "BEGIN:VEVENT",
        "UID:#{event.id}-#{start_time.strftime('%Y%m%d%H%M%S')}@rubybanitsa.com",
        "DTSTAMP:#{Time.current.utc.strftime('%Y%m%dT%H%M%SZ')}",
        "DTSTART:#{start_time.strftime('%Y%m%dT%H%M%SZ')}",
        "SUMMARY:#{escape(event.name.presence || 'RubyBanitsa Meetup')}",
        "LOCATION:#{escape(location(event))}",
        "DESCRIPTION:#{escape(event.description.presence || '')}",
        "URL:https://rubybanitsa.com/events/#{event.id}",
        "END:VEVENT"
      ]
    end

    lines << "END:VCALENDAR"
    lines.join("\r\n") + "\r\n"
  end

  def location(event)
    venue = event.venue
    [venue&.name.presence, venue&.address.presence].compact.join(", ")
  end

  def escape(value)
    value.to_s
         .gsub(/\\/) { "\\" }
         .gsub(/[;,\n\r]/) { |char| "\\#{char}" }
  end
end
