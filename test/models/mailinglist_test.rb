# frozen_string_literal: true

require "test_helper"

class MailinglistTest < ActiveSupport::TestCase
  setup { Mailinglist.emails = nil }

  test "yields a Member for every email given by configuration" do
    Mailinglist.emails = %w[genadi@example.com]

    Mailinglist.each do |member|
      assert_equal "genadi@example.com", member.email
    end
  end
end
