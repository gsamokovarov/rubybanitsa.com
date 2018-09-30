# frozen_string_literal: true

class JobFollowup
  Error = Class.new(ActiveModel::ValidationError)

  def initialize(job)
    @job = job
  end

  def send
    raise Error, job unless job.expired?

    job.contacts.each do |contact|
      JobMailer.followup(job, contact).deliver_later
    end
  end

  private

  attr_reader :job
end
