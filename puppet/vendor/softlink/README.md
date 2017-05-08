Pointless Symlink for Puppet
============================

A soft link is a symbolic link that we don't care where it points to as long as
it exists.

You can specify a fall back value, to create the symbolic link, if it currently
does not exist.

Usage
-----

```puppet
softlink { '/company/application/rails/current':
  fallback => '/company/application/rails/releases/00000000000000'
}
```

The fall back file is auto-required.
