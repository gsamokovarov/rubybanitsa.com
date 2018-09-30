# frozen_string_literal: true

Rails.configuration.to_prepare do
  ApplicationMailer.default from: (ENV["MAIL_DEFAULT_SENDER"] || ENV["SMTP_USER_NAME"])
end
