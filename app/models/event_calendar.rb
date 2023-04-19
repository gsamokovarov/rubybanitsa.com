# frozen_string_literal: true

module EventCalendar
  extend self

  ORGANIZER_EMAIL = "genadi@hey.com"
  EVENT_DURATION = 1.hour

  def for(event)
    info = EventDetails.new(event)

    calendar = Icalendar::Calendar.new
    calendar.event do |e|
      tzid = event.time.time_zone.tzinfo.name

      e.dtstart = Icalendar::Values::DateTime.new(event.time, tzid:)
      e.dtend = Icalendar::Values::DateTime.new(event.time + EVENT_DURATION, tzid:)
      e.organizer = Icalendar::Values::CalAddress.new("mailto:#{ORGANIZER_EMAIL}", cn: ORGANIZER_EMAIL)
      e.attendee = Icalendar::Values::CalAddress.new("mailto:#{ORGANIZER_EMAIL}", cn: ORGANIZER_EMAIL)
      e.url = Link.event_url(event)
      e.summary = info.calendar_title
      e.description = MD.render_plain(info.calendar_description)
    end

    calendar.to_ical
  end
end
