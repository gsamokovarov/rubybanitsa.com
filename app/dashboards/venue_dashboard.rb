# frozen_string_literal: true

require "administrate/base_dashboard"

class VenueDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    address: Field::String,
    place_id: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :address,
    :place_id
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :address,
    :place_id,
    :created_at,
    :updated_at,
    :name
  ].freeze

  FORM_ATTRIBUTES = [
    :address,
    :place_id,
    :name
  ].freeze

  def display_resource(venue)
    venue.name
  end
end
