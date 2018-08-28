# frozen-string-literal: true

require "test_helper"

class JobMediaTest < ActiveSupport::TestCase
  setup do
    ActiveStorage::Current.host = "localhost"
  end

  test "#thumb returns the job logo if no thumbnail is attached" do
    job = create :job, :fan_see

    job.logo.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")

    assert_equal job.logo.blob, JobMedia.new(job).thumb.blob
  end

  test "#thumb returns the job thumbnail if attached" do
    job = create :job, :fan_see

    job.thumbnail.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")

    assert_equal job.thumbnail.blob, JobMedia.new(job).thumb.blob
  end

  test "#logo returns the job logo" do
    job = create :job, :fan_see

    job.logo.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")

    assert_equal job.logo.blob, JobMedia.new(job).logo.blob
  end
end
