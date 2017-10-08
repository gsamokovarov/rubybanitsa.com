require 'test_helper'

class MapHelperTest < ActionView::TestCase
  test "embedded google maps generation" do
    venue = Venue.create! name: 'Nouvenue', address: 'Somewhere rue', place_id: 'foo'
    event = Event.create_with_venue \
      time: Time.current,
      description: 'Please come!',
      venue_id: venue.id

    content = map_tag(event)

    assert_includes content, "iframe"
    assert_includes content, "q=place_id:foo"
  end
end
