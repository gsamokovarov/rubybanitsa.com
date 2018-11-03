# frozen_string_literal: true

require "test_helper"

class PostingExpirationReminderJobTest < ActiveJob::TestCase
  test "reminds 3 days before job expiration" do
    job = create :job, :fan_see, expires_at: Time.current

    assert_called job, :remind do
      travel_to(3.days.ago) { PostingExpirationReminderJob.perform_now(job) }
    end
  end

  test "reminds 1 day before job expiration" do
    job = create :job, :fan_see, expires_at: Time.current

    assert_called job, :remind do
      travel_to(1.day.ago) { PostingExpirationReminderJob.perform_now(job) }
    end
  end

  test "doesn't remind on non-scheduled days" do
    job = create :job, :fan_see, expires_at: Time.current

    assert_not_called job, :remind do
      travel_to(2.days.ago) { PostingExpirationReminderJob.perform_now(job) }
    end
  end
end
