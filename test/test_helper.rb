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
require "sucker_punch/testing/inline"
require "webmock/minitest"

module SQLQueriesAssertions
  def assert_sql_queries(count, &block)
    assert_equal count, ActiveRecord::SQLCounter.count(&block)
  end
end

class ActiveSupport::TestCase
  include ActiveSupport::Testing::MethodCallAssertions
  include FactoryBot::Syntax::Methods
  include SQLQueriesAssertions
end

Admin::ApplicationController.admin_name = ENV["ADMIN_NAME"]
Admin::ApplicationController.admin_password = ENV["ADMIN_PASSWORD"]

ApplicationMailer.default from: "gsamokovarov@gmail.com"

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

module ControllerCatchAllRoutes
  Router = ActionDispatch::Routing::RouteSet.new
  Router.draw do
    ActiveSupport::Deprecation.silence { get ":controller(/:action)" }
  end

  def before_setup
    @routes = Router
    super
  end
end

class ActionController::TestCase
  include ControllerCatchAllRoutes
end
