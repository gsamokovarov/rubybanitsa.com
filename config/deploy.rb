# frozen_string_literal: true

lock '3.10.0'

set :application, 'banitsa'
set :repo_url, 'git@github.com:gsamokovarov/rubybanitsa.com.git'
set :deploy_to, '/banitsa'
set :ssh_options, forward_agent: true

set :bundle_flags, '--verbose'
set :bundle_without, nil
