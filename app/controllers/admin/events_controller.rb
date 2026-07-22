# frozen_string_literal: true

module Admin
  class EventsController < Admin::ApplicationController
    def index
      @events = scope Event.includes(:venue)
    end

    def show
      @event = Event.find params[:id]
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new event_params

      if @event.save
        redirect_to admin_events_path, notice: "Event created"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @event = Event.find params[:id]

      render :show
    end

    def update
      @event = Event.find params[:id]

      if @event.update event_params
        redirect_to admin_events_path, notice: "Event updated"
      else
        render :show, status: :unprocessable_entity
      end
    end

    def destroy
      Event.find(params[:id]).destroy

      redirect_to admin_events_path, notice: "Event deleted"
    end

    def publish
      event = Event.find(params[:event_id])
      event.publish

      redirect_to edit_admin_event_url(event), notice: "Event is being published"
    end

    private def event_params
      params.require(:event).permit(:name, :vibe, :time, :venue_id, :description, :online_url, :facebook_url, :ogp_image)
    end
  end
end
