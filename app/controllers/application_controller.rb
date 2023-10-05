# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Administration

  before_action :set_current_jobs

  private

  def set_current_jobs
    @current_jobs = Job.current
  end
end
