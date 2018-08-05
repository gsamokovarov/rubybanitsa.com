# frozen_string_literal: true

require "test_helper"

module Admin
  class EventsControllerTest < ActionDispatch::IntegrationTest
    test "POST /admin/events creates an event" do
      venue = Venue.create!(name: "N-working", address: "Somewhere rue", place_id: "foo")

      post admin_events_path, headers: basic_http_auth, params: {
        event: {
          time: Time.new(2015, 3, 19),
          description: "Impulsive event",
          venue_id: venue.id
        }
      }

      assert_response :found
      assert_equal "Impulsive event", Event.last.description
    end

    test "POST /admin/events/:event_id/publish publishes an event" do
      venue = Venue.create!(name: "N-working", address: "Somewhere rue", place_id: "foo")
      event = Event.create_with_venue(time: Time.current,
                                      description: "Impulsive event",
                                      venue_id: venue.id)

      post admin_event_publish_path(event), headers: basic_http_auth

      assert_response :found
      assert Event.last.published?
    end
  end
end
