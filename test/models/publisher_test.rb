# frozen_string_literal: true

require "test_helper"

class PublisherTest < ActiveSupport::TestCase
  test "can publish to multiple services" do
    publisher = Publisher.new(TestingPublisher, TestingPublisher)
    event = Event.new

    assert_changes "TestingPublisher.events.dup", to: [event, event] do
      publisher.publish(event)
    end
  end
end
