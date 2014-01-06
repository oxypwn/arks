#!/usr/bin/env bash
# Docker
# http://docs.docker.io/en/latest/installation/archlinux/

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 2>&1
    exit 1
fi

if [ -z $REMOTE ]; then
    REMOTE=https://raw.github.com/pandrew/arks/master
    . <(curl -fsL "${REMOTE}/archlinux/_lib/functions.sh")
fi

_installpkg docker
sudo systemctl start docker
sudo systemctl enable docker

