# frozen_string_literal: true

module JobMailerI18nHelper
  def job_expiration_in_days(job, now: Time.current)
    distance_of_time_in_words(job.expires_at, now)
      .gsub(/(\d+) days/, '\1 дни')
      .gsub(/1 day/, "1 ден")
  end
end
