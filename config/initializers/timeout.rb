# frozen_string_literal: true

if defined?(Rack::Timeout)
  Rails.configuration.middleware.insert_before Rack::Runtime, Rack::Timeout,
    service_timeout: Integer(25.seconds)
end
