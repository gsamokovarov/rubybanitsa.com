# frozen_string_literal: true

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "GET / renders a default X large image card" do
    get root_path

    assert_response :success
    assert_select "meta[name='twitter:card'][content='summary_large_image']"
    assert_select "meta[property='og:title'][content='Ruby Banitsa']"
    assert_select "meta[property='og:url'][content$='/']"
    assert_select "meta[property='og:image'][content*='/banner']"
  end
end
