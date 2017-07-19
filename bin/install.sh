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
curl -sL https://raw.githubusercontent.com/sanderson/nanobox-phoenix-bootstrap/master/templates/dev.exs > config/dev.exs
curl -sL https://raw.githubusercontent.com/sanderson/nanobox-phoenix-bootstrap/master/templates/prod.exs > config/prod.exs

# running app info
text="
---------------------------------------------------------------------- \n\n
   After your app compiles and starts, view it at $APP_IP:4000 \n\n
---------------------------------------------------------------------- \n
"
printf "$text"

# start your app
mix phoenix.server
