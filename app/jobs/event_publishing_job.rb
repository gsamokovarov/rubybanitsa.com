# frozen_string_literal: true

class EventPublishingJob < ApplicationJob
  def perform(event)
    event.publish do
      MeetupPublisherJob.perform_later(event)
      MailinglistPublisherJob.perform_later(event)
    end
  end
end
