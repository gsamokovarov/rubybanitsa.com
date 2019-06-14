# frozen_string_literal: true

class JobSlideshowController < ApplicationController
  layout "job_slides"

  def show
    @jobs =
      if params[:demo]
        Job.all
      else
        Job.current
      end
  end
end
