require "clockwork"

require_relative "boot"
require_relative "environment"


module Clockwork
  handler { |job| job.constantize.perform_later }

  every 1.day, "PostingExpirationReminderJob", at: "10:00"
end
