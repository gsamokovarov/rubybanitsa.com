class AddOnlineToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :online, :boolean, default: false
  end
end
