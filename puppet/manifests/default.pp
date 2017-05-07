node default {
  require banitsa
  include apt

  $ruby_version = '2.4.1'

  class { 'rbenv': user => 'banitsa' }
  rbenv::install { $ruby_version: }

  class { 'server':
    user          => 'banitsa',
    root          => '/banitsa',
    server_name   => $::fqdn,
    ruby_version  => $ruby_version
  }
}
