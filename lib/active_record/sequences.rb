module ActiveRecord
  module Sequences
    def sequence_for(table, on:)
      seq_name = "#{table.to_s.singularize}_id_seq"

      <<~SQL
        CREATE SEQUENCE IF NOT EXISTS #{seq_name};
        ALTER SEQUENCE #{seq_name} OWNED BY #{table}.#{on};
        ALTER TABLE #{table} ALTER COLUMN #{on} SET DEFAULT nextval('#{seq_name}');
      SQL
    end
  end
end
