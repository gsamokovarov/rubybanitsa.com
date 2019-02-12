require "administrate/base_dashboard"

class ContactDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    company: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :company,
    :name,
    :email,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :company,
    :id,
    :name,
    :email,
  ].freeze

  FORM_ATTRIBUTES = [
    :company,
    :name,
    :email,
  ].freeze

  def display_resource(contact)
    "#{contact.name} <#{contact.email}>"
  end
end
