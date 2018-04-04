require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'GET /events works without events' do
    get events_path

    assert_response :success
    assert_select 'section#events', ''
  end

  test 'GET /events shows the recent events' do
    travel_to Time.new(2015, 3, 19, 20, 0, 0) do
      venue = Venue.create!(name: 'N-working', address: 'Somewhere rue', place_id: 'foo')
      Event.create_with_venue(time: 10.minutes.ago,
                              description: 'Impulsive event',
                              venue_id: venue.id)

      get events_path

      assert_response :success
      assert_select 'section#events', "Thursday, 19th of March\n\n  " \
                                      "Impulsive event"
    end
  end
end
