# frozen_string_literal: true

class Meetup
  class Error < StandardError
    include Enumerable

    Entry = Struct.new(:code, :message)

    def errors
      JSON.parse(message)["errors"].map do |err|
        Entry.new(err["code"], err["message"])
      end
    end

    delegate :each, to: :errors
  end
end
