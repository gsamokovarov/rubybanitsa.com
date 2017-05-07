class rbenv::packages {
  case $osfamily {
    'Debian': {
      ensure_resource(package, 'git')
      ensure_resource(package, 'autoconf')
      ensure_resource(package, 'bison')
      ensure_resource(package, 'build-essential')
      ensure_resource(package, 'libssl-dev')
      ensure_resource(package, 'libyaml-dev')
      ensure_resource(package, 'libreadline6-dev')
      ensure_resource(package, 'zlib1g-dev')
      ensure_resource(package, 'libncurses5-dev')
      ensure_resource(package, 'libffi-dev')
      ensure_resource(package, 'libgdbm3')
      ensure_resource(package, 'libgdbm-dev')
    }
  }
}
