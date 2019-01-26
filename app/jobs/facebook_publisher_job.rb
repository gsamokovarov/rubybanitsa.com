# frozen_string_literal: true

class FacebookPublisherJob < ApplicationJob
  def perform(event)
    FacebookPublisher.publish(event)
  end
end
