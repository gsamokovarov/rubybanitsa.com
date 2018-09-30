# frozen_string_literal: true

require "test_helper"

class JobFollowupTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "sends a follow-up email to every job contact" do
    job = create :job, :fan_see, expires_at: 2.days.ago

    joe = create :contact, name: "Joe", email: "joe@fan_see.com", company: job.company
    ann = create :contact, name: "Ann", email: "ann@fan_see.com", company: job.company

    assert_enqueued_jobs 2 do
      JobFollowup.new(job).send
    end
  end

  test "sends a follow-up email only if the job have expired" do
    job = create :job, :fan_see, expires_at: 2.days.from_now

    assert_raises JobFollowup::Error do
      JobFollowup.new(job).send
    end
  end
end
