require 'test_helper'

class EventInfoTest < ActiveSupport::TestCase
  test "#summary is the first line of the description" do
    event = Event.new(description: <<~TEXT)
      This event is gonna be...

      AWESOME!!!
    TEXT

    assert_equal "This event is gonna be...\n", e(event).summary
  end

  test "#human_title includes a date and a venue" do
    travel_to Time.new(2018, 2, 2) do
      venue = Venue.create!(name: 'Nouvenue', address: 'Somewhere rue', place_id: 'foo')
      event = Event.create!(time: Time.new(2017, 11, 14), description: 'Please come!')
      event.create_location!(event: event, venue: venue)

      assert_equal "Tuesday, 14th of November, 2017", e(event).human_title
    end
  end

  test "#human_date represents the date in plain English" do
    event = Event.new(time: Time.parse('01 April 2001 18:30 UTC'))

    assert_equal 'Sunday, 1st of April', e(event).human_date
  end

  test "#human_time returns time only" do
    event = Event.new(time: Time.parse('01 April 2001 18:30 UTC'))

    assert_equal '21:30', e(event).human_time
  end

  test "#venue is the event location name" do
    venue = Venue.create!(name: 'Nouvenue', address: 'Somewhere rue', place_id: 'foo')
    event = Event.create!(time: Time.current, description: 'Please come!')

    assert_changes 'e(event).venue', from: nil, to: 'Nouvenue' do
      event.create_location!(event: event, venue: venue)
    end
  end

  test "#address is the event location address" do
    venue = Venue.create!(name: 'Nouvenue', address: 'Somewhere rue', place_id: 'foo')
    event = Event.create!(time: Time.current, description: 'Please come!')

    assert_changes 'e(event).address', from: nil, to: 'Somewhere rue' do
      event.create_location!(event: event, venue: venue)
    end
  end

  test "#links? truthy if an event has meetup or facebook links" do
    dull_event = Event.new
    assert_not e(dull_event).links?

    meetup_event = Event.new(meetup_url: 'https://meetup.com/RubyBanitsa/events/1234')
    assert e(meetup_event).links?

    facebook_event = Event.new(facebook_url: 'https://www.facebook.com/events/377873869393477/')
    assert e(facebook_event).links?
  end

  private

  def e(event)
    EventInfo.new(event)
  end
end
