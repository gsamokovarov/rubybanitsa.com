# frozen_string_literal: true

class EventPublishingJob < ApplicationJob
  def perform(event)
    event.publish do
      MailinglistPublisherJob.perform_later(event)
    end
  end
end
