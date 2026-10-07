# frozen_string_literal: true

require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "GET /jobs/:id works for companies without logos" do
    job = create :job, :fan_see

    get job_path(job)

    assert_response :success
    assert_select "meta[name='twitter:card'][content='summary_large_image']"
    assert_select "meta[property='og:url'][content$='/jobs/#{job.id}']"
    assert_select "meta[property='og:image'][content*='/banner']"
  end
end
