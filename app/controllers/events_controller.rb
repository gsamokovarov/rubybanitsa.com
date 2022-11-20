# frozen_string_literal: true

class EventsController < ApplicationController
  include TimeHelper

  def show
    @jobs = Job.current
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html
      format.ics do
        send_data EventCalendar.for(@event), type: "text/calendar", disposition: "attachment"
      end
    end
  end

  def index
    @jobs = Job.current
    @events =
      Event.includes(:venue, :location, talks: :speaker, sponsorships: :company)
           .during(during)
           .order(time: :desc)
  end
end
