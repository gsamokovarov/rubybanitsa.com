# frozen_string_literal: true

require "test_helper"

# Exercises the site-wide toggle directly on the controller method, so the
# assertions don't depend on full-page asset rendering.
class VibeModeTest < ActiveSupport::TestCase
  test "vibe mode turns on when the upcoming event is a Vibe Banitsa" do
    create :event, :random, :published, :vibe, time: 1.week.from_now

    assert vibe_mode?
  end

  test "vibe mode stays off for a regular upcoming event" do
    create :event, :random, :published, time: 1.week.from_now

    assert_not vibe_mode?
  end

  test "vibe mode is off when there is no upcoming event" do
    assert_not vibe_mode?
  end

  test "vibe mode reuses an already-loaded upcoming event without re-querying" do
    upcoming = create :event, :random, :published, :vibe, time: 1.week.from_now
    controller = ApplicationController.new
    controller.instance_variable_set(:@upcoming_event, upcoming)

    assert_sql_queries(0) { assert controller.send(:vibe_mode?) }
  end

  private

  def vibe_mode?
    ApplicationController.new.send(:vibe_mode?)
  end
end
