# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :email, presence: true
end
