# frozen_string_literal: true

require "clockwork"

require_relative "boot"
require_relative "environment"

module Clockwork
  handler { |job| job.constantize.perform_later }
end
