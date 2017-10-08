class DropVenueLatLon < ActiveRecord::Migration[5.1]
  def change
    remove_column :venues, :latitude, :float, default: 0.0, null: false
    remove_column :venues, :longitude, :float, default: 0.0, null: false

    add_column :venues, :place_id, :string, default: "", null: false
  end
end
