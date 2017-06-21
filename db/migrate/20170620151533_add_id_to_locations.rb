class AddIdToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :id, :primary_key
  end
end
