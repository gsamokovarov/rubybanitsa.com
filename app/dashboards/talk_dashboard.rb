# frozen_string_literal: true

require "administrate/base_dashboard"

class TalkDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    url: Field::String,
    event: Field::BelongsTo,
    speakers: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :description,
    :url,
    :event,
    :speakers
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :description,
    :url,
    :event,
    :speakers,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :title,
    :description,
    :url,
    :event,
    :speakers
  ].freeze

  def display_resource(talk)
    talk.title
  end
end
