class RenameEventsVenues < ActiveRecord::Migration[5.1]
  def change
    rename_table :events_venues, :locations
  end
end
