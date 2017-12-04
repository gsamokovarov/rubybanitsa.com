# frozen_string_literal: true

require 'uri'
require 'net/http'

# HTTP is a simple facade over the builtin Net:HTTP client.
module HTTP
  def self.post(path, headers: {}, body: '')
    u = URI(path)

    Net::HTTP.start(u.host, u.port, use_ssl: u.scheme == 'https') do |http|
      request = Net::HTTP::Post.new(u)
      request.initialize_http_header(headers)
      request.body = body

      http.request(request)
    end
  end
end
