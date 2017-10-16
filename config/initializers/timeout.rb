if defined?(Rack::Timeout)
  Rack::Timeout.timeout = Integer(25.seconds)
end
