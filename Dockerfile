FROM elixir:1.12.2 as builder

RUN \
  wget https://ziglang.org/download/0.9.0/zig-linux-x86_64-0.9.0.tar.xz && \
  tar -xf zig-linux-x86_64-0.9.0.tar.xz

ENV PATH=$PATH:/zig-linux-x86_64-0.9.0

RUN apt-get update && apt-get install -y \
    gzip \
    p7zip-full \
 && rm -rf /var/lib/apt/lists/*

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

COPY mix.exs /app
COPY mix.lock /app

RUN mix deps.get

ENTRYPOINT ["/app/scripts/release.sh"]


FROM debian:buster-slim as linux_runner

RUN \
  apt-get update -q && \
  apt-get install -qy libtinfo5 libssl-dev

ENV EXAMPLE_CLI_APP_INSTALL_DIR /usr/src/app

WORKDIR /usr/src/app

CMD ["/usr/src/app/example_cli_app_linux", "start"]
