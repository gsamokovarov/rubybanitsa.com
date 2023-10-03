# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Administration

  before_action :set_upcoming_event
  before_action :set_current_jobs

  private

  def set_upcoming_event
    @upcoming_event = Event.upcoming
  end

  def set_current_jobs
    @current_jobs = Job.current
  end
end
