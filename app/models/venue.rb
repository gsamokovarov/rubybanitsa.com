# frozen_string_literal: true

class Venue < ApplicationRecord
  has_many :events

  validates :name, presence: true
  validates :address, presence: true, unless: :online?
  validates :place_id, presence: true, unless: :online?
end
