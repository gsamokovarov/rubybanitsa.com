define server::sudo($user = $title) {
  $commands = [
    '/usr/sbin/service banitsa start',
    '/usr/sbin/service banitsa restart',
    '/usr/sbin/service banitsa reload',
    '/usr/sbin/service banitsa stop',
    '/bin/systemctl status banitsa.service',
    '/bin/journalctl',
  ]

  sudoers { "banitsa sudo permissions for ${user}":
    user     => $user,
    commands => $commands
  }
}
