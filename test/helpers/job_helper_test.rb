# frozen_string_literal: true

require "test_helper"

class JobHelperTest < ActionView::TestCase
  test "#job_thumb_tag does nothing if the job has not thumb or logo" do
    job = build :job, :fan_see

    assert_nil job_thumb_tag(job)
  end

  test "#job_thumb_tag defaults to the thumb class" do
    job = create :job, :fan_see
    job.logo.attach(io: file_fixture("koleltse.png").open, filename: "koleltse.png")

    assert_includes job_thumb_tag(job), 'class="thumb"'
  end

  test "#job_render strips all HTML tags from plain job descriptions" do
    job = build :job, :fan_see, description: <<~MD
      [1]

      <a class="contact" href="mailto:employee@example.com">Apply</a>

      [2]
    MD

    assert_equal <<~PLAIN, job_render(job, plain: true)
      Apply
    PLAIN
  end
end
