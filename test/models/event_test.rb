require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test ".past saves location and venues N+1 queries" do
    5.times { create_event }

    assert_sql_queries 3 do
      Event.past.to_a
    end
  end

  test ".past does not list upcoming events" do
    5.times { create_event }
    1.times { create_event(time: 1.week.from_now) }

    assert_equal 5, Event.past.count
  end

  test ".upcoming returns a single upcoming event" do
    event = create_event(time: 1.week.from_now)

    assert_equal event, Event.upcoming
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

  test "#upcoming? is an event in the future" do
    event = Event.new(time: 2.days.from_now)
    assert event.upcoming?

    event = Event.new(time: 2.days.ago)
    assert_not event.upcoming?
  end

  test "#publish can publish events to external services" do
    venue = Venue.create!(name: 'N-working', address: 'Somewhere rue', place_id: 'foo')
    event = Event.create_with_venue(time: Time.current,
                                    description: 'Impulsive event',
                                    venue_id: venue.id)

    travel_to time = Time.current do
      # The Event.publisher is set to a testing publisher, so we don't hit the
      # external service here.
      assert_changes 'TestingPublisher.events', to: [event] do
        event.publish(time)
      end

      assert event.published?
      assert_equal time, event.published_at
    end
  end

  private

  def create_event(time: Time.current)
    venue = Venue.create!(name: randstr, address: randstr, place_id: randstr)

    Event.create!(time: time, description: randstr).tap do |event|
      event.create_location!(event: event, venue: venue)
    end
  end

  def randstr
    SecureRandom.hex
  end
end
