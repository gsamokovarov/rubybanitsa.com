# frozen_string_literal: true

require "test_helper"

class MeetupTest < ActiveSupport::TestCase
  test "#create_event creates an new meetup.com event" do
    error =
      VCR.use_cassette("meetup_event_create") do
        assert_raises Meetup::Error do
          Meetup.create_event "Meetup-API-Testing",
            name: "Test Event",
            description: "Hello!",
            time: Time.new(2022, 2, 2)
        end
      end

    error.each do |entry|
      assert_equal "member_error", entry.code
      assert_equal "Not authorized to create or edit events in this group", entry.message
    end
  end
end
