# frozen_string_literal: true

set :rails_env, 'production'

# Setup rbenv.
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

# No --deployment flags because of conflicting rolling-restart.
set :bundle_flags, '--quiet'
set :bundle_path, nil

set :linked_files, %w(db/production.sqlite3)
set :linked_dirs, %w(tmp/pids tmp/sockets log public/assets)

server 'rubybanitsa.com', user: 'banitsa', roles: %w(db web job clock)

namespace :deploy do
  after 'symlink:release', :provision do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute :sudo, '/usr/sbin/service', 'banitsa', 'reload'
    end
  end
end
