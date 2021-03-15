# frozen_string_literal: true

module EventCalendar
  extend self

  def for(event)
    info = EventInfo.new(event)
    tzid = event.time.time_zone.tzinfo.name

    calendar = Icalendar::Calendar.new
    calendar.event do |e|
      e.dtstart = Icalendar::Values::Time.new(event.time, tzid: tzid)
      e.dtend = Icalendar::Values::Time.new(event.time + 1.hour, tzid: tzid)
      e.organizer = Icalendar::Values::CalAddress.new("mailto:genadi@hey.com", cn: "Genadi Samokovarov")
      e.attendee = Icalendar::Values::CalAddress.new("mailto:genadi@hey.com", cn: "Genadi Samokovarov")
      e.url = Link.event_url(event)
      e.summary = "Ruby Banitsa - #{info.human_date}"
      e.description = MD.render_plain(<<~END)
        #{info.description}

        Join: #{Link.join_url}
      END
    end
    calendar.to_ical
  end
end
