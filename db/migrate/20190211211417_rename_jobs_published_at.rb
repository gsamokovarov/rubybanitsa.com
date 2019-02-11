class RenameJobsPublishedAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :published_at, :publish_at
  end
end
