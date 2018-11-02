# frozen_string_literal: true

class JobReminder
  Error = Class.new(ActiveModel::ValidationError)

  def initialize(job)
    @job = job
  end

  def send
    raise Error, job if job.expired?

    job.contacts.each do |contact|
      JobMailer.remind(job, contact).deliver_later
    end
  end

  private

  attr_reader :job
end
