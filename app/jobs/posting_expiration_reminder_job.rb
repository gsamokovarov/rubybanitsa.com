# frozen_string_literal: true

class PostingExpirationReminderJob < ApplicationJob
  DAYS_TO_REMIND_ON = [3, 1].freeze

  def perform(job)
    return if DAYS_TO_REMIND_ON.none? { |day| expires_in_days?(job, day) }

    job.remind
  end

  private

  def expires_in_days?(job, n)
    job.expires_at.to_date == n.days.from_now.to_date
  end
end
