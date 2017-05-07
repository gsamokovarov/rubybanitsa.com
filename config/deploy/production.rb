# frozen_string_literal: true

require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

set :rails_env, 'production'

# Setup rbenv.
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

# No --deployment flags because of conflicting rolling-restart.
set :bundle_flags, '--quiet'
set :bundle_path, nil

server 'rubybanitsa.com', user: 'banitsa', roles: %w(db web job clock)

namespace :deploy do
  after 'symlink:release', :provision do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute :sudo, '/usr/sbin/service', 'banitsa', 'reload'
    end
  end
end
