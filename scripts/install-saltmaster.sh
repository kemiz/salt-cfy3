#!/bin/bash

set -x

ctx logger info "Installing salt-master"

YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

if [[ ! -z $YUM_CMD ]]; then
   sudo yum install -y epel-release
   sudo yum install -y salt-master || exit $?   
else
   sudo apt-get update
   sudo apt-get -y install salt-master || exit $?   
fi

echo "auto_accept: True" | sudo tee -a /etc/salt/master

chkconfig salt-master on

ctx logger info "salt-master installed succesfully"
