# frozen_string_literal: true

require "administrate/base_dashboard"

class CompanyDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    contacts: Field::HasMany,
    logo: Field::ActiveStorage,
    thumbnail: Field::ActiveStorage,
    photos: Field::ActiveStorage,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :thumbnail,
    :name
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :contacts,
    :logo,
    :thumbnail,
    :photos,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :name,
    :description,
    :logo,
    :thumbnail,
    :photos
  ].freeze

  def permitted_attributes
    super + [photos: []]
  end

  def display_resource(company)
    company.name
  end
end
