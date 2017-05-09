# frozen_string_literal: true

set :deploy_to, '/banitsa/provision'

server 'rubybanitsa.com', user: 'root', roles: %w(provision)

namespace :deploy do
  after 'deploy:check', :bootstrap do
    on roles(:provision), in: :sequence, wait: 10 do
      execute 'apt-get', 'update'
      execute 'apt-get', 'install', '-y', 'puppet'
    end
  end

  after 'symlink:release', :provision do
    on roles(:provision), in: :sequence, wait: 10 do
      execute :puppet, 'apply',
        "#{release_path}/puppet/manifests/default.pp",
        "--modulepath=#{release_path}/puppet/modules:#{release_path}/puppet/vendor",
        '--verbose'
    end
  end
end
