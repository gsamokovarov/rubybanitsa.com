require 'test_helper'

class EventInfoTest < ActiveSupport::TestCase
  test "#human_date represents the date in plain English" do
    event = Event.new(time: Time.parse('01 April 2001 18:30 UTC'))

    assert_equal 'Sunday, 1st of April', e(event).human_date
  end

  test "#human_time returns time only" do
    event = Event.new(time: Time.parse('01 April 2001 18:30 UTC'))

    assert_equal '18:30', e(event).human_time
  end

  test "#venue is the event location name" do
    venue = Venue.create!(name: 'Nouvenue', address: 'Somewhere rue')
    event = Event.create!(time: Time.current, description: 'Please come!')

    assert_changes 'e(event).venue', from: nil, to: 'Nouvenue' do
      event.create_location!(event: event, venue: venue)
    end
  end

  test "#address is the event location address" do
    venue = Venue.create!(name: 'Nouvenue', address: 'Somewhere rue')
    event = Event.create!(time: Time.current, description: 'Please come!')

    assert_changes 'e(event).address', from: nil, to: 'Somewhere rue' do
      event.create_location!(event: event, venue: venue)
    end
  end

  private

  def e(event)
    EventInfo.new(event)
  end
end