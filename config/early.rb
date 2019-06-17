# frozen_string_literal: true

require "early"

Early :development do
  travis

  default :ADMIN_NAME, "admin"
  default :ADMIN_PASSWORD, "admin"
end

Early do
  default :RACK_TIMEOUT_SERVICE_TIMEOUT, 25 # seconds
  default :GOOGLE_API_KEY, "AIzaSyB6mPgfYkFaseJDB7SI9Rv0RwPSg7wPqfg"
  default :MAIL_DEFAULT_SENDER, "gsamokovarov+rubybanitsa@gmail.com"

  require :ADMIN_NAME, :ADMIN_PASSWORD
  require :MEETUP_API_KEY
end

Early :production do
  require :SMTP_ADDRESS, :SMTP_DOMAIN, :SMTP_USER_NAME, :SMTP_PASSWORD
  require :SLACK_INVITE_URL
end
