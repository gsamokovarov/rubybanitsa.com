# frozen_string_literal: true

require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  test "GET /jobs/:id works for companies without logos" do
    company = create :company, :fan_see
    job = company.jobs.create!(title: "Test", description: "Test")

    get job_path(job)

    assert_response :success
  end
end
