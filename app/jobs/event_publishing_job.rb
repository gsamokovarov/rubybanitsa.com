# frozen_string_literal: true

class EventPublishingJob < ApplicationJob
  def perform(event)
    event.publish
  end
end
