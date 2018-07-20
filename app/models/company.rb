class Company < ApplicationRecord
  has_one_attached :logo
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
end
