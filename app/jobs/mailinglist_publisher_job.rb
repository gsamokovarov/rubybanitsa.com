# frozen_string_literal: true

class MailinglistPublisherJob < ApplicationJob
  def perform(event)
    MailinglistPublisher.publish(event)
  end
end
