# frozen_string_literal: true

require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "GET /events works without events" do
    get events_path

    assert_response :success
    assert_select "section#events", ""
  end

  test "GET /events shows the recent events" do
    travel_to Time.new(2015, 3, 19, 20, 0, 0) do
      create :event, :impulsive

      get events_path

      assert_response :success
      assert_select "section#events", /Thursday, 19th of March/
    end
  end
end
