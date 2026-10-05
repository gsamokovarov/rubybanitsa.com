# frozen_string_literal: true

source "https://rubygems.org"

ruby File.read(".ruby-version")

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootsnap", require: false
gem "clockwork"
gem "cssbundling-rails", "~> 1.2"
gem "icalendar"
gem "image_processing"
gem "jsbundling-rails"
gem "puma", ">= 3.7"
gem "rack", ">= 1.6.8"
gem "rails"
gem "redcarpet"
gem "rubyzip", ">= 1.3.0"
gem "sassc-rails"
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"
gem "sqlite3"
gem "stimulus-rails", "~> 1.2"
gem "turbo-rails", "~> 1.4"

group :production do
  gem "rack-timeout"
end

group :development, :test do
  gem "capybara", ">= 2.15.0"
  gem "debug"
  gem "dotenv-rails", "~> 2.1"
  gem "factory_bot_rails"
end

group :development do
  gem "erb-formatter"
  gem "hamal"
  gem "rubocop", require: false
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "minitest-mock"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "webmock"
end
