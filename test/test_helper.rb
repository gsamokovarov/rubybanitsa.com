# frozen_string_literal: true

require "simplecov"
SimpleCov.start("rails") do
  add_filter "app/dashboards"
  add_filter "app/controllers/admin"
  add_filter "config/"
end

ENV["ADMIN_NAME"] = ENV["ADMIN_PASSWORD"] = "admin"

require_relative "../config/environment"

require "rails/test_help"
require "active_support/testing/method_call_assertions"
require "active_record/sql_counter"
require "webmock/minitest"
require "vcr"

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
  include ActiveSupport::Testing::MethodCallAssertions
  include FactoryBot::Syntax::Methods
  include SQLQueriesAssertions
  include TestingPublisher
end

Event.publisher = Publisher.new(TestingPublisher)

Admin::ApplicationController.admin_name = ENV["ADMIN_NAME"]
Admin::ApplicationController.admin_password = ENV["ADMIN_PASSWORD"]

module IntegrationAuthorization
  def basic_http_auth
    {
      "Authorization" => ActionController::HttpAuthentication::Basic.encode_credentials(ENV["ADMIN_NAME"], ENV["ADMIN_PASSWORD"])
    }
  end
end

class ActionDispatch::IntegrationTest
  include IntegrationAuthorization
end

VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join("test", "cassettes")
  config.hook_into :webmock
end
