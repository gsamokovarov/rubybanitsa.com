# frozen_string_literal: true

require "test_helper"

class EventDetailsTest < ActiveSupport::TestCase
  test "#summary is the first line of the description" do
    event = build :event, description: <<~TEXT
      This event is gonna be...

      AWESOME!!!
    TEXT

    assert_equal "This event is gonna be...\n", e(event).summary
  end

  test "#human_date represents the date in plain English" do
    event = build :event, time: Time.parse("01 April 2001 18:30 UTC")

    assert_equal "Sunday, 1st of April", e(event).human_date
  end

  test "#human_time returns time only" do
    event = build :event, time: Time.parse("01 April 2001 18:30 UTC")

    assert_equal "21:30", e(event).human_time
  end

  test "#venue is the event location name" do
    venue = create :venue, name: "Nouvenue", address: "Somewhere rue", place_id: "foo"
    event = create :event, time: Time.current, description: "Please come!"

    assert_changes "e(event).venue", from: nil, to: venue.name do
      event.create_location!(venue:)
    end
  end

  test "#venue_directions is the event location directions" do
    venue = create :venue, name: "Nouvenue", address: "Somewhere rue", directions: "To the right!", place_id: "foo"
    event = create :event, time: Time.current, description: "Please come!"

    event.create_location!(venue:)

    assert_equal "To the right!", e(event).venue_directions
  end

  test "#address is the event location address" do
    venue = create :venue, name: "Nouvenue", address: "Somewhere rue", place_id: "foo"
    event = create :event, time: Time.current, description: "Please come!"

    assert_changes "e(event).address", from: nil, to: venue.address do
      event.create_location!(venue:)
    end
  end

  test "#links? truthy if an event has meetup or facebook links" do
    dull_event = Event.new
    assert_not e(dull_event).links?

    meetup_event = Event.new(meetup_url: "https://meetup.com/RubyBanitsa/events/1234")
    assert e(meetup_event).links?

    facebook_event = Event.new(facebook_url: "https://www.facebook.com/events/377873869393477/")
    assert e(facebook_event).links?
  end

  private

  def e(event)
    EventDetails.new(event)
  end
end
