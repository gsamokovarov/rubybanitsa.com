class EventsController < ApplicationController
  def index
    @events = Event.order(time: :desc)
  end
end
