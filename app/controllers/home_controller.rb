class HomeController < ApplicationController
  def show
    @events = Event.all
  end
end
