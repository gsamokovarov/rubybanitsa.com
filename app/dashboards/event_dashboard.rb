# frozen_string_literal: true

require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    location: Field::HasOne,
    venue: Field::BelongsTo,
    id: Field::Number,
    time: Field::DateTime,
    description: Field::Text,
    meetup_url: Field::String,
    facebook_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :location,
    :time,
    :description
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :location,
    :time,
    :description,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :venue,
    :time,
    :description,
    :meetup_url,
    :facebook_url
  ].freeze

  def display_resource(event)
    EventInfo.new(event).human_date
  end
end
