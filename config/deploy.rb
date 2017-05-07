# frozen_string_literal: true

lock '3.8.1'

set :application, 'banitsa'
set :repo_url, 'git@github.com:gsamokovarov/rubybanitsa.com.git'
set :deploy_to, '/banitsa'
set :linked_dirs, fetch(:linked_dirs, []).push('tmp/pids', 'tmp/sockets', 'log')
set :ssh_options, forward_agent: true
