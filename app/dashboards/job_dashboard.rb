# frozen_string_literal: true

require "administrate/base_dashboard"

class JobDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    company: Field::BelongsTo,
    contacts: Field::HasMany,
    title: Field::String,
    description: Field::Text,
    application_url: Field::String,
    publish_at: Field::DateTime,
    published?: Field::Boolean,
    expires_at: Field::DateTime,
    expired?: Field::Boolean,
    photos: Field::ActiveStorage,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :company,
    :title,
    :published?,
    :expired?
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :company,
    :title,
    :description,
    :application_url,
    :contacts,
    :publish_at,
    :expires_at,
    :photos,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :company,
    :title,
    :description,
    :application_url,
    :publish_at,
    :expires_at,
    :photos
  ].freeze

  def permitted_attributes
    super + [photos: []]
  end

  def display_resource(job)
    job.title
  end
end
