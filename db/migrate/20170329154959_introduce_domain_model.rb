class IntroduceDomainModel < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :time, null: false
      t.string :description, null: false

      t.timestamps null: false
    end

    create_table :venues do |t|
      t.string :description, null: false

      t.string :address, null: false
      t.float :latitude, default: 0, null: false
      t.float :longitude, default: 0, null: false

      t.timestamps null: false
    end

    create_join_table :events, :venues

    create_table :talks do |t|
      t.string :description, null: false
      t.string :url, default: '', null: false

      t.timestamps null: false
    end

    create_table :speakers do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :github_url, default: '', null: false
      t.string :twitter_url, default: '', null: false

      t.timestamps null: false
    end

    create_join_table :speakers, :talks
  end
end
