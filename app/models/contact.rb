# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :email, presence: true

  def first_name
    name.split(" ").first.to_s
  end
end
