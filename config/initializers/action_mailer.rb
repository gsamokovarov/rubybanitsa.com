# frozen_string_literal: true

Rails.application.configure do
  config.action_mailer.deliver_later_queue_name = :default
  config.action_mailer.delivery_method = :smtp

  if Rails.env.production?
    config.action_mailer.smtp_settings = {
      authentication: ENV["SMTP_AUTHENTICATION"] || :login,
      address: ENV["SMTP_ADDRESS"],
      port: (ENV["SMTP_PORT"] || "587").to_i,
      domain: ENV["SMTP_DOMAIN"],
      user_name: ENV["SMTP_USER_NAME"],
      password: ENV["SMTP_PASSWORD"],
    }
  end

  config.to_prepare do
    ApplicationMailer.default from: (ENV["MAIL_DEFAULT_SENDER"] || ENV["SMTP_USER_NAME"])
  end
end

