# frozen_string_literal: true

require "meetup"

Rails.configuration.to_prepare do
  Meetup.client = Meetup.new(ENV["MEETUP_API_KEY"])
  MeetupPublisher.event_slug = "Ruby-Banitsa"
end
