# frozen_string_literal: true

class Talk < ApplicationRecord
  belongs_to :event
  has_and_belongs_to_many :speakers

  validates :title, presence: true
end
