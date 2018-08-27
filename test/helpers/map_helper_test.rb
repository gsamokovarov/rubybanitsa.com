# frozen_string_literal: true

require "test_helper"

class MapHelperTest < ActionView::TestCase
  test "embedded google maps generation" do
    event = create :event, :impulsive

    content = map_tag(event)

    assert_includes content, "iframe"
    assert_includes content, "q=place_id:somewhere_google_place_id"
  end
end
