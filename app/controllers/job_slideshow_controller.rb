class JobSlideshowController < ApplicationController
  layout "job_slides"

  def show
    @jobs = Job.current
  end
end
