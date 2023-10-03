# frozen_string_literal: true

require "administrate/base_dashboard"

class SponsorshipDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    event: Field::BelongsTo,
    company: Field::BelongsTo,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    event
    company
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    event
    company
  ].freeze

  FORM_ATTRIBUTES = %i[
    event
    company
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  def display_resource(sponsorship)
    "Sponsorship #{sponsorship.id} by #{sponsorship.company.name}"
  end
end
