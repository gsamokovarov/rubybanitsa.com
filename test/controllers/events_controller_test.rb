# frozen_string_literal: true

require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "GET /events/:id falls back to the Ruby Banitsa OGP banner" do
    event = create :event, :random, :published

    get event_path(event)

    assert_select "meta[property='og:image'][content*='/banner']"
  end

  test "GET /events/:id falls back to the Vibe Banitsa OGP banner for vibe events" do
    event = create :event, :random, :published, :vibe

    get event_path(event)

    assert_select "meta[property='og:image'][content*='/vibe_banner']"
  end
end
