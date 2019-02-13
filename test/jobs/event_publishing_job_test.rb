# frozen_string_literal: true

require "test_helper"

class EventPublishingJobTest < ActiveJob::TestCase
  test "reminds 3 days before job expiration" do
    event = create :event, :impulsive

    assert_enqueued_jobs 3 do
      EventPublishingJob.perform_now(event)
    end
  end
end
