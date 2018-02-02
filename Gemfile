source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '= 5.2.0.beta2'

# Use Postgres as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '>= 3.7'

# Use a rack version that is not affected by CVE-2015-3225.
gem 'rack', '>= 1.6.8'

# Use SCSS for stylesheets
gem 'sass-rails'

# Administrate provides psuedo-automated admin interface for data input.
gem 'administrate'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use mini_racer as a lightweight alternative to therubyracer.
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Because you people are so nice for coming! We'll bring that nice RED CARPET
# for you.
gem 'redcarpet'

# Require environment variables pre Rails application boot.
gem 'early', require: false

# Faster application boot time.
gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  gem 'capybara', '~> 2.13.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Puppet deployment.
  gem 'librarian-puppet', require: false
  gem 'puppet', require: false
  gem 'puppet-lint', require: false

  # Use Capistrano for deployment. Yes, even puppet.
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
end

group :production do
  # Rack Timeout timeouts requests after a specified limit.
  gem 'rack-timeout'
end
