class Event < ApplicationRecord
  has_one :venue, through: :event_venues

  validates :time, presence: true
  validates :description, presence: true

  def human_date
    weekday = time.to_s(:weekday)
    ordinal_day = time.to_s(:ordinal_day)
    month_name = time.to_s(:month_name)

    "#{weekday}, #{ordinal_day} of #{month_name}"
  end

  def human_time
    time.to_s(:time_only)
  end
end
