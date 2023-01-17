# frozen_string_literal: true

module Mailinglist
  extend self
  mattr_accessor :emails

  Member = Struct.new(:email)

  def each
    Array(emails).each do |email|
      yield Member.new(email)
    end
  end
end
