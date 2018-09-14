class AddApplicationUrlToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :application_url, :string, default: "", null: false
  end
end
