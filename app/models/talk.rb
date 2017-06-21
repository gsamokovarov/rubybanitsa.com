class Talk < ApplicationRecord
  has_and_belongs_to_many :speakers

  validates :title, presence: true
end
