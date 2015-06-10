#!/bin/bash

set -x

ctx logger info "Installing salt"

YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

if [[ ! -z $YUM_CMD ]]; then
   sudo yum install -y epel-release
   sudo yum install -y salt-minion || exit $?   
else
   sudo apt-get update
   sudo apt-get -y install salt-minion || exit $?   
fi

SALT_MASTER=$(ctx node properties salt_master)

echo "master: $SALT_MASTER" | sudo tee -a /etc/salt/minion

ctx logger info "salt-minion installed succesfully"