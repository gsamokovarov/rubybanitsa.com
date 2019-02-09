class AddMeetupPublishedAt < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :meetup_published_at, :datetime
  end
end
