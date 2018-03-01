module Admin
  class EventsController < Admin::ApplicationController
    def create
      event = Event.create_with_venue(resource_params)

      redirect_to [namespace, event], notice: translate_with_resource('create.success')
    rescue ActiveRecord::RecordInvalid => err
      render :new, locals: { page: Administrate::Page::Form.new(dashboard, err.record) }
    end

    def publish
      event = Event.find(params[:event_id])
      event.publish

      redirect_to edit_admin_event_url(event), notice: 'Event has been published'
    end
  end
end
