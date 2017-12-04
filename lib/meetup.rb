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
      time: time
  end

  private

  attr_reader :api_key

  def post(path, data = {})
    response =
      HTTP.post "#{api_url}/#{path.remove(%r{^/})}?key=#{api_key}",
        headers: { 'Content-Type' => 'application/json' },
        body: data.to_json

    raise Error, response.body if response.code.to_i >= 400

    response
  end
end
