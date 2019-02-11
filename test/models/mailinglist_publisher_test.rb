# frozen_string_literal: true

require "test_helper"

class MailinglistPublisherTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  setup { Mailinglist.emails = nil }

  test "non-idempotent at the moment" do
    assert_not MailinglistPublisher.published?(nil)
  end

  test "sends emails for every member of the Mailinglist" do
    Mailinglist.emails = %w(genadi@example.com any@other.com)

    event = create :event, :impulsive

    assert_enqueued_jobs 2 do
      MailinglistPublisher.publish(event)
    end
  end
end
