# frozen_string_literal: true

require "administrate/base_dashboard"

class VenueDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    address: Field::String,
    place_id: Field::String,
    online: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
    directions: Field::Text,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :address,
    :place_id,
    :online
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :address,
    :place_id,
    :online,
    :created_at,
    :updated_at,
    :directions
  ].freeze

  FORM_ATTRIBUTES = [
    :name,
    :address,
    :place_id,
    :online,
    :directions
  ].freeze

  def display_resource(venue)
    venue.name
  end
end
