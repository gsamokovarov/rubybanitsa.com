Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/xenial64'

  config.vm.synced_folder '.', '/vagrant',
    type: 'rsync', rsync__exclude: '.git/',
    owner: 'banitsa', group: 'banitsa'

  # The 80 port may be taken by an already running application, you can
  # override it by specifying the PORT environment variable
  config.vm.network :forwarded_port, guest: 80, host: ENV.fetch('PORT', 8080)

  # Raise the open files limit to try to account for OSX + VirtualBox insanity.
  config.vm.provision :shell, inline: 'ulimit -n 4048'

  config.vm.provision :shell, inline: <<-SHELL
    apt-get update && apt-get install -y puppet
  SHELL

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = 'default.pp'
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = ['puppet/modules', 'puppet/vendor']
    puppet.options        = '--verbose --debug' if ENV['DEBUG']
  end

  # Let Vagrant start offline.
  config.vm.box_check_update = false
end
