class AddDirectionsToVenue < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :directions, :string, null: false, default: ""
  end
end
