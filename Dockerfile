FROM debian:buster-slim

RUN \
  apt-get update -q && \
  apt-get install -qy libtinfo5

ENV EXAMPLE_CLI_APP_INSTALL_DIR /usr/src/app

WORKDIR /usr/src/app

COPY ./burrito_out/example_cli_app_linux .

CMD ["./example_cli_app_linux", "start"]
