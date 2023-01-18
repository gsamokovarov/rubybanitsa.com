# frozen_string_literal: true

require "test_helper"

WebMock.disable_net_connect! allow_localhost: true,
                             net_http_connect_on_start: %w[localhost 127.0.0.1],
                             allow: ["https://chromedriver.storage.googleapis.com"]

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
