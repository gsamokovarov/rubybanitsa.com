class PostgresTransition < ActiveRecord::Migration[5.2]
  def up
    execute sequence_for(:events, on: :id)
    execute sequence_for(:speakers, on: :id)
    execute sequence_for(:talks, on: :id)
    execute sequence_for(:venues, on: :id)
  end

  private

  def sequence_for(table, on:)
    seq_name = "#{table.to_s.singularize}_id_seq"

    <<~SQL
      CREATE SEQUENCE #{seq_name};
      ALTER SEQUENCE #{seq_name} OWNED BY #{table}.#{on};
      ALTER TABLE #{table} ALTER COLUMN #{on} SET DEFAULT nextval('#{seq_name}');
    SQL
  end
end
