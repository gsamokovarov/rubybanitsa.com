# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Banitsa
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = "Sofia"
    config.action_mailer.default_url_options = { host: "rubybanitsa.com" }
  end
end

Rails.application.routes.default_url_options[:host] = "rubybanitsa.com"
