class Talk < ApplicationRecord
  has_many :speakers

  validates :description, presence: true
end
