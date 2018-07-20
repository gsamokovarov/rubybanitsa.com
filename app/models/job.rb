class Job < ApplicationRecord
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true

  def expired?
    expires_at.past?
  end
end
