class HomeController < ApplicationController
  def show
    @events = Array(Event.upcoming || Event.past)
  end
end
