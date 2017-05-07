class server::packages {
  ensure_packages([
    # Required during the initial bundle install.
    'libsqlite3-dev',
  ])
}
