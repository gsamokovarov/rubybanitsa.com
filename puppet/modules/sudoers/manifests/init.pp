define sudoers($commands, $user = $name, $file = undef) {
  $sudoers_file = $file ? {
    undef   => "/etc/sudoers.d/${user}",
    default => $file
  }

  file { $sudoers_file:
    mode    => '0440',
    owner   => 'root',
    group   => 'root',
    content => template('sudoers/nopasswd.erb')
  }
}
