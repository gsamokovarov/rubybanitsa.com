class AddNameToVenue < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :name, :string, default: "", null: false
    remove_column :venues, :description, :string, null: false
  end
end
