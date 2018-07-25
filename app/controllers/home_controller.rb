class HomeController < ApplicationController
  def show
    @events = Array(Event.upcoming || Event.current)
  end
end
