class AddEventIdToTalks < ActiveRecord::Migration[5.1]
  def change
    add_reference :talks, :event, foreign_key: true
  end
end
