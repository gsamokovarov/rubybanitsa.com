define nginx::vhost($content, $www = false, $enabled = true) {
  ensure_resource('class', 'nginx', { www => $www })

  file { "/etc/nginx/sites-available/${name}":
    content => $content,
    notify  => Service['nginx']
  }

  if ($enabled) {
    file { "/etc/nginx/sites-enabled/${name}":
      ensure => link,
      target => "/etc/nginx/sites-available/${name}",
      notify => Service['nginx']
    }
  }
}
