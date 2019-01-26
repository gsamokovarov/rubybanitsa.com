# frozen_string_literal: true

class MeetupPublisherJob < ApplicationJob
  def perform(event)
    MeetupPublisher.publish(event)
  end
end
