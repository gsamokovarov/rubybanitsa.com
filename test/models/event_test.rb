require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test ".recent saves location and venues N+1 queries" do
    5.times { create_random_event }

    assert_sql_queries 3 do
      Event.recent.to_a
    end
  end

  test ".create_with_venue creates an event for a specific venue" do
    venue = Venue.create!(name: 'N-working', address: 'Somewhere rue', place_id: 'foo')

    assert_difference ['Event.count', 'Location.count'], +1 do
      Event.create_with_venue(time: Time.current,
                              description: 'Impulsive event',
                              venue_id: venue.id)
    end
  end

  test ".create_with_venue raises ActiveRecord::RecordInvalid on bad input" do
    venue = Venue.create!(name: 'N-working', address: 'Somewhere rue', place_id: 'foo')

    assert_raises ActiveRecord::RecordInvalid do
      Event.create_with_venue(time: Time.current, description: 'Impulsive event')
    end
  end

  private

  def create_random_event
    venue = Venue.create!(name: randstr, address: randstr, place_id: randstr)
    event = Event.create!(time: Time.current, description: randstr)

    event.create_location!(event: event, venue: venue)
  end

  def randstr
    SecureRandom.hex
  end
end
