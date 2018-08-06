# frozen_string_literal: true

require "test_helper"

class MeetupPublisherTest < ActiveSupport::TestCase
  test "the class acts as a default client to the Ruby-Banitsa meetup" do
    assert_respond_to MeetupPublisher, :publish
    assert_equal "Ruby-Banitsa", MeetupPublisher.send(:instance).send(:urlname)
  end

  test "publishes events to meetup" do
    meetup = MeetupPublisher.new("Meetup-API-Testing")

    venue = Venue.create!(name: "N-working", address: "Somewhere rue", place_id: "foo")
    event = Event.create_with_venue(time: Time.new(2022, 2, 2),
                                    description: "**Impulsive** event",
                                    venue_id: venue.id)

    error =
      VCR.use_cassette("meetup_event_publish_impulsive") do
        assert_raises Meetup::Error do
          meetup.publish(event)
        end
      end

    error.each do |entry|
      assert_equal "member_error", entry.code
      assert_equal "Not authorized to create or edit events in this group", entry.message
    end
  end

  test "rewrites the event location from the API to the website" do
    meetup = MeetupPublisher.new("Meetup-API-Testing")

    venue = Venue.create!(name: "N-working", address: "Somewhere rue", place_id: "foo")
    event = Event.create_with_venue(time: Time.new(2022, 2, 2),
                                    description: "**Impulsive** event",
                                    venue_id: venue.id)

    Meetup.stub :create_event, "Location" => "https://api.meetup.com/Ruby-Banitsa/events/252973073" do
      meetup.publish(event)

      assert_equal "https://meetup.com/Ruby-Banitsa/events/252973073", event.meetup_url
    end
  end
end
