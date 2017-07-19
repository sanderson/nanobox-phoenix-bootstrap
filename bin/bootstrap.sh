#!/bin/sh
set -e

# add a phoenix-specific boxfile.yml
curl -sL https://raw.githubusercontent.com/sanderson/nanobox-phoenix-bootstrap/master/boxfile.yml > boxfile.yml

# start the dev environment
nanobox run "bash <(curl -sL https://raw.githubusercontent.com/sanderson/nanobox-phoenix-bootstrap/master/bin/install.sh)"
