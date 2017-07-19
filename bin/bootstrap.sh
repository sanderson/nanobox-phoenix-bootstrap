#!/bin/sh
set -e

# add a phoenix-specific boxfile.yml
curl -sL https://github.com/sanderson/nanobox-phoenix-bootstrap/blob/master/boxfile.yml > boxfile.yml

# start the dev environment
nanobox run bash <(curl -sL https://github.com/sanderson/nanobox-phoenix-bootstrap/blob/master/bin/install.sh)
