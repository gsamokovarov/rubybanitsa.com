# frozen_string_literal: true

class EventMailer < ApplicationMailer
  def publish(event, member_email)
    @event = event

    mail to: member_email, subject: "Ruby Banitsa – #{EventDetails.new(event).human_date}"
  end
end
