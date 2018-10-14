# frozen_string_literal: true

class JobMailer < ApplicationMailer
  def followup(job, contact)
    @job = job
    @contact = contact

    mail to: @contact.email, subject: "Обява #{job.title} в Ruby Banitsa"
  end

  def remind(job, contact)
    @job = job
    @contact = contact

    mail to: @contact.email, subject: "Обява #{job.title} в Ruby Banitsa изтича след #{job_expiration_in_days(job)}"
  end
end
