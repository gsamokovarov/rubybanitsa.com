# frozen_string_literal: true

source "https://rubygems.org"

ruby File.read(".ruby-version")

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", github: "rails/rails"

# Use Postgres as the database for Active Record
gem "pg"

# Use Puma as the app server
gem "puma", ">= 3.7"

# Use a rack version that is not affected by CVE-2015-3225.
gem "rack", ">= 1.6.8"

# Administrate provides pseudo-automated admin interface for data input.
gem "administrate"
gem "administrate-field-active_storage"

# Use webpacker for the stimulus dependency.
gem "webpacker"

# Use SCSS for stylesheets.
gem "sassc-rails"

# Bring CoffeeScript for dependencies using CS in the assets but not explicitly
# depending on it.
gem "coffee-script"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# For use with Active Storage variants.
gem "image_processing"

# Use mini_racer as a lightweight alternative to therubyracer.
gem "mini_racer", platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more:
# https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"

# Because you people are so nice for coming! We'll bring that nice RED CARPET
# for you.
gem "redcarpet"

# Write mails in markdown and generate text and html mails automagically.
gem "maildown"

# Use in-process background queue, to save on Heroku bills.
gem "sucker_punch"

# Use clockwork for scheduled jobs.
gem "clockwork"

# For use with Active Storage for the production uploads.
gem "aws-sdk-s3", require: false

# Watir is a thin layer over selenium-webridver that is used to command a
# browser to post an event to facebook.
gem "chromedriver-helper"
gem "watir"

# Require environment variables pre Rails application boot.
gem "early", require: false

# Faster application boot time.
gem "bootsnap", require: false

group :production do
  # Rack Timeout timeouts requests after a specified limit.
  gem "rack-timeout"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15.0"
  gem "selenium-webdriver"

  # Use Factory Bot for testing factories.
  gem "factory_bot_rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem "spring"

  # Rubocop for consistent code formatting.
  gem "rubocop", require: false
end

group :test do
  gem "vcr"
  gem "webmock"

  # Track the testing progress with code coverage.
  gem "simplecov", require: false
end
