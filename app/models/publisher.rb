# frozen_string_literal: true

require "meetup"

# Publisher can publish an event to the different services.
class Publisher
  def initialize(*publishers)
    @publishers = publishers
  end

  def publish(event)
    publishers.each do |publisher|
      publisher.publish(event)
    end
  end

  private

  attr_reader :publishers
end
