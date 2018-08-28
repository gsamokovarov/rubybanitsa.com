# frozen_string_literal: true

require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "GET /jobs/:id works for companies without logos" do
    job = create :job, :fan_see

    get job_path(job)

    assert_response :success
  end
end
