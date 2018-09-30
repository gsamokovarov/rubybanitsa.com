# frozen_string_literal: true

if defined?(Rack::Timeout)
  Rails.configuration.middleware.insert_before Rack::Runtime, Rack::Timeout
end
