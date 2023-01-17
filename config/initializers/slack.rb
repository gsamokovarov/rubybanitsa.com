# frozen_string_literal: true

Rails.configuration.to_prepare do
  Slack.invite_url = ENV["SLACK_INVITE_URL"]
end
