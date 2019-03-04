# frozen_string_literal: true

class EventsController < ApplicationController
  include TimeHelper

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.during(during)
  end
end
