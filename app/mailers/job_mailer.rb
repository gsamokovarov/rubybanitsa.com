# frozen_string_literal: true

class JobMailer < ApplicationMailer
  def followup(job, contact)
    @job = job
    @contact = contact

    mail to: @contact.email, subject: "Обява #{job.title} в RubyBanitsa"
  end
end
