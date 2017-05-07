# Configures automatic package upgrades for Ubuntu based systems.
#
# By default, only security updates are installed.
class banitsa::upgrades {
  package { 'unattended-upgrades': }

  # See https://help.ubuntu.com/community/AutomaticSecurityUpdates for more
  # information.
  file { '/etc/apt/apt.conf.d/20auto-upgrades':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/banitsa/upgrades/20auto-upgrades',
    require => Package['unattended-upgrades']
  }

  # This configuration cleans up unused packages after auto-update.
  file { '/etc/apt/apt.conf.d/50unattended-upgrades':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/banitsa/upgrades/50unattended-upgrades',
    require => Package['unattended-upgrades']
  }
}
