# frozen_string_literal: true

module EventCalendar
  extend self

  ORGANIZER = "Genadi Samokovarov"
  ORGANIZER_EMAIL = "mailto:genadi@hey.com"

  EVENT_DURATION = 1.hour

  def for(event)
    info = EventInfo.new(event)

    calendar = Icalendar::Calendar.new
    calendar.event do |e|
      tzid = event.time.time_zone.tzinfo.name

      e.dtstart = Icalendar::Values::DateTime.new(event.time, tzid: tzid)
      e.dtend = Icalendar::Values::DateTime.new(event.time + EVENT_DURATION, tzid: tzid)
      e.organizer = Icalendar::Values::CalAddress.new(ORGANIZER_EMAIL, cn: ORGANIZER)
      e.attendee = Icalendar::Values::CalAddress.new(ORGANIZER_EMAIL, cn: ORGANIZER)
      e.url = Link.event_url(event)
      e.summary = info.calendar_title
      e.description = MD.render_plain(info.calendar_description)
    end

    calendar.to_ical
  end
end
