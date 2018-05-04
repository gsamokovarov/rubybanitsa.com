ENV['ADMIN_NAME'] = ENV['ADMIN_PASSWORD'] = 'admin'

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

class ActiveSupport::TestCase
  include SQLQueriesAssertions
  include TestingPublisher
end

Event.publisher = Publisher.new(TestingPublisher)

Admin::ApplicationController.admin_name = ENV['ADMIN_NAME']
Admin::ApplicationController.admin_password = ENV['ADMIN_PASSWORD']

module IntegrationAuthorization
  def basic_http_auth
    {
      'Authorization' => ActionController::HttpAuthentication::Basic.encode_credentials(ENV['ADMIN_NAME'], ENV['ADMIN_PASSWORD'])
    }
  end
end

class ActionDispatch::IntegrationTest
  include IntegrationAuthorization
end
