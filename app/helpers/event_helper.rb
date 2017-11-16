module EventHelper
  def upcoming_event_badge(event)
    if event.upcoming?
      tag.span time_ago_in_words(event.time), class: :upcoming
    end
  end
end
