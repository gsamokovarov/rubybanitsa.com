# frozen_string_literal: true

require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    time: Field::DateTime,
    location: Field::HasOne,
    venue: Field::BelongsTo,
    description: Field::Text,
    online_url: Field::String,
    meetup_url: Field::String,
    facebook_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    sponsorships: Field::HasMany
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :location,
    :time,
    :description
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :time,
    :location,
    :description,
    :online_url,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :name,
    :time,
    :venue,
    :description,
    :sponsorships,
    :online_url,
    :facebook_url
  ].freeze

  def display_resource(event)
    "[#{event.id}] #{EventInfo.new(event).title}"
  end
end
