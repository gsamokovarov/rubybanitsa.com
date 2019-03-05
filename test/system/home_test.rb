require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "renders past events" do
    travel_to t = Time.current.beginning_of_year do
      create :event, :impulsive, :published
    end

    visit events_url

    assert_selector "h2"
  end

  test "renders upcoming events" do
    travel_to t = Time.current.end_of_year do
      create :event, :impulsive, :published
    end

    visit events_url

    assert_selector "h2"
  end
end
