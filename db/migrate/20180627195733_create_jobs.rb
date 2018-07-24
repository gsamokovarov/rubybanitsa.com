class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    drop_table :jobs, if_exists: true, force: true
    drop_table :companies, if_exists: true, force: true

    create_table :companies do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps null: false
    end

    create_table :jobs do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.datetime :published_at
      t.datetime :expires_at

      t.belongs_to :company, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
