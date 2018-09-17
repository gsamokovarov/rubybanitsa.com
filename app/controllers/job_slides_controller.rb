class JobSlidesController < ApplicationController
  layout "job_slides"

  def index
    @jobs = Job.current
  end
end
