class HomeController < ApplicationController
  def show
    @events = Array(Event.upcoming || Event.recent)
  end
end
