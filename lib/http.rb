# frozen_string_literal: true

require "uri"
require "net/http"

class Net::HTTP
  def debug_output=(val)
    set_debug_output(val)
  end
end

# HTTP is a simple facade over the builtin Net:HTTP client.
module HTTP
  def self.post(path, headers: {}, body: "")
    u = URI(path)
    body = body.to_s

    Net::HTTP.start(u.host, u.port,
      use_ssl: u.scheme == "https",
      debug_output: Rails.logger,) do |http|
      request = Net::HTTP::Post.new(u)
      request.initialize_http_header(headers)
      request.body = body unless body.empty?

      http.request(request)
    end
  end
end
