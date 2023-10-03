# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @recent_events = Event.recent(3)
  end
end
