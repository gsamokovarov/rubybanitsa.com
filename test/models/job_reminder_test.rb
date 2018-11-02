# frozen_string_literal: true

require "test_helper"

class JobReminderTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "sends a reminder email to every job contact" do
    job = create :job, :fan_see

    joe = create :contact, name: "Joe", email: "joe@fan_see.com", company: job.company
    ann = create :contact, name: "Ann", email: "ann@fan_see.com", company: job.company

    assert_enqueued_jobs 2 do
      JobReminder.new(job).send
    end
  end
end
