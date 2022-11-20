# frozen_string_literal: true

class Company < ApplicationRecord
  has_one_attached :logo
  has_one_attached :thumbnail
  has_many_attached :photos

  has_many :jobs
  has_many :contacts
  has_many :sponsorships

  validates :name, presence: true
  validates :description, presence: true
end
