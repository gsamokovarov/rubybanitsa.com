# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Administration

  before_action :set_current_resources

  private

  def set_current_resources
    @upcoming_event = Event.upcoming
    @current_jobs = Job.current

    ::Current.vibe = @upcoming_event&.vibe? || request.domain == "vibebanitsa.com"
  end
end
