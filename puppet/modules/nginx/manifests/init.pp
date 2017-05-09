class nginx {
  package { 'nginx': } -> class { 'nginx::letsencrypt': }

  # Disable the default site.
  file { '/etc/nginx/sites-enabled/default':
    ensure  => absent,
    notify  => Service['nginx'],
    require => Package['nginx']
  }

  # Setup SSL certificates.
  file {
    '/etc/nginx/ssl':
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      require => Package['nginx'];

    '/etc/nginx/ssl/dhparams.pem':
      source => 'puppet:///modules/nginx/dhparams.pem';
  }

  # Start nginx right now and also on boot.
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx']
  }
}
