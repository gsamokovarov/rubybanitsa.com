define dummy(
  $port,
  $application,
  $user,
  $ruby_version,
  $path = $title,
) {
  Exec {
    path => [
      "/home/${user}/.rbenv/shims",
      "/home/${user}/.rbenv/bin",
      '/usr/sbin',
      '/usr/bin',
      '/sbin',
      '/bin'
    ],
    user => $user,
    cwd  => $path
  }

  File {
    owner => $user,
    group => $user
  }

  ensure_resource(file, $path, { ensure => directory })

  file {
    [
      "${path}/config",
      "${path}/public",
      "${path}/log",
    ]:
      ensure  => directory;

    "${path}/.ruby-version":
      content => $ruby_version;

    "${path}/Gemfile":
      source  => 'puppet:///modules/dummy/Gemfile';

    "${path}/Gemfile.lock":
      source  => 'puppet:///modules/dummy/Gemfile.lock',
      require => File["${path}/Gemfile"],
      notify  => Exec["bundle install"];

    "${path}/config.ru":
      content => template('dummy/config.ru.erb');

    "${path}/config/puma.rb":
      content => template('dummy/puma.rb.erb');
  }

  -> exec { "bundle install":
    refreshonly => true,
  }
}
