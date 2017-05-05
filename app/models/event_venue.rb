class EventVenue < ApplicationRecord
  self.table_name = :events_venues

  belongs_to :event
  belongs_to :venue
end
