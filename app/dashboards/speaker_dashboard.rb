# frozen_string_literal: true

require "administrate/base_dashboard"

class SpeakerDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    github_url: Field::String,
    twitter_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :github_url
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :github_url,
    :twitter_url,
    :created_at,
    :updated_at
  ].freeze

  FORM_ATTRIBUTES = [
    :name,
    :description,
    :github_url,
    :twitter_url
  ].freeze

  def display_resource(speaker)
    speaker.name
  end
end
