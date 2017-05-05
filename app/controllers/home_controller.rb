class HomeController < ApplicationController
  def show
    @events = Event.order(time: :desc)
  end
end
