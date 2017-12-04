require 'test_helper'

class HTTPTest < ActiveSupport::TestCase
  test '.post can POST empty HTTP form data to a destination' do
    response = HTTP.post('https://example.com')

    assert_equal response.body, file_fixture('example.com.html').read
  end
end
