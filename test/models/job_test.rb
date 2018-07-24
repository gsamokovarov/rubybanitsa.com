require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "lists the currently relevant job postings" do
    travel_to time = Time.current do
      relevant1 = company.jobs.create! \
        title: "R1", description: "Arrr!"
      relevant1.publish(at: 2.hours.ago)

      relevant2 = company.jobs.create! \
        title: "R2", description: "Beep!"
      relevant2.publish(at: 2.hours.ago)

      expired = company.jobs.create! \
        title: "EX1", description: "Oh...",
        expires_at: 2.days.ago

      unpublished = company.jobs.create! \
        title: "Oops", description: "Did it again! 🤧"

      jobs = Job.current

      assert_equal 2, jobs.count
      assert_includes jobs, relevant1
      assert_includes jobs, relevant2
      assert_not_includes jobs, expired
      assert_not_includes jobs, unpublished
    end
  end

  test "isn't publushed or expired by default" do
    job = company.jobs.new title: "Hit", description: "Run"

    assert_not job.published?
    assert_not job.expired?
  end

  test "publishing for 1 month" do
    job = company.jobs.create! title: "Top Talent", description: <<-MANIFESTO
      Be expected to work in them evenings and liking it. Not
      expecting proper pay and liking it because START-UPs!
    MANIFESTO

    travel_to time = Time.current do
      assert_changes 'job.published?', to: true do
        job.publish(at: 2.hours.ago, for: 1.month)
      end

      assert_not job.expired?
      assert_equal 1.month.from_now, job.expires_at
    end

    travel_to 2.months.after(time) do
      assert job.expired?
    end
  end

  private

  def company(name: nil, description: nil, **rest)
    Company.create! \
      name: name || "Fan See",
      description: description || "We give you the bestest fans you'll ever see!",
      **rest
  end
end
