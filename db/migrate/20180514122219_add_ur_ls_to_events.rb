class AddUrLsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :meetup_url, :string, null: false, default: ''
    add_column :events, :facebook_url, :string, null: false, default: ''
  end
end
