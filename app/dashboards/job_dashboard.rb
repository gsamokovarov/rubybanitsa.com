require "administrate/base_dashboard"

class JobDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    photos: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    expires_at: Field::DateTime,
    company_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :description,
    :photos,
    :expires_at,
    :company_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :description,
    :photos,
    :expires_at,
    :company_id,
  ].freeze

  def permitted_attributes
    super + [photos: []]
  end

  # Overwrite this method to customize how jobs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(job)
  #   "Job ##{job.id}"
  # end
end
