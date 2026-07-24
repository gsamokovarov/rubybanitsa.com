# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.page(number, per_page: 50) = limit(per_page).offset(per_page.to_i * [number.to_i - 1, 0].max)
  def self.total_count = offset(nil).limit(nil).count

  def self.time_as_boolean(attribute, field: "#{attribute}_at")
    define_method attribute, -> { read_attribute(field) ? true : false }
    define_method "#{attribute}=", -> value do
      if value.in?(ActiveModel::Type::Boolean::FALSE_VALUES)
        write_attribute(field, nil)
      else
        write_attribute(field, read_attribute(field) || Time.current)
      end
    end
    alias_method "#{attribute}?", attribute
  end
end
