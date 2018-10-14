# frozen_string_literal: true

require "test_helper"

class JobMailerI18nHelperTest < ActionView::TestCase
  test "job expiration in days is in Bulgarian" do
    freeze_time do
      job = build :job, expires_at: 3.days.from_now

      assert_equal "3 дни", job_expiration_in_days(job)
    end

    freeze_time do
      job = build :job, expires_at: 1.day.from_now

      assert_equal "1 ден", job_expiration_in_days(job)
    end
  end
end
