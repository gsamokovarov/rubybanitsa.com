# frozen_string_literal: true

class EventsController < ApplicationController
  PAGINATION_MIN_YEAR = 2017

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
    @pagination = build_pagination
    @events =
      Event.includes(:venue, talks: :speakers)
        .during(Date.new(@pagination.year))
        .where("time < ?", Date.current)
        .order(time: :desc)
  end

  private

  def build_pagination
    current_year = Date.current.year
    year = params.fetch(:year, current_year).to_i
    prev_year = year - 1
    next_year = year + 1

    OpenStruct.new(
      prev_year: (prev_year < PAGINATION_MIN_YEAR) ? nil : prev_year,
      year:,
      next_year: (next_year > current_year) ? nil : next_year
    )
  end
end
