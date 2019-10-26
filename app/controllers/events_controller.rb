# frozen_string_literal: true

class EventsController < ApplicationController
  include TimeHelper

  def show
    @jobs = Job.current
    @event = Event.find(params[:id])
  end

  def index
    @jobs = Job.current
    @events = Event.during(during)
  end
end
