require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  test 'GET /jobs/:id works for companies without logos' do
    job = company.jobs.create!(title: "Test", description: "Test")

    get job_path(job)

    assert_response :success
  end

  private

  def company(name: nil, description: nil, **rest)
    Company.create! \
      name: name || "Fan See",
      description: description || "We give you the bestest fans you'll ever see!",
      **rest
  end
end
