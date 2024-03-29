# frozen_string_literal: true

require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    time: Field::DateTime,
    venue: Field::BelongsTo,
    description: Field::Text,
    online_url: Field::String,
    meetup_url: Field::String,
    facebook_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    talks: Field::HasMany,
    sponsorships: Field::HasMany,
    ogp_image: Field::ActiveStorage,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :venue,
    :time,
    :description
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :time,
    :venue,
    :description,
    :talks,
    :sponsorships,
    :ogp_image,
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
    :ogp_image,
    :online_url,
    :facebook_url
  ].freeze

  def display_resource(event)
    "[#{event.id}] #{EventDetails.new(event).title}"
  end
end
