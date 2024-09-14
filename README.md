![Ruby Banitsa][logo] [![Build Status](https://travis-ci.org/gsamokovarov/rubybanitsa.com.svg?branch=master)](https://travis-ci.org/gsamokovarov/rubybanitsa.com)

**Ruby Banitsa** is a meetup in Sofia, Bulgaria. We get together in a casual
setting, we munch a bit of fresh [banitsa] and talk about all those rubies.

Check our [website] for details about past and upcoming events.

## Development

Before running Ruby Banitsa on your local macOS machine, you need the following software:

### Ready...

- Ruby 3.2.2
- libvps
- nodejs v18
- yarn v1
- SQLite3
- hivemind

Install Ruby 3.2.2 with `rbenv`, `chruby` or `asdf`. Use [Homebrew](https://brew.sh) for everything else:

```
brew install vips yarn hivemind
```

With the dependencies installed, setup the project itself with `bin/setup`.

### Steady...

Clone the repo.

```sh
git clone git@github.com:gsamokovarov/rubybanitsa.com.git
```

Setup project environment.

```sh
bin/setup
```

After installing the dependencies, setup admin usage credentials by exporting:

```sh
export ADMIN_NAME=admin
export ADMIN_PASSWORD=admin
```

### Go!

Having the required software and **env**ironment setup run the development server with `hivemind`.

[logo]: https://raw.githubusercontent.com/gsamokovarov/rubybanitsa.com/master/app/assets/images/logo.svg
[banitsa]: https://en.wikipedia.org/wiki/Banitsa
[website]: https://rubybanitsa.com/

## Development

### Setup

Start the application.

```sh
bin/dev
```
