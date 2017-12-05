require_relative '../config/environment'

require 'rails/test_help'
require 'active_record/sql_counter'

module SQLQueriesAssertions
  def assert_sql_queries(count, &block)
    assert_equal count, ActiveRecord::SQLCounter.count(&block)
  end
end

module TestingPublisher
  extend ActiveSupport::Concern

  cattr_reader :events, default: []

  included do
    setup { TestingPublisher.events.clear }
  end

  def self.publish(event)
    events << event
  end
end

Event.publisher = Publisher.new(TestingPublisher)

class ActiveSupport::TestCase
  include SQLQueriesAssertions
  include TestingPublisher
end

