# frozen_string_literal: true

server 'rubybanitsa.com', user: 'root', roles: %w(provision)

namespace :deploy do
  after 'deploy:check', :bootstrap do
    on roles(:provision), in: :sequence, wait: 10 do
      execute 'apt-get', 'install', '-y', 'puppet'
    end
  end

  after 'symlink:release', :provision do
    on roles(:provision), in: :groups, limit: 3, wait: 10 do
      execute 'puppet', 'apply', "#{current_path}/puppet/manifests/default.pp",
        "--manifestdir=#{current_path}/puppet/manifests",
        "--modulepath=#{current_path}/puppet/modules:#{current_path}/puppet/vendor",
        '--verbose'
    end
  end
end
