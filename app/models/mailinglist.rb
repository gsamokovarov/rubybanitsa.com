# frozen_string_literal: true

module Mailinglist
  mattr_accessor :emails

  Member = Struct.new(:email)

  def self.each
    Array(emails).each do |email|
      yield Member.new(email)
    end
  end
end
