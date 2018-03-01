require 'active_record/sequences'

class PostgresTransition < ActiveRecord::Migration[5.2]
  include ActiveRecord::Sequences

  def up
    execute sequence_for(:events, on: :id)
    execute sequence_for(:speakers, on: :id)
    execute sequence_for(:talks, on: :id)
    execute sequence_for(:venues, on: :id)
  end
end
