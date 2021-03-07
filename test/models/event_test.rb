# frozen_string_literal: true

require "test_helper"

class EventTest < ActiveSupport::TestCase
  test ".current saves location and venues N+1 queries" do
    5.times { create :event, :random, :published }

    assert_sql_queries 3 do
      Event.this_year.to_a
    end
  end

  test ".current lists the upcoming events" do
    5.times { create :event, :random, :published }
    1.times { create :event, :random, :published, time: 1.week.from_now }

    assert_equal 6, Event.this_year.count
  end

  test ".during lists the upcoming events" do
    travel_to year_2015 = Time.new(2015, 3, 19, 20, 0, 0) do
      2.times { create :event, :random, :published }
    end

    assert_equal 2, Event.during(year_2015).count
  end

  test ".upcoming returns a single upcoming event" do
    event = create :event, :random, :published, time: 1.week.from_now

    assert_equal event, Event.upcoming
  end

  test ".create_with_venue creates an event for a specific venue" do
    assert_difference ["Event.count", "Location.count"], +1 do
      Event.create_with_venue \
        time: Time.current,
        description: "Impulsive event",
        venue_id: create(:venue, :somewhere).id
    end
  end

  test ".create_with_venue raises ActiveRecord::RecordInvalid on bad input" do
    assert_raises ActiveRecord::RecordInvalid do
      Event.create_with_venue \
        time: Time.current,
        description: "Impulsive event"
    end
  end

  test "#upcoming? is an event in the future" do
    event = Event.new(time: 2.days.from_now)
    assert event.upcoming?

    event = Event.new(time: 2.days.ago)
    assert_not event.upcoming?
  end

  test "#publish can publish events to external services" do
    event = create :event, :impulsive

    travel_to time = Time.current do
      event.publish(time)

      assert event.published?
      assert_equal time, event.published_at
    end
  end

  test "#online? is true for events with online venues" do
    event = create :event, :online

    assert event.online?
  end
end
