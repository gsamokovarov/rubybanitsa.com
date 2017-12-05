module Admin
  class EventsController < Admin::ApplicationController
    def create
      event = Event.create_with_venue(resource_params)

      redirect_to [namespace, event], notice: translate_with_resource('create.success')
    rescue ActiveRecord::RecordInvalid => err
      render :new, locals: { page: Administrate::Page::Form.new(dashboard, err.record) }
    end

    def publish
      requested_resource.publish
      redirect_to edit_event_url(requested_resource), notice: 'Event has been published'
    end
  end
end
