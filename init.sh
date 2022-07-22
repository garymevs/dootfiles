#!/bin/bash

DOOTFILES_DIR="$HOME/dootfiles"

set -e

if ! [ -x "$(command -v ansible)" ]; then
    sudo apt install ansible -y
fi

ansible-galaxy install fubarhouse.golang
# ansible-galaxy install -r "$DOOTFILES_DIR/reqs.yml"
ansible-playbook --diff "$DOOTFILES_DIR/main.yml"
