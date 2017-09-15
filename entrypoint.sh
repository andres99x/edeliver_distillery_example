#!/bin/bash

mix local.hex --force
mix local.rebar --force
mix deps.get

service ssh restart
mix edeliver build release
mix edeliver deploy release staging
mix edeliver start staging

exec "$@"
