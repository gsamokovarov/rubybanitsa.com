# frozen_string_literal: true

require "test_helper"

class JobHelperTest < ActionView::TestCase
  test "strips all HTML tags from plain job descriptions" do
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
