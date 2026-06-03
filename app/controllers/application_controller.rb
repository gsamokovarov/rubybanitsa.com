# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Administration

  before_action :set_current_resources

  private

  def set_current_resources
    @upcoming_event = Event.upcoming
    @current_jobs = Job.current

    # `::` to reach the top-level Current — a bare `Current` here resolves to
    # Administration::Current (this controller includes Administration).
    ::Current.vibe = @upcoming_event&.vibe?
  end
end
