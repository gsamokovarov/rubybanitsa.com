# frozen_string_literal: true

require 'http'
require 'meetup/error'

# Meetup is a simple client for meetup.com implementing only the Ruby Banitsa
# requirements.
class Meetup
  cattr_accessor :client
  cattr_accessor :api_url, default: 'https://api.meetup.com'

  class << self
    delegate_missing_to :client
  end

  def initialize(api_key)
    @api_key = api_key
  end

  def create_event(urlname, name:, description:, time:)
    post "/#{urlname}/events",
      name: name,
      description: description,
      time: time.to_i.in_milliseconds
  end

  private

  attr_reader :api_key

  def post(path, data = {})
    uri = URI("#{api_url}/#{path.remove(%r{^/})}")
    uri.query = data.merge(key: api_key).to_param

    response = HTTP.post(uri, headers: { 'Content-Type' => 'application/json' })
    raise Error, response.body if response.code.to_i >= 400
    response
  end
end
