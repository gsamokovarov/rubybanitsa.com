# frozen_string_literal: true

require "test_helper"

class HTTPTest < ActiveSupport::TestCase
  test ".post can POST empty HTTP form data to a destination" do
    response =
      VCR.use_cassette("http_example") do
        HTTP.post("https://example.com")
      end

    assert_equal response.body, file_fixture("example.com.html").read
  end
end
