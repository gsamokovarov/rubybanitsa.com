# frozen_string_literal: true

require "administrate/base_dashboard"

class LocationDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    address: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :address
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :address
  ].freeze

  FORM_ATTRIBUTES = [
    :address
  ].freeze

  def display_resource(location)
    location.name
  end
end
