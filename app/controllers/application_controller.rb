# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Administration

  before_action :set_current_jobs

  helper_method :vibe_mode?

  private

  def set_current_jobs
    @current_jobs = Job.current
  end

  # When the next upcoming event is a Vibe Banitsa one, the whole site puts on
  # its psychedelic outfit. Memoised per request and reusing the controller's
  # @upcoming_event when it has already been loaded to avoid a second query.
  def vibe_mode?
    return @vibe_mode if defined?(@vibe_mode)

    upcoming = defined?(@upcoming_event) ? @upcoming_event : Event.upcoming
    @vibe_mode = upcoming&.vibe? || false
  end
end
