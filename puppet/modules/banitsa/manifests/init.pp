class banitsa {
  include banitsa::auth
  include banitsa::upgrades
  include banitsa::monitor

  File {
    owner   => 'banitsa',
    group   => 'banitsa',
    require => User['banitsa']
  }

  # Make sure bash is installed. We want it as administrator's shell.
  package { 'bash': }

  # Use the banitsa user for deploy and applications run.
  user { 'banitsa':
    ensure     => present,
    home       => '/home/banitsa',
    managehome => true,
    shell      => '/bin/bash',
    require    => Package['bash']
  }

  # Make sure to create the user directory. Stuff like rbenv installation and
  # administrator friendly .bashrc files go here.
  file {
    '/home/banitsa':
      ensure => 'directory';

    '/home/banitsa/.bashrc':
      source => 'puppet:///modules/banitsa/bashrc';

    '/home/banitsa/.aliases':
      source => 'puppet:///modules/banitsa/aliases';
  }

  # Use this directory to serve the apps from and leave the home for homey
  # stuff. See above as an example for homey stuff.
  file { '/banitsa':
    ensure  => 'directory'
  }
}
