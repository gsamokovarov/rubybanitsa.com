![Ruby Banitsa][logo] [![Build Status](https://travis-ci.org/gsamokovarov/rubybanitsa.com.svg?branch=master)](https://travis-ci.org/gsamokovarov/rubybanitsa.com)

**Ruby Banitsa** is a meetup in Sofia, Bulgaria. We get together in a casual
setting, we munch a bit of fresh [banitsa] and talk about all those rubies.

Check our [website] for details about past and upcoming events.

## Development

Before running Ruby Banitsa on your local macOS machine, you need the following software:

### Ready...

- Ruby 3.2.2
- libvps (`brew install vips`)
- nodejs v18 (`brew install nodejs`)
- yarn v1 (`brew install yarn`)
- PostgreSQL v12+ (`brew install postgresql`)
- hivemind `brew install hivemind`

### Steady...

After installing the dependencies, setup admin usage credentials by exporting:

```
export ADMIN_NAME=admin
export ADMIN_PASSWORD=admin
```

### Go!

Having the required software and **env**ironment setupm run the development server with `hivemind`.

[logo]: https://raw.githubusercontent.com/gsamokovarov/rubybanitsa.com/master/app/assets/images/logo.svg
[banitsa]: https://en.wikipedia.org/wiki/Banitsa
[website]: https://rubybanitsa.com/
