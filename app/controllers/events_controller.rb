# frozen_string_literal: true

class EventsController < ApplicationController
  layout "banner", only: :banner

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html
      format.ics do
        send_data EventCalendar.for(@event), type: "text/calendar", disposition: "attachment"
      end
    end
  end

  def index
    @upcoming_event = Event.upcoming
    @pagination = EventPagination.new params.fetch(:year, Date.current.year).to_i
    @events =
      Event.includes(:venue, talks: :speakers)
           .during(Date.new(@pagination.year))
           .where("time < ?", Date.current)
           .order(time: :desc)
  end

  def banner
    @event = Event.find(params[:id])
  end
end
