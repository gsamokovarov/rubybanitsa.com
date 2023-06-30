class DropLocations < ActiveRecord::Migration[7.0]
  def change
    drop_table :locations
  end
end
