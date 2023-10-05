# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @upcoming_event = Event.upcoming
    @recent_events = Event.recent(3)
  end
end
