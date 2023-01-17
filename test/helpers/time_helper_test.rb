# frozen_string_literal: true

require "test_helper"

class TimeHelperTest < ActionView::TestCase
  setup do
    @params = {}
  end

  attr_reader :params

  test "parses time from string params" do
    params[:during] = "1001"

    assert_equal Date.new(1001), during
  end

  test "returns the current year if no :during param is given" do
    travel_to time = Time.current do
      assert_equal Date.new(time.year), during
    end
  end
end
