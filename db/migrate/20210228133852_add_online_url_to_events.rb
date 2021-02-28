class AddOnlineUrlToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :online_url, :string, default: ""
  end
end
