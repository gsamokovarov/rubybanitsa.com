require 'active_record/sequences'

class PostgresTransitionLocations < ActiveRecord::Migration[5.2]
  include ActiveRecord::Sequences

  def up
    execute sequence_for(:locations, on: :id)
  end
end
