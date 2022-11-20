# frozen_string_literal: true

class Sponsorship < ApplicationRecord
  belongs_to :event
  belongs_to :company
end
