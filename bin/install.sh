#!/bin/sh
set -e

# formatting colors
grn="\x1b[32m"
end="\x1b[0m"

# install Phoenix
printf "\n${grn}+ Installing Phoenix...${end}\n"
echo Y | mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# generate a new phoenix app in the /tmp directory
# and copy the generated files into the /app directory
cd /tmp
echo n | mix phoenix.new app
shopt -s dotglob
cp -a /tmp/app/* /app
cd -

# load dependencies
printf "\n${grn}+ Loading dependencies...${end}\n"
mix deps.get
yarn install

# update db configs
curl -sL https://raw.githubusercontent.com/sanderson/nanobox-phoenix-bootstrap/master/templates/dev.exs > config/dev.exs
curl -sL https://raw.githubusercontent.com/sanderson/nanobox-phoenix-bootstrap/master/templates/prod.exs > config/prod.exs

# running app info
text="
--------------------------------------------------------------------\n
${grn}+ IMPORTANT:
+ After Phoenix compiles and starts, view it at $APP_IP:4000${end}\n
--------------------------------------------------------------------\n
"
printf "$text"

# start your app
mix phoenix.server
