# frozen_string_literal: true

class EventMailer < ApplicationMailer
  def publish(event, member_email)
    @event = event

    mail to: member_email, subject: "Ruby Banitsa – #{EventInfo.new(event).human_time}"
  end
end
