# frozen_string_literal: true

class EventsController < ApplicationController
  Pagination = Data.define :prev_year, :year, :next_year do
    @first_event_year = 2017

    def self.build(year)
      prev_year = year - 1 < @first_event_year ? nil : year - 1
      next_year = year + 1 > Date.current.year ? nil : year + 1

      new prev_year:, year:, next_year:
    end
  end

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
    @pagination = Pagination.build params.fetch(:year, Date.current.year).to_i
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
