class AddVenueIdToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :venue, null: true, foreign_key: true

    up_only do
      execute <<~SQL
        update events
        set venue_id = locations.venue_id
        from locations
        where events.id = locations.event_id
      SQL
    end
  end
end
