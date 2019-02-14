# frozen_string_literal: true

module MailinglistPublisher extend self
  def published?(_event)
    false
  end

  def publish(event)
    Mailinglist.each do |member|
      EventMailer.publish(event, member.email).deliver_later
    end
  end
end
