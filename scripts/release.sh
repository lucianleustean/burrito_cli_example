#!/bin/bash

# export BURRITO_TARGET=linux
export MIX_ENV=prod

rm -Rf _build
rm -Rf burrito_out

mix deps.get
mix release
