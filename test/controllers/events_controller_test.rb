# frozen_string_literal: true

require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "GET /events works without events" do
    travel_to Time.new(2015, 3, 19, 20, 0, 0) do
      get events_path

      assert_response :success
      assert_select "section#events", "No events during 2015. ☹️"
    end
  end

  test "GET /events shows the recent events" do
    travel_to Time.new(2015, 3, 19, 20, 0, 0) do
      create :event, :impulsive, :published

      get events_path

      assert_response :success
      assert_select "section#events", /Thursday, 19th of March/
    end
  end
end
