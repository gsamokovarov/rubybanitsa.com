# frozen_string_literal: true

source "https://rubygems.org"

ruby File.read(".ruby-version")

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails"

# Use Postgres as the database for Active Record
gem "pg"

# Use Puma as the app server
gem "puma", ">= 3.7"

# Use a rack version that is not affected by CVE-2015-3225.
gem "rack", ">= 1.6.8"

# Administrate provides pseudo-automated admin interface for data input.
gem "administrate"
gem "administrate-field-active_storage"

# Use jsbundling for the stimulus dependency.
gem "cssbundling-rails", "~> 1.2"
gem "jsbundling-rails"

# Use SCSS for stylesheets.
gem "sassc-rails"

# For use with Active Storage variants.
gem "image_processing"

# Because you people are so nice for coming! We'll bring that nice RED CARPET
# for you.
gem "redcarpet"

# Calendar events, because I know you won't join us online if you ain't having
# an event in your calendar.
gem "icalendar"

# Use in-process background queue, to save on Heroku bills.
gem "sucker_punch"

# Use clockwork for scheduled jobs.
gem "clockwork"

# For use with Active Storage for the production uploads.
gem "aws-sdk-s3", require: false

# Keep rubyzip above `1.3.0` to avoid CVE-2019-16892.
gem "rubyzip", ">= 1.3.0"

# Require environment variables pre Rails application boot.
gem "early", require: false

# Faster application boot time.
gem "bootsnap", require: false

# Hotwire
gem "stimulus-rails", "~> 1.2"
gem "turbo-rails", "~> 1.4"

group :production do
  # Rack Timeout timeouts requests after a specified limit.
  gem "rack-timeout"
end

group :development, :test do
  # Invoke a debugger from 'binding.irb'.
  gem "debug"

  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15.0"

  # Use Factory Bot for testing factories.
  gem "factory_bot_rails"

  gem "dotenv-rails", "~> 2.1"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"

  # Rubocop for consistent code formatting.
  gem "rubocop", require: false

  # Format ERB files.
  gem "erb-formatter"
end

group :test do
  gem "selenium-webdriver"
  gem "webmock"

  # Track the testing progress with code coverage.
  gem "simplecov", require: false
end

# Use Redis for Action Cable
gem "redis", "~> 4.0"
