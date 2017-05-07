define rbenv::install($version = $name) {
  require rbenv

  # Make sure rbenv is available in exec resources.
  Exec {
    user        => $rbenv::user,
    environment => "RBENV_ROOT=${rbenv::rbenv_root}",
    path        => [
      "${rbenv::rbenv_root}/bin",
      "${rbenv::rbenv_root}/shims",
      '/usr/sbin',
      '/usr/bin',
      '/sbin',
      '/bin'
    ],
    cwd     => "/home/${rbenv::user}",
    timeout => "3600"
  }

  exec { "install ruby ${version}":
    command => "rbenv install ${version}",
    creates => "${rbenv::rbenv_root}/versions/${version}/bin/ruby",
  }

  # Never, ever have I needed Ruby without bundler installed.
  exec { "install bundler for ruby ${version}":
    command     => "gem install bundler",
    creates     => "${rbenv::rbenv_root}/versions/${version}/bin/bundler",
    environment => "RBENV_VERSION=${version}",
    require     => Exec["install ruby ${version}"]
  }

  exec { "install jemalloc for ruby ${version}":
    command     => "gem install jemalloc",
    creates     => "${rbenv::rbenv_root}/versions/${version}/bin/bundler",
    environment => "RBENV_VERSION=${version}",
    require     => Exec["install ruby ${version}"]
  }
}
