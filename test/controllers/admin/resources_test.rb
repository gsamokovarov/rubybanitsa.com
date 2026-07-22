# frozen_string_literal: true

require "test_helper"

module Admin
  class ResourcesTest < ActionDispatch::IntegrationTest
    RESOURCES = %w[events talks speakers venues sponsorships jobs companies contacts].freeze

    setup do
      @event = create :event, :impulsive
      @job = create :job, :fan_see
      create :contact, :fan_see

      speaker = Speaker.create! name: "Genadi", description: "Ruby developer"
      Talk.create! title: "Vibes", description: "All about the vibes", event: @event, speakers: [speaker]
      Sponsorship.create! event: @event, company: @job.company
    end

    test "indexes render behind basic auth" do
      RESOURCES.each do |resource|
        get "/admin/#{resource}", headers: basic_http_auth
        assert_response :success, "GET /admin/#{resource}"
      end
    end

    test "new forms render behind basic auth" do
      RESOURCES.each do |resource|
        get "/admin/#{resource}/new", headers: basic_http_auth
        assert_response :success, "GET /admin/#{resource}/new"
      end
    end

    test "show doubles as the edit form" do
      get admin_event_path(@event), headers: basic_http_auth
      assert_response :success

      get edit_admin_job_path(@job), headers: basic_http_auth
      assert_response :success
    end

    test "requires basic auth" do
      get admin_events_path
      assert_response :unauthorized
    end
  end
end
