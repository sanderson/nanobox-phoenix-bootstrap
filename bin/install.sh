#!/bin/sh
set -e

# install Phoenix
echo Y | mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# generate a new phoenix app in the /tmp directory
# and copy the generated files into the /app directory
cd /tmp
echo n | mix phoenix.new app
shopt -s dotglob
cp -a /tmp/app/* /app
cd -

# load dependencies
mix deps.get
yarn install

# update db configs
curl -sL https://github.com/sanderson/nanobox-phoenix-bootstrap/blob/master/templates/dev.exs > config/dev.exs
curl -sL https://github.com/sanderson/nanobox-phoenix-bootstrap/blob/master/templates/prod.exs > config/prod.exs

# start your app
mix phoenix.server
