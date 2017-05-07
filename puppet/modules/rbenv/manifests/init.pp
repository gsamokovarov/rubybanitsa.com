class rbenv(
  $user,
  $home = "/home/${user}",
  $rbenv_repo = 'https://github.com/sstephenson/rbenv.git',
  $ruby_build_repo = "https://github.com/sstephenson/ruby-build.git",
  $gem_rehash_repo = "https://github.com/sstephenson/rbenv-gem-rehash.git"
) {
  require rbenv::packages

  Exec {
    path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin'],
    user => $user,
    cwd  => "/home/${user}"
  }

  $rbenv_root = "${home}/.rbenv"
  $ruby_build_root = "${rbenv_root}/plugins/ruby-build"
  $gem_rehash_root = "${rbenv_root}/plugins/rbenv-gem-rehash"

  exec { "install rbenv for ${user}":
    command => "git clone ${rbenv_repo} ${rbenv_root}",
    creates => "${rbenv_root}/bin/rbenv",
    require => Package['git'];
  }

  exec { "install ruby build for ${user}":
    command => "git clone ${ruby_build_repo} ${ruby_build_root}",
    creates => "${ruby_build_root}/bin/rbenv-install",
    require => Exec["install rbenv for ${user}"];
  }

  exec { "update ruby build for ${user}":
    command => "git pull origin master",
    cwd     =>  $ruby_build_root,
    require => Exec["install ruby build for ${user}"];
  }

  exec { "install gem rehash for ${user}":
    command => "git clone ${gem_rehash_repo} ${gem_rehash_root}",
    creates => "${gem_rehash_root}/rubygems_plugin.rb",
    require => Exec["install rbenv for ${user}"];
  }
}
