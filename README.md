# BurritoCliExample

Simple CLI app, written in Elixir, to which fetches a random quote

## Installation

### build dependencies

```
brew install zig
brew install gzip
brew install p7zip
```

## Build new production release and run locally on a macos

### Build a new release
```
BURRITO_TARGET=macos MIX_ENV=prod mix release
```

### Run release locally
```
./burrito_out/example_cli_app_macos start
```

* Note: there are some permission issues when building for this platform and
requires `sudo` to build and run


## Run app in a simple docker container

### Run release locally
```
BURRITO_TARGET=linux MIX_ENV=prod mix release
```

### Build docker image for build
```
docker build --target builder -t "burrito_cli_example_build" --no-cache .
```

### Run image and make builds

```
docker run -v $(pwd):/app burrito_cli_example_build
```

### Build docker image for linux
```
docker build --target linux_runner -t "borrito_cli_example_linux" .
```

### Run docker image
```
docker run -v $(pwd)/burrito_out:/usr/src/app borrito_cli_example_linux
```
