# frozen_string_literal: true

class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.during(during)
  end

  private

  helper_method def during
    Time.new(params.fetch(:during) { Time.current.year })
  end
end
