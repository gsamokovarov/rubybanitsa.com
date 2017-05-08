# frozen_string_literal: true

server 'rubybanitsa.com', user: 'root', roles: %w(provision)

SSHKit.config.command_map[:puppet] = '/opt/puppetlabs/bin/puppet'

namespace :deploy do
  after 'symlink:release', :provision do
    on roles(:provision), in: :sequence, wait: 10 do
      execute :puppet, 'apply',
        "#{release_path}/puppet/manifests/default.pp",
        "--modulepath=#{release_path}/puppet/modules:#{release_path}/puppet/vendor",
        '--verbose', '--debug'
    end
  end
end
