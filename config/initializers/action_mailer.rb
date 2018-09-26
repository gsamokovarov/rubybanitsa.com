# frozen_string_literal: true

if Rails.env.production?
  Rails.application.configure do
    config.action_mailer.deliver_later_queue_name = :default
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      authentication: ENV["SMTP_AUTHENTICATION"] || :login,
      address: ENV["SMTP_ADDRESS"],
      port: ENV["SMTP_PORT"] || "587",
      domain: ENV["SMTP_DOMAIN"],
      user_name: ENV["SMTP_USER_NAME"],
      password: ENV["SMTP_PASSWORD"],
    }
  end

  ApplicationMailer.default_sender = ENV["SMTP_USER_NAME"] || ENV["MAIL_DEFAULT_SENDER"]
end
