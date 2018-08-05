# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :event
  belongs_to :venue

  delegate :name, to: :venue
  delegate :address, to: :venue
end
