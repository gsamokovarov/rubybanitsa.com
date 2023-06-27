# frozen_string_literal: true

class Speaker < ApplicationRecord
  has_and_belongs_to_many :talks
  has_many :events, through: :talks

  has_one_attached :avatar

  validates :name, presence: true
end
