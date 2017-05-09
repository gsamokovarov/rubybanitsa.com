# frozen_string_literal: true

# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Initialize all the plugins
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

# Future versions of Capistrano will not load the Git SCM.
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
