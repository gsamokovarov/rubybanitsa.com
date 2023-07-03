class AddNotNullConstraintToVenueIdOnEvents < ActiveRecord::Migration[7.0]
  def change
    change_column_null :events, :venue_id, false
  end
end
