class server($user, $ruby_version, $root, $server_name, $home = "/home/${user}",) {
  require server::packages

  File {
    owner => $user,
    group => $user
  }

  Service {
    provider => systemd
  }

  ensure_resource(file, [
    "${root}",
    "${root}/releases",
    "${root}/shared",
    "${root}/shared/config",
    "${root}/shared/system",
    "${root}/shared/log",
    "${root}/shared/pids",
  ], {
    ensure => 'directory'
  })

  softlink { "${root}/current":
    fallback => "${root}/releases/00000000000000"
  }

  # This application acts as a standin for banitsa, so we can start the init
  # scripts the first Puppet run.
  dummy { "${root}/releases/00000000000000":
    application  => 'banitsa',
    ruby_version => $ruby_version,
    port         => 3000,
    user         => $user,
    require      => File["${root}/releases"]
  }

  # Create a systemd job to supervise the service.
  file { '/etc/systemd/system/banitsa.service':
    mode    => '0755',
    content => template('server/banitsa.service.erb')
  }

  exec { 'detect banitsa web service changes':
    command => '/bin/systemctl daemon-reload',
    require => File['/etc/systemd/system/banitsa.service']
  }

  nginx::vhost { $server_name:
    content => template('server/nginx.conf.erb'),
  }

  # Supervise and run the process on boot.
  service { 'banitsa.service':
    ensure  => running,
    enable  => true,
    require => [File['/etc/systemd/system/banitsa.service'],
                Exec['detect banitsa web service changes']]
  }

  server::sudo { $user: }
}
