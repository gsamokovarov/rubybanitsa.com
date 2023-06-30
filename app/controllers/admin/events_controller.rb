# frozen_string_literal: true

module Admin
  class EventsController < Admin::ApplicationController
    def publish
      event = Event.find(params[:event_id])
      event.publish

      redirect_to edit_admin_event_url(event), notice: "Event is being published"
    end
  end
end
