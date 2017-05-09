define nginx::vhost($content, $enabled = true) {
  include nginx

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
