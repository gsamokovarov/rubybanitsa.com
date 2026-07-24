# frozen_string_literal: true

require "test_helper"

module Admin
  class EventsControllerTest < ActionDispatch::IntegrationTest
    test "POST /admin/events creates an event" do
      venue = create :venue, :somewhere

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
      event = create :event, :impulsive

      post admin_event_publish_path(event), headers: basic_http_auth

      assert_response :found
    end

    test "PATCH /admin/events/:id with the published checkbox publishes and unpublishes" do
      event = create :event, :impulsive

      patch admin_event_path(event), headers: basic_http_auth, params: { event: { published: "1" } }

      assert_response :found
      assert_predicate event.reload, :published?

      patch admin_event_path(event), headers: basic_http_auth, params: { event: { published: "0" } }

      assert_not_predicate event.reload, :published?
    end

    test "checking published on an already published event keeps the original timestamp" do
      event = create :event, :impulsive
      event.publish Time.new(2025, 3, 19)

      patch admin_event_path(event), headers: basic_http_auth, params: { event: { published: "1", name: "Renamed" } }

      assert_equal Time.new(2025, 3, 19), event.reload.published_at
      assert_equal "Renamed", event.name
    end
  end
end
