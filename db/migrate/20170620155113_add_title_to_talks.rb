class AddTitleToTalks < ActiveRecord::Migration[5.1]
  def change
    add_column :talks, :title, :string, null: false, default: 'Unknown'
  end
end
