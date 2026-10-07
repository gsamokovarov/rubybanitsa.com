# frozen_string_literal: true

require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "GET /events/:id falls back to the Ruby Banitsa OGP banner" do
    event = create :event, :random, :published

    get event_path(event)

    assert_select "meta[property='og:image'][content*='/banner']"
    assert_select "meta[name='twitter:image'][content*='/banner']"
  end

  test "GET /events/:id falls back to the Vibe Banitsa OGP banner for vibe events" do
    event = create :event, :random, :published, :vibe

    get event_path(event)

    assert_select "meta[property='og:image'][content*='/vibe_banner']"
  end

  test "GET /events/:id renders an X large image card with a canonical URL" do
    event = create :event, :random, :published

    get event_path(event)

    assert_select "meta[name='twitter:card'][content='summary_large_image']"
    assert_select "meta[property='og:url'][content$='/events/#{event.id}']"
    assert_select "meta[property='og:title']", count: 1
    assert_select "meta[name='twitter:title']", count: 1
  end
end
