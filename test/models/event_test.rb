require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test ".recent saves location and venues N+1 queries" do
    5.times { create_random_event }

    assert_sql_queries 3 do
      Event.recent.to_a
    end
  end

  private

  def create_random_event
    venue = Venue.create!(name: SecureRandom.hex, address: SecureRandom.hex)
    event = Event.create!(time: Time.current, description: SecureRandom.hex)

    event.create_location!(event: event, venue: venue)
  end
end
