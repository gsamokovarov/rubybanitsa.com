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
