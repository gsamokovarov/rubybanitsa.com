# frozen_string_literal: true

class Company < ApplicationRecord
  has_one_attached :logo
  has_many_attached :photos

  has_many :jobs

  validates :name, presence: true
  validates :description, presence: true
end
