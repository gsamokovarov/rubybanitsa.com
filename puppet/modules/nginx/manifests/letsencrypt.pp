class nginx::letsencrypt  {
  class { ::letsencrypt:
    email => 'gsamokovarov@gmail.com'
  }

  # This is needed for the ACME challenge serving during the
  # certificates renewal checks.
  file { '/etc/letsencrypt/acme':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
  }

  # Setup an HTTP to HTTPS redirect that serves the ACME challenges
  # as well.
  file { '/etc/nginx/conf.d/letsencrypt.conf':
    source => 'puppet:///modules/nginx/letsencrypt.conf';
  }

  # The webroot plugin will put the renewed certificates in the
  # /etc/letsencrypt/live/rubybanitsa.com-000n folder, keeping
  # the old ones in /etc/letsencrypt/live/rubybanitsa.com.
  #
  # This little "script" will patch this up, as our nginx
  # configs are static and they do expect the certificates in
  # /etc/letsencrypt/live/rubybanitsa.com.
  #
  # We need the webroot plugin because, it let's us renew the
  # certificates without having to stop nginx.
  file { '/usr/local/bin/letsencrypt-post-renewal':
    mode    => '0775',
    content => join([
      "mv /etc/letsencrypt/live/${fqdn} /etc/letsencrypt/live/.${fqdn};\n",
      "mv /etc/letsencrypt/live/${fqdn}-* /etc/letsencrypt/live/${fqdn};\n",
      "\n",
      "/bin/systemctl reload nginx.service"
    ], "")
  }

  ::letsencrypt::certonly { $::fqdn:
    domains              => $domains,
    plugin               => 'webroot',
    webroot_paths        => ['/etc/letsencrypt/acme'],
    manage_cron          => true,
    cron_success_command => '/usr/local/bin/letsencrypt-post-renewal',
    require              => File['/etc/letsencrypt/acme',
                                 '/usr/local/bin/letsencrypt-post-renewal']
  }
}
