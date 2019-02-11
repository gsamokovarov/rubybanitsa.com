# frozen_string_literal: true

class EventPublishingJob < ApplicationJob
  def perform(event)
    event.publish do
      MeetupPublisherJob.perform_now(event)
      FacebookPublisherJob.perform_now(event)
      MailinglistPublisher.perform_now(event)
    end
  end
end
